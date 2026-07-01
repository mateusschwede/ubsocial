import random


class Minesweeper:
    def __init__(self, height=8, width=8, mines=8):
        self.height = height
        self.width = width
        self.mines = set()
        self.board = []

        for h in range(self.height):
            row = []
            for w in range(self.width):
                row.append(False)
            self.board.append(row)

        while len(self.mines) != mines:
            h = random.randrange(height)
            w = random.randrange(width)
            
            if not self.board[h][w]:
                self.mines.add((h, w))
                self.board[h][w] is True
        self.mines_found = set()

    def print(self):
        for x in range(self.height):
            print("--" * self.width + "-")
            for y in range(self.width):
                if self.board[x][y]:
                    print("|X", end="")
                else:
                    print("| ", end="")
            print("|")
        print("--" * self.width + "-")

    def is_mine(self, cell):
        x, y = cell
        return self.board[x][y]

    def nearby_mines(self, cell):
        c = 0

        for x in range(cell[0] - 1, cell[0] + 2):
            for y in range(cell[1] - 1, cell[1] + 2):
                if (x, y) == cell:
                    continue

                if 0 <= x < self.height and 0 <= y < self.width:
                    if self.board[x][y]:
                        c = c + 1
        return c

    def won(self):
        return self.mines_found == self.mines


class Sentence():
    def __init__(self, cells, count):
        self.cells = set(cells)
        self.count = count

    def __eq__(self, other):
        return self.cells == other.cells and self.count == other.count

    def __str__(self):
        return f"{self.cells} = {self.count}"

    def __hash__(self):
        return hash(len(self.cells) + self.count)

    def known_mines(self):
        if len(self.cells) == self.count:
            return set(self.cells)
        else:
            return set()

    def known_safes(self):
        if self.count == 0:
            return set(self.cells)
        else:
            return set()

    def mark_mine(self, cell):
        if cell in self.cells:
            self.cells.remove(cell)
            self.count = self.count - 1
            return 1
        else:
            return 0

    def mark_safe(self, cell):
        if cell in self.cells:
            self.cells.remove(cell)
            return 1
        else:
            return 0


class MinesweeperAI():
    def __init__(self, height=8, width=8):
        self.height = height
        self.width = width
        self.moves_made = set()
        self.mines = set()
        self.safes = set()
        self.knowledge = []

    def mark_mine(self, cell):
        c = 0
        self.mines.add(cell)
        for sentence in self.knowledge:
            c = c + sentence.mark_mine(cell)
        return c

    def mark_safe(self, cell):
        c = 0
        self.safes.add(cell)
        for sentence in self.knowledge:
            c = c + sentence.mark_safe(cell)
        return c

    def add_knowledge(self, cell, count):
        self.moves_made.add(cell)
        self.mark_safe(cell)
        a, b = cell
        neighC = set()
        
        for y in range(max(a - 1, 0), min(a + 2, self.height)):
            for x in range(max(b - 1, 0),  min(b + 2, self.width)):
                if (a, b) != (y, x):
                    neighC.add((y, x))

        self.knowledge.append(Sentence(neighC, count))
        self.mark_safe_or_mines()
        inf = self.inference()

        while inf:
            for sentence in inf:
                self.knowledge.append(sentence)
            
            self.mark_safe_or_mines()
            inf = self.inference()

    def make_safe_move(self):
        for m in self.safes:
            if m not in self.moves_made and m not in self.mines:
                return m
        return None

    def make_random_move(self):
        for x in range(0, self.height):
            for y in range(0, self.width):
                m = (x, y)
                if m not in self.moves_made and m not in self.mines:
                    return m
        return None

    def mark_safe_or_mines(self):
        time = 1
        
        while time:
            time = 0
            
            for s in self.knowledge:
                for cell in s.known_safes():
                    self.mark_safe(cell)
                    time = time + 1
                for cell in s.known_mines():
                    self.mark_mine(cell)
                    time = time + 1

            for c in self.safes:
                time = time + self.mark_safe(c)
            for c in self.mines:
                time = time + self.mark_mine(c)

    def inference(self):
        inf = []
        empty = []

        for s1 in self.knowledge:
            if s1.cells == set():
                empty.append(s1)
                continue
            
            for s2 in self.knowledge:
                if s2.cells == set():
                    empty.append(s2)
                    continue
                
                if s1 is not s2:
                    if s2.cells.issubset(s1.cells):
                        newS = s1.cells.difference(s2.cells)
                        newC = s1.count - s2.count
                        newSent = Sentence(newS, newC)

                        if newSent not in self.knowledge:
                            inf.append(newSent)

        self.knowledge = [x for x in self.knowledge if x not in empty]
        return inf