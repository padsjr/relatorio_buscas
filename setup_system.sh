#!/bin/bash

echo "========================================"
echo "   Configuração do Sistema Linux"
echo "   Sistema de Relatórios de Buscas"
echo "========================================"
echo

# Verifica se está rodando como root
if [ "$EUID" -ne 0 ]; then
    echo "Este script deve ser executado como root (use sudo)"
    exit 1
fi

# Cria usuário específico para o sistema
USERNAME="relatorio"
if ! id "$USERNAME" &>/dev/null; then
    echo "Criando usuário $USERNAME..."
    useradd -m -s /bin/bash $USERNAME
    echo "Usuário $USERNAME criado com sucesso!"
else
    echo "Usuário $USERNAME já existe."
fi

# Cria diretório do projeto
PROJECT_DIR="/home/$USERNAME/relatorio_buscas"
if [ ! -d "$PROJECT_DIR" ]; then
    echo "Criando diretório do projeto..."
    mkdir -p "$PROJECT_DIR"
fi

# Copia arquivos do projeto para o diretório do usuário
echo "Copiando arquivos do projeto..."
cp -r . "$PROJECT_DIR/"
chown -R $USERNAME:$USERNAME "$PROJECT_DIR"

# Define permissões
chmod +x "$PROJECT_DIR"/*.sh
chmod 755 "$PROJECT_DIR/static/uploads"
chmod 755 "$PROJECT_DIR/instance"

# Instala dependências do sistema
echo "Instalando dependências do sistema..."
apt update
apt install -y python3 python3-pip python3-venv nginx

# Configura o Nginx como proxy reverso
echo "Configurando Nginx..."
cat > /etc/nginx/sites-available/relatorio_buscas << EOF
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://127.0.0.1:5000;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }

    location /static {
        alias $PROJECT_DIR/static;
        expires 30d;
        add_header Cache-Control "public, immutable";
    }
}
EOF

# Habilita o site no Nginx
ln -sf /etc/nginx/sites-available/relatorio_buscas /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

# Testa configuração do Nginx
nginx -t
if [ $? -eq 0 ]; then
    systemctl restart nginx
    systemctl enable nginx
    echo "Nginx configurado com sucesso!"
else
    echo "Erro na configuração do Nginx!"
    exit 1
fi

# Configura o serviço systemd
echo "Configurando serviço systemd..."
cp "$PROJECT_DIR/relatorio_buscas.service" /etc/systemd/system/
systemctl daemon-reload
systemctl enable relatorio_buscas

echo
echo "========================================"
echo "   Configuração concluída!"
echo "========================================"
echo
echo "Para iniciar o serviço:"
echo "  sudo systemctl start relatorio_buscas"
echo
echo "Para verificar status:"
echo "  sudo systemctl status relatorio_buscas"
echo
echo "Para ver logs:"
echo "  sudo journalctl -u relatorio_buscas -f"
echo
echo "O sistema estará disponível em:"
echo "  http://localhost"
echo "  http://[IP_DO_SERVIDOR]"
echo
