# Placeholders para Modelo DOCX - Dias de Busca

## Placeholders Disponíveis para Substituição nos Dias de Busca

### Informações Básicas da Ocorrência
- `{{tipo}}` - Tipo de ocorrência (Busca Terrestre ou Busca Marítima)
- `{{data_fato}}` - Data do fato
- `{{data_acionamento}}` - Data de acionamento
- `{{link}}` - Link com tracks do Google Earth
- `{{endereco}}` - Endereço do local
- `{{cidade}}` - Cidade do local
- `{{complemento}}` - Complemento do local
- `{{coordenada}}` - Coordenadas do local

### Dados da Vítima
- `{{nome_vitima}}` - Nome da vítima
- `{{cpf}}` - CPF da vítima
- `{{sexo}}` - Sexo da vítima
- `{{idade}}` - Idade da vítima
- `{{filiacao}}` - Filiação da vítima
- `{{naturalidade}}` - Naturalidade da vítima
- `{{contatos}}` - Contatos da vítima
- `{{enderecos}}` - Endereços da vítima
- `{{vestimentas}}` - Vestimentas da vítima
- `{{caracteristicas_vitima}}` - Características da vítima
- `{{condicoes_neurologicas}}` - Condições neurológicas
- `{{inf_medicas}}` - Informações médicas
- `{{experiencia_e_resistencia}}` - Experiência e resistência

### Características da Área de Busca
- `{{tipo_terreno_agua}}` - Tipo de terreno/água (Terrestre, Mar, Rio, Lago)
- `{{condicoes_do_tipo_terreno}}` - Condições do terreno
- `{{condicoes_climaticas}}` - Condições climáticas

### Informações Específicas do Dia de Busca
- `{{dia_indice}}` - Número do dia (1, 2, 3, etc.)
- `{{dia_nome}}` - Nome do dia (primeiro, segundo, terceiro, etc.)
- `{{dia_data}}` - Data do dia de busca
- `{{dia_hora_inicio}}` - Hora de início
- `{{dia_hora_fim}}` - Hora de fim
- `{{dia_numero_ocorrencia}}` - Número da ocorrência
- `{{dia_condicoes}}` - Condições do dia
- `{{dia_temp_inicial}}` - Temperatura inicial
- `{{dia_temp_final}}` - Temperatura final
- `{{dia_guarnicao}}` - Guarnição
- `{{dia_recursos}}` - Recursos utilizados
- `{{dia_historico}}` - Histórico do dia
- `{{dia_status_vitima}}` - Status da vítima (Localizada/Não localizada)

### Imagens
- `{{img_tab_mare_dia}}` - Imagem da tábua de maré do dia
- `{{img_prev_temp_dia}}` - Imagem de previsão do dia
- `{{img_traj_buscas_dia}}` - Imagem de trajetos das buscas do dia

### Placeholders com Frases Completas (para substituição de texto)
- `substituir pelo nome do dia fornecido pelo usuario` - Nome do dia (primeiro, segundo, etc.)
- `substituir pela data do dia fornecido pelo usuario` - Data do dia
- `substituir pelo horario de inicio fornecido pelo usuario` - Horário de início
- `substituir pelo horario de fim fornecido pelo usuario` - Horário de fim
- `substituir pelo numero da ocorrencia fornecido pelo usuario` - Número da ocorrência
- `substituir pelas condicoes fornecidas pelo usuario` - Condições do dia
- `substituir pela temperatura inicial fornecida pelo usuario` - Temperatura inicial
- `substituir pela temperatura final fornecida pelo usuario` - Temperatura final
- `substituir pela guarnicao fornecida pelo usuario` - Guarnição
- `substituir pelos recursos fornecidos pelo usuario` - Recursos
- `substituir pelo historico do dia fornecido pelo usuario` - Histórico do dia
- `substituir pelo status da vitima fornecido pelo usuario` - Status da vítima

### Placeholders para Imagens (para inserção de imagens)
- `inserir imagem tábua de maré do dia fornecida pelo usuario` - Tábua de maré
- `inserir imagem de previsao do dia fornecida pelo usuario` - Previsão do dia
- `inserir imagem de trajetos das buscas fornecida pelo usuario` - Trajetos das buscas

## Exemplo de Uso no Modelo DOCX

```
DIA {{dia_nome|upper}} DE BUSCA - {{dia_data}}

Data: {{dia_data}}
Horário: {{dia_hora_inicio}} às {{dia_hora_fim}}
Status da Vítima: {{dia_status_vitima}}

Histórico:
{{dia_historico}}

Recursos Utilizados:
{{dia_recursos}}

Guarnição:
{{dia_guarnicao}}
```

## Tratamento de Valores Vazios

Quando um campo não é preenchido pelo usuário, o sistema automaticamente substitui o placeholder por "Não informado":

- Campo vazio: `{{nome_vitima}}` → "Não informado"
- Campo None: `{{cpf}}` → "Não informado"  
- Campo com espaços: `{{endereco}}` → "Não informado"

**Exemplo prático:**
```
Nome da Vítima: {{nome_vitima}}
CPF: {{cpf}}
Endereço: {{endereco}}
```

Se os campos não forem preenchidos, o resultado será:
```
Nome da Vítima: Não informado
CPF: Não informado
Endereço: Não informado
```

## Observações Importantes

1. **Numeração Automática**: O sistema gera automaticamente a numeração dos dias (1º, 2º, 3º, etc.) e os nomes correspondentes (primeiro, segundo, terceiro, etc.).

2. **Status da Vítima**: Campo obrigatório que deve ser preenchido ao final de cada dia de busca.

3. **Tipo de Terreno**: Preenchido automaticamente baseado no tipo de ocorrência:
   - Busca Terrestre → Terrestre
   - Busca Marítima → Mar, Rio ou Lago (selecionável)

4. **Limite de Dias**: Máximo de 10 dias de busca por ocorrência.

5. **Imagens**: As imagens são inseridas automaticamente nos locais marcados com os placeholders de imagem.

6. **Valores Vazios**: Campos não preenchidos pelo usuário são automaticamente substituídos por "Não informado" nos relatórios gerados.
