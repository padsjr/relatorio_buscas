#!/bin/bash

echo "========================================"
echo "   Sistema de Relatórios de Buscas"
echo "   Linux - Modo Desenvolvimento"
echo "========================================"
echo

# Verifica se o ambiente virtual existe
if [ ! -d "venv" ]; then
    echo "Ambiente virtual não encontrado!"
    echo "Execute primeiro: ./install_linux.sh"
    exit 1
fi

# Ativa o ambiente virtual
echo "Ativando ambiente virtual..."
source venv/bin/activate

# Verifica se as dependências estão instaladas
echo "Verificando dependências..."
pip list | grep -q Flask
if [ $? -ne 0 ]; then
    echo "Dependências não encontradas. Instalando..."
    pip install -r requirements.txt
fi

# Cria pastas necessárias se não existirem
mkdir -p static/uploads
mkdir -p instance
mkdir -p logs

# Define permissões
chmod 755 static/uploads
chmod 755 instance

# Carrega variáveis de ambiente se o arquivo .env existir
if [ -f ".env" ]; then
    echo "Carregando variáveis de ambiente..."
    export $(cat .env | grep -v '^#' | xargs)
fi

# Executa a aplicação
echo
echo "Iniciando aplicação em modo desenvolvimento..."
echo "Acesse: http://localhost:5000"
echo "Para parar, pressione Ctrl+C"
echo

# Usa o Flask em modo desenvolvimento
export FLASK_APP=app.py
export FLASK_ENV=development
python app.py
