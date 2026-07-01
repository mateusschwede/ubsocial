# Analysis

## Layer 1, Head 1

Neste exemplo, observamos que a atenção da **head 1 da layer 1** tende a se concentrar fortemente no token `[CLS]`, indicando que essa head pode estar capturando uma representação global da sentença, comum nas layers iniciais do BERT.

Example Sentences:
- `[CLS] The capital of France is [MASK] .`
- `[CLS] I like to eat [MASK] for breakfast .`

## Layer 4, Head 3

A atenção da **head 3 da layer 4** foca de maneira mais específica nos tokens imediatamente anteriores e posteriores ao token mascarado. Isso sugere que essa head está aprendendo a inferir palavras com base no contexto local – o que é útil para tarefas de preenchimento de lacunas.

Example Sentences:
- `The man went to the [MASK] to buy bread .`
- `She put the book on the [MASK] .`

## Layer 8, Head 5

Na **layer 8, head 5**, nota-se que há uma atenção mais difusa, distribuída entre múltiplos tokens relevantes, especialmente aqueles semanticamente conectados ao token mascarado. Essa head parece colaborar com outras para integrar dependências de médio alcance na frase.

Example Sentences:
- `The movie that I watched last night was [MASK] .`
- `Learning to code with Python is really [MASK] .`

## Layer 12, Head 7

A **última layer (12), head 7** mostra um padrão de atenção muito refinado, em que a maioria da atenção se concentra nos tokens críticos para inferência semântica. Essa head tende a desempenhar um papel de decisão final para prever o token mascarado corretamente.

Example Sentences:
- `Paris is the capital of [MASK] .`
- `A robin is a type of [MASK] .`
