# Guia de Migração para Railway

Railway oferece **512MB de RAM gratuitos** (mesmo que Render), mas com melhor gerenciamento de recursos e menos restrições.

## Por que Railway?

- ✅ **512MB RAM gratuitos** (mesmo que Render)
- ✅ **Melhor gerenciamento de memória** (menos crashes)
- ✅ **Deploy automático via Git**
- ✅ **Banco de dados PostgreSQL gratuito incluído**
- ✅ **Logs mais detalhados**
- ✅ **$5 de crédito grátis** para começar

## Passo a Passo

### 1. Criar conta no Railway

1. Acesse: https://railway.app
2. Faça login com GitHub
3. Aceite os termos

### 2. Criar novo projeto

1. Clique em **"New Project"**
2. Selecione **"Deploy from GitHub repo"**
3. Escolha seu repositório do GitHub
4. Railway detectará automaticamente que é um app Python

### 3. Configurar variáveis de ambiente

No dashboard do Railway, vá em **Variables** e adicione:

```
FLASK_CONFIG=production
SECRET_KEY=sua-chave-secreta-aqui-aleatoria
DATABASE_URL=postgresql://... (Railway cria automaticamente)
```

### 4. Configurar banco de dados

1. No projeto Railway, clique em **"New"** → **"Database"** → **"Add PostgreSQL"**
2. Railway criará automaticamente a variável `DATABASE_URL`
3. O app já está configurado para usar essa variável!

### 5. Configurar build e start

Railway detecta automaticamente, mas você pode criar um arquivo `railway.json`:

```json
{
  "$schema": "https://railway.app/railway.schema.json",
  "build": {
    "builder": "NIXPACKS"
  },
  "deploy": {
    "startCommand": "gunicorn app:app --bind 0.0.0.0:$PORT --workers 1 --threads 4 --timeout 300 --worker-class sync --max-requests 100 --max-requests-jitter 10",
    "restartPolicyType": "ON_FAILURE",
    "restartPolicyMaxRetries": 10
  }
}
```

### 6. Deploy

Railway fará deploy automaticamente quando você fizer push para o GitHub!

## Arquivos necessários

Crie um arquivo `railway.json` na raiz do projeto (já criado acima).s

## Comparação: Render vs Railway

| Recurso | Render (Free) | Railway (Free) |
|---------|---------------|----------------|
| RAM | 512MB | 512MB |
| CPU | Limitado | Limitado |
| Timeout | 90s (configurável) | Sem limite rígido |
| Deploy | Automático | Automático |
| Banco de dados | Separado | Incluído |
| Logs | Básicos | Detalhados |
| Estabilidade | ⚠️ Pode matar processos | ✅ Mais estável |

## Alternativa: Fly.io

Se Railway também não funcionar, considere **Fly.io**:

- ✅ **256MB RAM gratuitos** (menos, mas muito eficiente)
- ✅ **CPU compartilhado**
- ✅ **Muito estável**
- ✅ **Deploy rápido**

### Migrar para Fly.io

1. Instale o CLI: `curl -L https://fly.io/install.sh | sh`
2. Login: `fly auth login`
3. No diretório do projeto: `fly launch`
4. Siga as instruções

## Recomendação

**Tente Railway primeiro** - tem os mesmos recursos do Render mas com melhor gerenciamento. Se ainda assim houver problemas, as otimizações ultra-agressivas que implementamos devem ajudar.

