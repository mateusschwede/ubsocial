# Importa a função `split` da biblioteca padrão `re` para dividir strings com expressões regulares
from re import split

# Importa o módulo principal do NLTK e o módulo `sys` para ler argumentos da linha de comando
import nltk
import sys

# Faz o download do recurso "punkt_tab" necessário para a tokenização de sentenças
nltk.download('punkt_tab')

# Define as regras gramaticais para palavras específicas (terminais)
TERMINALS = """
Adj -> "country" | "dreadful" | "enigmatical" | "little" | "moist" | "red"
Adv -> "down" | "here" | "never"
Conj -> "and" | "until"
Det -> "a" | "an" | "his" | "my" | "the"
N -> "armchair" | "companion" | "day" | "door" | "hand" | "he" | "himself"
N -> "holmes" | "home" | "i" | "mess" | "paint" | "palm" | "pipe" | "she"
N -> "smile" | "thursday" | "walk" | "we" | "word"
P -> "at" | "before" | "in" | "of" | "on" | "to"
V -> "arrived" | "came" | "chuckled" | "had" | "lit" | "said" | "sat"
V -> "smiled" | "tell" | "were"
"""

# Define regras para estruturas gramaticais compostas (não-terminais)
NONTERMINALS = """
S -> NP VP | NP JP NP | NP VP JP NP
S -> JP NP VP | JP NP VP JP NP | NP VP JP NP
S -> S Conj VP NP | S Conj S | JP S | S Conj VP JP NP
NP -> N | NP Adv | NP JP NP | Adj NP
VP -> V | Adv VP | VP Adv | VP NP
JP -> P | Det | P Det
"""

# Cria uma gramática com base nas regras definidas
grammar = nltk.CFG.fromstring(NONTERMINALS + TERMINALS)

# Instancia um parser do tipo ChartParser com a gramática criada
parser = nltk.ChartParser(grammar)

# Retorna os símbolos à esquerda das produções que geram um determinado token (palavra)


def get_token_symbols(token: str):
    return [p.lhs().symbol() for p in grammar.productions(None, token)]

# Imprime a análise sintática em modo debug, mostrando o chart do parser e os símbolos de cada token


def print_sentence_debug(tokens: list[str]):
    print("Chart:", parser.chart_parse(tokens).pretty_format())
    print("\nText:", *tokens)
    all_symbols = []
    for token in tokens:
        token_symbols = get_token_symbols(token)
        all_symbols += token_symbols
        print(
            *token_symbols,
            " - ",
            token,
        )
    print("\nSymbols:", *all_symbols)

# Função principal que executa a lógica do programa


def main():
    # Lê a sentença de um arquivo, se fornecido como argumento
    if len(sys.argv) == 2:
        with open(sys.argv[1]) as f:
            s = f.read()
    else:
        # Caso contrário, lê a sentença do input do usuário
        s = input("Sentence: ")

    # Pré-processa a sentença (tokeniza e filtra)
    s = preprocess(s)

    try:
        # Tenta gerar as árvores sintáticas possíveis com o parser
        trees = list(parser.parse(s))
    except ValueError as e:
        # Caso haja erro na análise, exibe o erro e encerra
        print(e)
        return

    # Se não houver árvores, exibe mensagem de falha
    if not trees:
        print("Could not parse sentence.")
        return

    # Para cada árvore gerada, exibe graficamente e mostra os "noun phrase chunks"
    for tree in trees:
        tree.pretty_print()

        print("Noun Phrase Chunks")
        for np in np_chunk(tree):
            print(" ".join(np.flatten()))

# Verifica se a palavra contém pelo menos um caractere alfabético


def contains_some_alpha_chars(word: str):
    return any(c.isalpha() for c in word.strip())

# Pré-processa a sentença: tokeniza, converte para minúsculas e remove palavras sem letras


def preprocess(sentence: str):
    return [
        word
        for word in nltk.word_tokenize(sentence.lower())
        if contains_some_alpha_chars(word)
    ]

# Verifica se uma árvore tem a label "NP" (sintagma nominal)


def is_np_tree(tree: nltk.Tree) -> bool:
    return tree.label() == "NP"

# Verifica se uma árvore é um "NP chunk", ou seja, um NP que não contém outro NP dentro


def is_np_chunk(tree: nltk.Tree) -> bool:
    if not is_np_tree(tree):
        return False

    for subtree in tree.subtrees():
        if tree == subtree:
            continue
        if is_np_tree(subtree):
            return False
    return True

# Encontra todos os NP chunks da árvore sintática


def np_chunk(tree: nltk.Tree):
    np_chunks = [
        np_subtree
        for np_subtree in tree.subtrees(is_np_tree)
        if is_np_chunk(np_subtree)
    ]
    return np_chunks


# Executa a função principal se o script for rodado diretamente
if __name__ == "__main__":
    main()
