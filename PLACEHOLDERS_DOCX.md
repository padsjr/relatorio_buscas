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

### Seleção de Tipo de Busca
O sistema agora permite selecionar entre **Busca Terrestre** e **Busca Aquática** ao adicionar um novo dia de busca:
- **Busca Terrestre**: Usa o template `modelo_buscas_terrestre_por_dias.docx`
- **Busca Aquática**: Usa o template `modelo_buscas_aquaticas_por_dias.docx`

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
- `{{dia_temp_agua}}` - Temperatura da água (buscas aquáticas)
- `{{dia_guarnicao}}` - Guarnição
- `{{dia_recursos}}` - Recursos utilizados
- `{{dia_historico}}` - Histórico do dia
- `{{dia_status_vitima}}` - Status da vítima (Localizada/Não localizada)
- `{{dia_tipo_busca}}` - Tipo de busca (terrestre ou aquatica)

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
- `substituir pela temperatura da agua do dia fornecida pelo usuario` - Temperatura da água (apenas buscas aquáticas)
- `substituir pela guarnicao fornecida pelo usuario` - Guarnição
- `substituir pelos recursos fornecidos pelo usuario` - Recursos
- `substituir pelo historico do dia fornecido pelo usuario` - Histórico do dia
- `substituir pelo status da vitima fornecido pelo usuario` - Status da vítima
- `substituir pelo tipo de busca do dia fornecido pelo usuario` - Tipo da busca (Aquática/Terrestre)

### Placeholders para Imagens (para inserção de imagens)
- `inserir imagem tábua de maré do dia fornecida pelo usuario` - Tábua de maré
- `inserir imagem de previsao do dia fornecida pelo usuario` - Previsão do dia
- `inserir imagem de trajetos das buscas fornecida pelo usuario` - Trajetos das buscas

### Placeholders para Títulos de Imagens (para remoção automática quando imagem não for usada)

**IMPORTANTE**: Use estes placeholders para os títulos das imagens na introdução. Quando uma imagem não for selecionada pelo usuário, o título será automaticamente removido do relatório.

#### Imagens da Introdução:
- `substituir pelo titulo condicoes meteorologicas` - Título para "Condições Meteorológicas"
- `substituir pelo titulo imagem do local` - Título para "Imagem do Local"
- `substituir pelo titulo imagem upv` - Título para "Imagem UPV"
- `substituir pelo titulo imagem satelite upv` - Título para "Imagem Satélite UPV"
- `substituir pelo titulo imagem raio de busca` - Título para "Imagem Raio de Busca"
- `substituir pelo titulo imagem tábua de maré` - Título para "Imagem Tábua de Maré"
- `substituir pelo titulo imagem previsão de temperatura e ondas` - Título para "Imagem Previsão de Temperatura e Ondas"

#### Imagens dos Dias de Busca:
- `substituir pelo titulo imagem tábua de maré do dia` - Título para "Tábua de Maré do Dia"
- `substituir pelo titulo imagem de previsão do dia` - Título para "Previsão do Dia"
- `substituir pelo titulo imagem de trajetos das buscas` - Título para "Trajetos das Buscas"

#### Imagens do Resultado Final:
- `substituir pelo titulo imagem do corpo` - Título para "Imagem do Corpo"
- `substituir pelo titulo imagem do local do corpo` - Título para "Imagem do Local do Corpo"

#### Imagens Customizadas (Adicionais):
As imagens customizadas usam placeholders numéricos baseados na ordem de inserção (começando em 0):

- `substituir pelo titulo imagem customizada 0` - Título da primeira imagem customizada
- `inserir imagem customizada 0 fornecida pelo usuario` - Primeira imagem customizada
- `substituir pelo titulo imagem customizada 1` - Título da segunda imagem customizada
- `inserir imagem customizada 1 fornecida pelo usuario` - Segunda imagem customizada
- `substituir pelo titulo imagem customizada 2` - Título da terceira imagem customizada
- `inserir imagem customizada 2 fornecida pelo usuario` - Terceira imagem customizada
- ... e assim por diante

**Nota**: As imagens customizadas são ordenadas pela ordem de inserção. Se uma imagem customizada não for selecionada para uso (checkbox desmarcado), tanto o título quanto a imagem serão removidos do relatório.

## Exemplo de Uso no Modelo DOCX

### Exemplo para Dias de Busca:
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

### Exemplo para Imagens com Títulos:
```
substituir pelo titulo condicoes meteorologicas
inserir imagem condicoes meteorologicas fornecida pelo usuario

substituir pelo titulo imagem do local
inserir imagem local fornecida pelo usuario
```

### Exemplo para Imagens Customizadas:
```
substituir pelo titulo imagem customizada 0
inserir imagem customizada 0 fornecida pelo usuario

substituir pelo titulo imagem customizada 1
inserir imagem customizada 1 fornecida pelo usuario
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

7. **Templates Diferenciados**: O sistema agora usa templates diferentes para buscas terrestres e aquáticas:
   - Buscas Terrestres: `modelo_buscas_terrestre_por_dias.docx`
   - Buscas Aquáticas: `modelo_buscas_aquaticas_por_dias.docx`

8. **Imagens Opcionais**: Cada imagem na introdução possui um checkbox para indicar se deve ser usada no relatório. Imagens não selecionadas não serão incluídas.

9. **Títulos de Imagens**: Os títulos das imagens devem usar os placeholders `substituir pelo titulo ...` no modelo DOCX. Quando uma imagem não for selecionada pelo usuário, o título correspondente será automaticamente removido do relatório. **Exemplo de uso no modelo:**
   ```
   substituir pelo titulo condicoes meteorologicas
   inserir imagem condicoes meteorologicas fornecida pelo usuario
   ```
   Se o usuário desmarcar o checkbox da imagem, tanto o título quanto a imagem serão removidos.

10. **Imagens Customizadas**: As imagens customizadas (adicionais) usam placeholders numéricos baseados na ordem de inserção (0, 1, 2, etc.). O título da imagem customizada é o texto fornecido pelo usuário ao fazer upload. Se o usuário desmarcar o checkbox "Usar esta imagem no relatório", tanto o título quanto a imagem serão removidos. **Importante**: 
   - Coloque os placeholders das imagens customizadas na ordem correta no modelo (0, 1, 2...) para corresponder à ordem de inserção.
   - **Limite**: O sistema permite no máximo **10 imagens customizadas** por ocorrência. O botão de adicionar será desabilitado quando o limite for atingido.

11. **Compatibilidade**: O campo `tipo_busca` foi adicionado ao modelo DiaBusca. Para ocorrências antigas, o padrão será 'aquatica'.

12. **Nome do Relatório**: O arquivo DOCX final é salvo como `Relatório Buscas NomeDaVitima.docx`. Caracteres inválidos no nome da vítima são removidos automaticamente para garantir compatibilidade com o sistema operacional.
teste