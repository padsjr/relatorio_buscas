#!/bin/bash

echo "========================================"
echo "   Sistema de Relatórios de Buscas"
echo "========================================"
echo

# Verifica se o ambiente virtual existe
if [ ! -d "venv" ]; then
    echo "Criando ambiente virtual..."
    python3 -m venv venv
    if [ $? -ne 0 ]; then
        echo "Erro ao criar ambiente virtual!"
        exit 1
    fi
fi

# Ativa o ambiente virtual
echo "Ativando ambiente virtual..."
source venv/bin/activate

# Instala dependências se necessário
echo "Verificando dependências..."
pip install -r requirements.txt

# Cria pasta de uploads se não existir
if [ ! -d "static/uploads" ]; then
    echo "Criando pasta de uploads..."
    mkdir -p static/uploads
fi

# Executa a aplicação
echo
echo "Iniciando aplicação..."
echo "Acesse: http://localhost:5000"
echo
python app.py
