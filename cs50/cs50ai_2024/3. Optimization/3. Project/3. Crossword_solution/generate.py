import sys

from crossword import *


class CrosswordCreator():

    def __init__(self, crossword):
        """
        Create new CSP crossword generate.
        """
        self.crossword = crossword
        self.domains = {
            var: self.crossword.words.copy()
            for var in self.crossword.variables
        }

    def letter_grid(self, assignment):
        """
        Return 2D array representing a given assignment.
        """
        letters = [
            [None for _ in range(self.crossword.width)]
            for _ in range(self.crossword.height)
        ]
        for variable, word in assignment.items():
            direction = variable.direction
            for k in range(len(word)):
                i = variable.i + (k if direction == Variable.DOWN else 0)
                j = variable.j + (k if direction == Variable.ACROSS else 0)
                letters[i][j] = word[k]
        return letters

    def print(self, assignment):
        """
        Print crossword assignment to the terminal.
        """
        letters = self.letter_grid(assignment)
        for i in range(self.crossword.height):
            for j in range(self.crossword.width):
                if self.crossword.structure[i][j]:
                    print(letters[i][j] or " ", end="")
                else:
                    print("█", end="")
            print()

    def save(self, assignment, filename):
        """
        Save crossword assignment to an image file.
        """
        from PIL import Image, ImageDraw, ImageFont
        cell_size = 100
        cell_border = 2
        interior_size = cell_size - 2 * cell_border
        letters = self.letter_grid(assignment)

        # Create a blank canvas
        img = Image.new(
            "RGBA",
            (self.crossword.width * cell_size,
             self.crossword.height * cell_size),
            "black"
        )
        font = ImageFont.truetype("assets/fonts/OpenSans-Regular.ttf", 80)
        draw = ImageDraw.Draw(img)

        for i in range(self.crossword.height):
            for j in range(self.crossword.width):

                rect = [
                    (j * cell_size + cell_border,
                     i * cell_size + cell_border),
                    ((j + 1) * cell_size - cell_border,
                     (i + 1) * cell_size - cell_border)
                ]
                if self.crossword.structure[i][j]:
                    draw.rectangle(rect, fill="white")
                    if letters[i][j]:
                        _, _, w, h = draw.textbbox((0, 0), letters[i][j], font=font)
                        draw.text(
                            (rect[0][0] + ((interior_size - w) / 2),
                             rect[0][1] + ((interior_size - h) / 2) - 10),
                            letters[i][j], fill="black", font=font
                        )

        img.save(filename)

    def solve(self):
        """
        Enforce node and arc consistency, and then solve the CSP.
        """
        self.enforce_node_consistency()
        self.ac3()
        return self.backtrack(dict())

    def enforce_node_consistency(self):
        # Para cada variável (posição no tabuleiro)
        for var in self.domains:
            # Cria um conjunto com as palavras que NÃO têm o tamanho necessário
            to_remove = {word for word in self.domains[var] if len(word) != var.length}
            # Remove essas palavras do domínio da variável
            self.domains[var] -= to_remove

    def revise(self, x, y):
        # Obtém a sobreposição (interseção) entre as variáveis x e y
        overlap = self.crossword.overlaps[x, y]
        if overlap is None:
            # Se não há interseção, não há revisão a fazer
            return False

        revised = False
        to_remove = set()

        # Para cada palavra no domínio de x
        for word_x in self.domains[x]:
            # Verifica se existe ao menos uma palavra em y que seja compatível
            found = False
            for word_y in self.domains[y]:
                # Garante que palavras diferentes são usadas
                if word_x == word_y:
                    continue
                # Verifica se os caracteres que se cruzam coincidem
                if word_x[overlap[0]] == word_y[overlap[1]]:
                    found = True
                    break
            # Se nenhuma palavra de y satisfaz a condição, marca a palavra de x para remoção
            if not found:
                to_remove.add(word_x)
                revised = True

        # Remove do domínio de x as palavras inválidas
        self.domains[x] -= to_remove
        return revised

    def ac3(self, arcs=None):
        # Inicializa a fila de arcos com todos os pares se nenhum for passado
        if arcs is None:
            queue = [(x, y) for x in self.crossword.variables for y in self.crossword.neighbors(x)]
        else:
            queue = arcs.copy()

        while queue:
            x, y = queue.pop(0)
            # Faz a revisão do arco (x, y)
            if self.revise(x, y):
                # Se o domínio de x ficar vazio, o problema não tem solução
                if not self.domains[x]:
                    return False
                # Adiciona de volta à fila todos os vizinhos de x, exceto y
                for z in self.crossword.neighbors(x):
                    if z != y:
                        queue.append((z, x))
        return True

    def assignment_complete(self, assignment):
        # Verifica se todas as variáveis foram atribuídas
        return set(assignment.keys()) == self.crossword.variables

    def consistent(self, assignment):
        # Conjunto para rastrear palavras já usadas (evitar repetições)
        words_used = set()

        for var, word in assignment.items():
            # Verifica se o comprimento da palavra está correto
            if len(word) != var.length:
                return False

            # Verifica se há duplicidade de palavras
            if word in words_used:
                return False
            words_used.add(word)

            # Verifica se a palavra se alinha corretamente com as vizinhas atribuídas
            for neighbor in self.crossword.neighbors(var):
                if neighbor not in assignment:
                    continue
                i, j = self.crossword.overlaps[var, neighbor]
                word_neighbor = assignment[neighbor]
                # Se os caracteres que se cruzam são diferentes, não é consistente
                if word[i] != word_neighbor[j]:
                    return False

        return True

    def order_domain_values(self, var, assignment):
        # Função para contar quantos valores de vizinhos seriam descartados
        def count_ruled_out(word):
            count = 0
            for neighbor in self.crossword.neighbors(var):
                if neighbor in assignment:
                    continue
                i, j = self.crossword.overlaps[var, neighbor] or (None, None)
                for neighbor_word in self.domains[neighbor]:
                    # Se houver interseção e os caracteres forem diferentes, a palavra do vizinho é descartada
                    if i is not None and word[i] != neighbor_word[j]:
                        count += 1
            return count

        # Ordena o domínio da variável com base no número de palavras que seriam descartadas nos vizinhos
        return sorted(self.domains[var], key=count_ruled_out)

    def select_unassigned_variable(self, assignment):
        # Lista de variáveis ainda não atribuídas
        unassigned = [v for v in self.crossword.variables if v not in assignment]

        # Ordena por:
        # 1. Menor número de valores restantes no domínio (MRV - Minimum Remaining Values)
        # 2. Maior número de vizinhos (grau) se houver empate
        return min(
            unassigned,
            key=lambda var: (len(self.domains[var]), -len(self.crossword.neighbors(var)))
        )

    def backtrack(self, assignment):
        # Se o estado atual é completo e válido, retorna a solução
        if self.assignment_complete(assignment):
            return assignment

        # Escolhe uma variável ainda não atribuída
        var = self.select_unassigned_variable(assignment)

        # Tenta cada valor do domínio ordenado por menor impacto nos vizinhos
        for value in self.order_domain_values(var, assignment):
            assignment[var] = value

            # Se o estado for consistente, continua o backtracking
            if self.consistent(assignment):
                result = self.backtrack(assignment)
                if result is not None:
                    return result

            # Se não der certo, desfaz a atribuição
            del assignment[var]

        # Se nenhuma atribuição funcionar, retorna None
        return None


def main():

    # Check usage
    if len(sys.argv) not in [3, 4]:
        sys.exit("Usage: python generate.py structure words [output]")

    # Parse command-line arguments
    structure = sys.argv[1]
    words = sys.argv[2]
    output = sys.argv[3] if len(sys.argv) == 4 else None

    # Generate crossword
    crossword = Crossword(structure, words)
    creator = CrosswordCreator(crossword)
    assignment = creator.solve()

    # Print result
    if assignment is None:
        print("No solution.")
    else:
        creator.print(assignment)
        if output:
            creator.save(assignment, output)


if __name__ == "__main__":
    main()
