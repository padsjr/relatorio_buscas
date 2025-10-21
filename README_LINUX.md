# 🐧 Sistema de Relatórios de Buscas - Linux

## 📁 Arquivos Criados para Linux

Os seguintes arquivos foram criados especificamente para execução em Linux:

### Scripts de Instalação e Execução
- `install_linux.sh` - Script de instalação automática
- `run_linux.sh` - Script para executar em modo desenvolvimento
- `start_service.sh` - Script para executar em modo produção
- `setup_system.sh` - Script para configurar como serviço do sistema

### Configuração
- `relatorio_buscas.service` - Arquivo de serviço systemd
- `INSTALACAO_LINUX.md` - Documentação completa de instalação

### Arquivos Modificados
- `requirements.txt` - Adicionado Gunicorn para produção
- `app.py` - Configurações específicas para Linux

## 🚀 Como Usar no Linux

### 1. Transferir Arquivos
Copie todos os arquivos do projeto para o servidor Linux.

### 2. Tornar Scripts Executáveis
```bash
chmod +x install_linux.sh run_linux.sh start_service.sh setup_system.sh
```

### 3. Instalação Rápida
```bash
./install_linux.sh
```

### 4. Executar Sistema
```bash
# Modo desenvolvimento
./run_linux.sh

# Modo produção
./start_service.sh
```

## 🔧 Configuração como Serviço

Para configurar como serviço do sistema (execução automática):

```bash
# Executar como root
sudo ./setup_system.sh

# Iniciar serviço
sudo systemctl start relatorio_buscas

# Habilitar inicialização automática
sudo systemctl enable relatorio_buscas
```

## 📋 Pré-requisitos Linux

- Python 3.8+
- pip3
- nginx (para produção)
- systemd (para serviço)

## 🌐 Acesso

Após a instalação:
- **Desenvolvimento**: http://localhost:5000
- **Produção**: http://[IP_DO_SERVIDOR]

## 📚 Documentação Completa

Consulte o arquivo `INSTALACAO_LINUX.md` para instruções detalhadas de instalação, configuração e solução de problemas.
