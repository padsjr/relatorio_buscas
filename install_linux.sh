#!/bin/bash

echo "========================================"
echo "   Sistema de Relatórios de Buscas"
echo "   Instalação para Linux"
echo "========================================"
echo

# Verifica se está rodando como root
if [ "$EUID" -eq 0 ]; then
    echo "AVISO: Não execute este script como root!"
    echo "Execute como usuário normal e use sudo quando necessário."
    exit 1
fi

# Verifica se o Python 3 está instalado
if ! command -v python3 &> /dev/null; then
    echo "Python 3 não encontrado. Instalando..."
    sudo apt update
    sudo apt install -y python3 python3-pip python3-venv
fi

# Verifica se o pip está instalado
if ! command -v pip3 &> /dev/null; then
    echo "pip3 não encontrado. Instalando..."
    sudo apt install -y python3-pip
fi

# Cria diretório do projeto se não existir
PROJECT_DIR="$HOME/relatorio_buscas"
if [ ! -d "$PROJECT_DIR" ]; then
    echo "Criando diretório do projeto em $PROJECT_DIR"
    mkdir -p "$PROJECT_DIR"
fi

cd "$PROJECT_DIR"

# Cria ambiente virtual
echo "Criando ambiente virtual Python..."
python3 -m venv venv
if [ $? -ne 0 ]; then
    echo "Erro ao criar ambiente virtual!"
    exit 1
fi

# Ativa o ambiente virtual
echo "Ativando ambiente virtual..."
source venv/bin/activate

# Atualiza pip
echo "Atualizando pip..."
pip install --upgrade pip

# Instala dependências
echo "Instalando dependências Python..."
pip install -r requirements.txt
if [ $? -ne 0 ]; then
    echo "Erro ao instalar dependências!"
    exit 1
fi

# Cria diretórios necessários
echo "Criando diretórios necessários..."
mkdir -p static/uploads
mkdir -p instance
mkdir -p logs

# Define permissões
echo "Configurando permissões..."
chmod +x run_linux.sh
chmod +x start_service.sh
chmod 755 static/uploads
chmod 755 instance

# Cria arquivo de configuração se não existir
if [ ! -f "config.py" ]; then
    echo "Criando arquivo de configuração..."
    cat > config.py << EOF
import os

class Config:
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'sua_chave_secreta_muito_segura_aqui'
    SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL') or 'sqlite:///instance/relatorios.db'
    UPLOAD_FOLDER = 'static/uploads'
    MAX_CONTENT_LENGTH = 16 * 1024 * 1024  # 16MB max file size

class DevelopmentConfig(Config):
    DEBUG = True

class ProductionConfig(Config):
    DEBUG = False

config = {
    'development': DevelopmentConfig,
    'production': ProductionConfig,
    'default': DevelopmentConfig
}
EOF
fi

# Cria arquivo .env para variáveis de ambiente
if [ ! -f ".env" ]; then
    echo "Criando arquivo .env..."
    cat > .env << EOF
FLASK_APP=app.py
FLASK_ENV=development
SECRET_KEY=sua_chave_secreta_muito_segura_aqui
DATABASE_URL=sqlite:///instance/relatorios.db
EOF
fi

echo
echo "========================================"
echo "   Instalação concluída com sucesso!"
echo "========================================"
echo
echo "Para iniciar o sistema:"
echo "  ./run_linux.sh"
echo
echo "Para iniciar em modo produção:"
echo "  ./start_service.sh"
echo
echo "O sistema estará disponível em:"
echo "  http://localhost:5000"
echo
echo "Para parar o sistema, pressione Ctrl+C"
echo
