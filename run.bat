@echo off
echo ========================================
echo   Sistema de Relatorios de Buscas
echo ========================================
echo.

REM Verifica se o ambiente virtual existe
if not exist "venv" (
    echo Criando ambiente virtual...
    python -m venv venv
    if errorlevel 1 (
        echo Erro ao criar ambiente virtual!
        pause
        exit /b 1
    )
)

REM Ativa o ambiente virtual
echo Ativando ambiente virtual...
call venv\Scripts\activate.bat

REM Instala dependencias se necessario
echo Verificando dependencias...
pip install -r requirements.txt

REM Cria pasta de uploads se nao existir
if not exist "static\uploads" (
    echo Criando pasta de uploads...
    mkdir static\uploads
)

REM Executa a aplicacao
echo.
echo Iniciando aplicacao...
echo Acesse: http://localhost:5000
echo.
python app.py

pause
