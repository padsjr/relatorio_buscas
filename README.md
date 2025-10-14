# Sistema de Relatórios de Buscas

Sistema web para geração de relatórios de buscas e salvamento, desenvolvido em Flask com interface web para coleta de dados e geração automática de documentos DOCX.

## 📋 Funcionalidades

- **Cadastro de Ocorrências**: Formulário completo para registro de ocorrências de busca
- **Gestão de Dias de Busca**: Adição de múltiplos dias de busca para cada ocorrência
- **Relatório Final**: Finalização com status da vítima e resultados
- **Geração de Documentos**: Criação automática de relatórios em formato DOCX
- **Upload de Imagens**: Suporte para anexar imagens aos relatórios
- **Interface Web**: Interface amigável para preenchimento dos dados

## 🛠️ Tecnologias Utilizadas

- **Backend**: Python 3.13, Flask, SQLAlchemy
- **Frontend**: HTML5, CSS3, JavaScript
- **Banco de Dados**: SQLite
- **Geração de Documentos**: python-docx
- **Processamento de Imagens**: Pillow

## 📋 Pré-requisitos

### Windows
- Python 3.13 ou superior
- Git (opcional, para clonagem)

### Linux (Ubuntu/Debian)
- Python 3.13 ou superior
- pip3
- Git (opcional, para clonagem)

### Linux (CentOS/RHEL/Fedora)
- Python 3.13 ou superior
- pip3
- Git (opcional, para clonagem)

## 🚀 Instalação

### 1. Clone ou baixe o repositório

```bash
git clone <url-do-repositorio>
cd relatorio_buscas
```

### 2. Crie um ambiente virtual

#### Windows (PowerShell)
```powershell
python -m venv venv
venv\Scripts\Activate.ps1
```

#### Windows (CMD)
```cmd
python -m venv venv
venv\Scripts\activate.bat
```

#### Linux (Ubuntu/Debian/CentOS/RHEL/Fedora)
```bash
python3 -m venv venv
source venv/bin/activate
```

### 3. Instale as dependências

```bash
pip install -r requirements.txt
```

## 🏃‍♂️ Executando o Sistema

### Método 1: Scripts Automáticos (Recomendado)

#### Windows
Execute o arquivo `run.bat`:
```cmd
run.bat
```

#### Linux
Execute o arquivo `run.sh`:
```bash
./run.sh
```

### Método 2: Execução Manual

#### 1. Ative o ambiente virtual (se não estiver ativo)

##### Windows (PowerShell)
```powershell
venv\Scripts\Activate.ps1
```

##### Windows (CMD)
```cmd
venv\Scripts\activate.bat
```

##### Linux
```bash
source venv/bin/activate
```

#### 2. Execute a aplicação

```bash
python app.py
```

### 3. Acesse o sistema

Abra seu navegador e acesse: `http://localhost:5000`

## 📁 Estrutura do Projeto

```
relatorio_buscas/
├── app.py                          # Aplicação principal Flask
├── config.py                       # Configurações da aplicação
├── requirements.txt                # Dependências Python
├── README.md                      # Este arquivo
├── INSTRUCOES_CONVERSAO_PDF.md    # Instruções para conversão PDF
├── run.bat                        # Script de execução Windows
├── run.sh                         # Script de execução Linux
├── .gitignore                     # Arquivos ignorados pelo Git
├── instance/
│   └── relatorios.db             # Banco de dados SQLite
├── static/
│   └── uploads/                   # Pasta para upload de imagens
├── templates/                     # Templates HTML
│   ├── index.html
│   ├── form_ocorrencia.html
│   ├── form_dia.html
│   ├── form_final.html
│   └── ...
├── modelo_introducao_buscas.docx  # Template de introdução
├── modelo_buscas_por_dias.docx    # Template de dias de busca
├── modelo_resultado_final_buscas.docx # Template de resultado final
└── venv/                         # Ambiente virtual (não versionar)
```

## 🔧 Configuração

### Configurações Básicas
O sistema utiliza o arquivo `config.py` para configurações. Você pode personalizar:

- **Banco de Dados**: SQLite por padrão, configurável via `DATABASE_URL`
- **Upload de Imagens**: Pasta `static/uploads/` com limite de 16MB por arquivo
- **Templates DOCX**: Caminhos dos templates de relatório
- **Modo Debug**: Ativado em desenvolvimento, desativado em produção

### Variáveis de Ambiente (Opcional)
Para personalizar o sistema, defina as seguintes variáveis:

```bash
# Windows
set FLASK_DEBUG=True
set SECRET_KEY=sua-chave-secreta-aqui
set DATABASE_URL=sqlite:///meu_banco.db

# Linux
export FLASK_DEBUG=True
export SECRET_KEY=sua-chave-secreta-aqui
export DATABASE_URL=sqlite:///meu_banco.db
```

### Banco de Dados
O sistema utiliza SQLite como banco de dados padrão. O arquivo `relatorios.db` é criado automaticamente na pasta `instance/` na primeira execução.

### Upload de Imagens
As imagens são salvas na pasta `static/uploads/`. Certifique-se de que esta pasta existe e tem permissões de escrita.

### Templates DOCX
O sistema utiliza três templates DOCX para geração dos relatórios:
- `modelo_introducao_buscas.docx` - Introdução do relatório
- `modelo_buscas_por_dias.docx` - Template para cada dia de busca
- `modelo_resultado_final_buscas.docx` - Resultado final

## 📖 Como Usar

### 1. Cadastrar Nova Ocorrência
1. Acesse a página inicial
2. Clique em "Nova Ocorrência"
3. Preencha todos os dados da ocorrência
4. Faça upload das imagens necessárias
5. Clique em "Salvar"

### 2. Adicionar Dias de Busca
1. Na lista de ocorrências, clique em "Novo Dia"
2. Preencha os dados do dia de busca
3. Faça upload das imagens do dia
4. Clique em "Salvar"

### 3. Finalizar Ocorrência
1. Na lista de ocorrências, clique em "Finalizar"
2. Preencha os dados do resultado final
3. Faça upload das imagens finais
4. Clique em "Salvar"

### 4. Gerar Relatório
1. Na lista de ocorrências, clique em "Gerar"
2. O sistema criará um arquivo DOCX com o relatório completo
3. O arquivo será baixado automaticamente

## 🔄 Conversão para PDF

O sistema gera relatórios em formato DOCX. Para converter para PDF, consulte o arquivo `INSTRUCOES_CONVERSAO_PDF.md` que contém várias opções:

- Microsoft Word
- Google Docs
- LibreOffice Writer
- Conversores online

## 🐛 Solução de Problemas

### Erro de Permissão no Windows
Se encontrar erro de permissão ao executar scripts PowerShell:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Erro de Módulo não encontrado
Certifique-se de que o ambiente virtual está ativo e as dependências foram instaladas:
```bash
pip install -r requirements.txt
```

### Erro de Banco de Dados
Se houver problemas com o banco de dados, delete o arquivo `instance/relatorios.db` e reinicie a aplicação.

### Problemas com Upload de Imagens
Verifique se a pasta `static/uploads/` existe e tem permissões de escrita.

## 🔒 Segurança

- O sistema utiliza `secure_filename()` para sanitizar nomes de arquivos
- Uploads são limitados à pasta `static/uploads/`
- Validação de tipos de arquivo é recomendada para produção

## 🚀 Deploy em Produção

Para deploy em produção, considere:

1. **Configuração de Produção**:
   ```python
   app.config['DEBUG'] = False
   app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///production.db'
   ```

2. **Servidor WSGI**: Use Gunicorn (Linux) ou Waitress (Windows)

3. **Proxy Reverso**: Configure Nginx ou Apache

4. **HTTPS**: Configure certificados SSL

5. **Backup**: Implemente backup regular do banco de dados

## 📝 Licença

Este projeto é de uso interno. Consulte os termos de licença das dependências utilizadas.

## 🤝 Suporte

Para suporte técnico ou dúvidas sobre o sistema, consulte a documentação ou entre em contato com a equipe de desenvolvimento.

---

**Desenvolvido para geração automatizada de relatórios de buscas e salvamento.**
