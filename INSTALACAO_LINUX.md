# Sistema de Relatórios de Buscas - Instalação Linux

Este guia fornece instruções completas para instalar e configurar o Sistema de Relatórios de Buscas em um servidor Linux.

## 📋 Pré-requisitos

- Ubuntu 18.04+ ou Debian 10+ (recomendado)
- Python 3.8 ou superior
- 2GB RAM mínimo (4GB recomendado)
- 10GB espaço em disco
- Acesso root ou sudo

## 🚀 Instalação Rápida

### 1. Download e Preparação

```bash
# Clone ou baixe o projeto
git clone <url-do-repositorio> relatorio_buscas
cd relatorio_buscas

# Ou se você já tem os arquivos:
cd relatorio_buscas
```

### 2. Instalação Automática

```bash
# Torne o script executável
chmod +x install_linux.sh

# Execute a instalação
./install_linux.sh
```

### 3. Iniciar o Sistema

```bash
# Modo desenvolvimento
./run_linux.sh

# Modo produção
./start_service.sh
```

## 🔧 Instalação Manual

### 1. Instalar Dependências do Sistema

```bash
sudo apt update
sudo apt install -y python3 python3-pip python3-venv nginx
```

### 2. Criar Usuário do Sistema

```bash
sudo useradd -m -s /bin/bash relatorio
```

### 3. Configurar Projeto

```bash
# Copiar arquivos para o diretório do usuário
sudo cp -r . /home/relatorio/relatorio_buscas/
sudo chown -R relatorio:relatorio /home/relatorio/relatorio_buscas/
cd /home/relatorio/relatorio_buscas/

# Criar ambiente virtual
sudo -u relatorio python3 -m venv venv
sudo -u relatorio ./venv/bin/pip install -r requirements.txt
```

### 4. Configurar Nginx

```bash
# Criar configuração do Nginx
sudo tee /etc/nginx/sites-available/relatorio_buscas << EOF
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
        alias /home/relatorio/relatorio_buscas/static;
        expires 30d;
        add_header Cache-Control "public, immutable";
    }
}
EOF

# Habilitar site
sudo ln -s /etc/nginx/sites-available/relatorio_buscas /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl restart nginx
```

### 5. Configurar Serviço Systemd

```bash
# Copiar arquivo de serviço
sudo cp relatorio_buscas.service /etc/systemd/system/

# Recarregar systemd e habilitar serviço
sudo systemctl daemon-reload
sudo systemctl enable relatorio_buscas
sudo systemctl start relatorio_buscas
```

## 🛠️ Configuração Avançada

### Variáveis de Ambiente

Crie um arquivo `.env` na raiz do projeto:

```bash
# Configurações do Flask
FLASK_APP=app.py
FLASK_ENV=production

# Segurança
SECRET_KEY=sua_chave_secreta_muito_segura_aqui

# Banco de dados
DATABASE_URL=sqlite:///instance/relatorios.db

# Servidor
HOST=0.0.0.0
PORT=5000
WORKERS=4
TIMEOUT=120
```

### Configuração de Firewall

```bash
# Permitir tráfego HTTP
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# Se usar porta personalizada
sudo ufw allow 5000/tcp
```

### Backup do Banco de Dados

```bash
# Script de backup
#!/bin/bash
BACKUP_DIR="/home/relatorio/backups"
DATE=$(date +%Y%m%d_%H%M%S)
mkdir -p $BACKUP_DIR
cp /home/relatorio/relatorio_buscas/instance/relatorios.db $BACKUP_DIR/relatorios_$DATE.db
echo "Backup criado: $BACKUP_DIR/relatorios_$DATE.db"
```

## 📊 Monitoramento

### Verificar Status do Serviço

```bash
# Status do serviço
sudo systemctl status relatorio_buscas

# Logs em tempo real
sudo journalctl -u relatorio_buscas -f

# Logs de acesso do Nginx
sudo tail -f /var/log/nginx/access.log

# Logs de erro do Nginx
sudo tail -f /var/log/nginx/error.log
```

### Reiniciar Serviços

```bash
# Reiniciar aplicação
sudo systemctl restart relatorio_buscas

# Reiniciar Nginx
sudo systemctl restart nginx

# Reiniciar tudo
sudo systemctl restart relatorio_buscas nginx
```

## 🔒 Segurança

### 1. Configurar SSL (HTTPS)

```bash
# Instalar Certbot
sudo apt install certbot python3-certbot-nginx

# Obter certificado SSL
sudo certbot --nginx -d seu-dominio.com

# Renovação automática
sudo crontab -e
# Adicionar: 0 12 * * * /usr/bin/certbot renew --quiet
```

### 2. Configurar Firewall

```bash
# Configurar UFW
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
```

### 3. Atualizações de Segurança

```bash
# Atualizar sistema
sudo apt update && sudo apt upgrade -y

# Atualizar dependências Python
sudo -u relatorio /home/relatorio/relatorio_buscas/venv/bin/pip install --upgrade -r requirements.txt
```

## 🐛 Solução de Problemas

### Problema: Serviço não inicia

```bash
# Verificar logs
sudo journalctl -u relatorio_buscas -n 50

# Verificar permissões
ls -la /home/relatorio/relatorio_buscas/
sudo chown -R relatorio:relatorio /home/relatorio/relatorio_buscas/
```

### Problema: Erro 502 Bad Gateway

```bash
# Verificar se a aplicação está rodando
sudo netstat -tlnp | grep :5000

# Verificar logs do Nginx
sudo tail -f /var/log/nginx/error.log
```

### Problema: Erro de permissão

```bash
# Corrigir permissões
sudo chown -R relatorio:relatorio /home/relatorio/relatorio_buscas/
sudo chmod -R 755 /home/relatorio/relatorio_buscas/static/uploads/
```

## 📝 Comandos Úteis

```bash
# Iniciar serviço
sudo systemctl start relatorio_buscas

# Parar serviço
sudo systemctl stop relatorio_buscas

# Reiniciar serviço
sudo systemctl restart relatorio_buscas

# Ver status
sudo systemctl status relatorio_buscas

# Ver logs
sudo journalctl -u relatorio_buscas -f

# Testar configuração do Nginx
sudo nginx -t

# Recarregar Nginx
sudo systemctl reload nginx
```

## 🌐 Acesso

Após a instalação, o sistema estará disponível em:

- **Desenvolvimento**: http://localhost:5000
- **Produção**: http://[IP_DO_SERVIDOR]
- **Com domínio**: http://seu-dominio.com

## 📞 Suporte

Para problemas ou dúvidas:

1. Verifique os logs do sistema
2. Consulte a documentação
3. Verifique as permissões de arquivo
4. Confirme se todas as dependências estão instaladas

---

**Nota**: Este sistema foi testado em Ubuntu 20.04 LTS e Debian 11. Para outras distribuições, alguns comandos podem variar.
