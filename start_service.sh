#!/bin/bash

echo "========================================"
echo "   Sistema de Relatórios de Buscas"
echo "   Linux - Modo Produção"
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
pip list | grep -q gunicorn
if [ $? -ne 0 ]; then
    echo "Gunicorn não encontrado. Instalando..."
    pip install gunicorn
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

# Configurações do Gunicorn
HOST=${HOST:-"0.0.0.0"}
PORT=${PORT:-5000}
WORKERS=${WORKERS:-4}
TIMEOUT=${TIMEOUT:-120}

echo
echo "Iniciando aplicação em modo produção..."
echo "Host: $HOST"
echo "Porta: $PORT"
echo "Workers: $WORKERS"
echo "Timeout: $TIMEOUT segundos"
echo
echo "Acesse: http://$HOST:$PORT"
echo "Para parar, pressione Ctrl+C"
echo

# Executa com Gunicorn
gunicorn --bind $HOST:$PORT \
         --workers $WORKERS \
         --timeout $TIMEOUT \
         --access-logfile logs/access.log \
         --error-logfile logs/error.log \
         --log-level info \
         --preload \
         app:app
