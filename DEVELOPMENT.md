# Guia de Desenvolvimento

Este documento contém informações técnicas para desenvolvedores que desejam contribuir ou modificar o sistema.

## 🏗️ Arquitetura do Sistema

### Estrutura MVC
- **Model**: Classes SQLAlchemy em `app.py` (Ocorrencia, DiaBusca, RelatorioFinal)
- **View**: Templates HTML em `templates/`
- **Controller**: Rotas Flask em `app.py`

### Fluxo de Dados
1. **Cadastro de Ocorrência**: Formulário → Validação → Banco de Dados
2. **Dias de Busca**: Múltiplos registros vinculados à ocorrência
3. **Finalização**: Relatório final com status da vítima
4. **Geração de DOCX**: Substituição de placeholders nos templates

## 🔧 Desenvolvimento Local

### Configuração do Ambiente
```bash
# Clone o repositório
git clone <url>
cd relatorio_buscas

# Crie ambiente virtual
python -m venv venv

# Ative o ambiente
# Windows
venv\Scripts\activate
# Linux
source venv/bin/activate

# Instale dependências
pip install -r requirements.txt

# Execute em modo debug
python app.py
```

### Estrutura de Banco de Dados

#### Tabela: Ocorrencia
- `id`: Chave primária
- `tipo`: Dados básicos da ocorrência
- `data_fato`, `data_acionamento`: Datas importantes
- `endereco`, `cidade`, `coordenada`: Localização
- `nome_vitima`, `cpf`, `sexo`, `idade`: Dados da vítima
- `img_*`: Caminhos para imagens
- `finalizada`: Status da ocorrência

#### Tabela: DiaBusca
- `id`: Chave primária
- `ocorrencia_id`: FK para Ocorrencia
- `data`, `hora_ini`, `hora_fim`: Período da busca
- `guarnicao`, `recursos`: Equipe e materiais
- `img_*`: Imagens específicas do dia

#### Tabela: RelatorioFinal
- `id`: Chave primária
- `ocorrencia_id`: FK para Ocorrencia
- `status_vitima`, `estado_biologico`: Resultado
- `coordenada_vitima`: Localização final
- `img_*`: Imagens do resultado

## 📝 Sistema de Templates DOCX

### Placeholders Suportados
O sistema substitui os seguintes padrões nos templates:

#### Texto
- `{{chave}}` - Substituição direta
- `substituir_chave` - Substituição por frase
- `[chave]` - Substituição alternativa

#### Imagens
- `inserir_imagem_chave` - Insere imagem no local
- `inserir imagem descrição fornecida pelo usuario` - Padrão específico

### Funções de Substituição
- `replace_placeholders()`: Substitui placeholders simples
- `replace_phrase_map()`: Substitui frases completas
- `append_document()`: Anexa documentos DOCX

## 🧪 Testes

### Teste Manual
1. Acesse `http://localhost:5000`
2. Crie uma nova ocorrência
3. Adicione dias de busca
4. Finalize a ocorrência
5. Gere o relatório

### Teste de Upload
- Teste upload de imagens em diferentes formatos
- Verifique se as imagens são salvas corretamente
- Teste geração de relatório com imagens

## 🐛 Debugging

### Logs
O sistema imprime logs no console:
- `[upload]`: Confirmação de upload de arquivos
- `[imagem]`: Processamento de imagens nos templates

### Problemas Comuns
1. **Erro de COM**: Removido, sistema não usa mais docx2pdf
2. **Arquivo não encontrado**: Verifique caminhos dos templates
3. **Erro de permissão**: Verifique permissões da pasta uploads

## 🚀 Deploy

### Configuração de Produção
1. Configure variáveis de ambiente
2. Use servidor WSGI (Gunicorn/Waitress)
3. Configure proxy reverso (Nginx/Apache)
4. Implemente backup do banco de dados

### Variáveis de Ambiente
```bash
export FLASK_DEBUG=False
export SECRET_KEY=chave-super-segura
export DATABASE_URL=postgresql://user:pass@host/db
```

## 📚 Dependências

### Principais
- **Flask**: Framework web
- **SQLAlchemy**: ORM para banco de dados
- **python-docx**: Geração de documentos DOCX
- **Pillow**: Processamento de imagens

### Desenvolvimento
- **Werkzeug**: Servidor de desenvolvimento
- **Jinja2**: Engine de templates

## 🔄 Contribuição

### Padrões de Código
- Use snake_case para variáveis e funções
- Use PascalCase para classes
- Comente funções complexas
- Mantenha funções pequenas e focadas

### Estrutura de Commits
```
feat: adiciona nova funcionalidade
fix: corrige bug
docs: atualiza documentação
style: formatação de código
refactor: refatoração sem mudança de funcionalidade
```

## 📋 TODO

- [ ] Implementar testes automatizados
- [ ] Adicionar validação de tipos de arquivo
- [ ] Implementar backup automático
- [ ] Adicionar autenticação de usuários
- [ ] Melhorar interface de usuário
- [ ] Implementar relatórios em PDF nativo
