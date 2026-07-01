class Sentence():
    def evaluate(self, model):
        raise Exception("Empty")

    def form(self):
        return ""

    def symbols(self):
        return set()

    @classmethod
    def validate(cls, sent):
        if not isinstance(sent, Sentence):
            raise TypeError("Not is a logical sentence")

    @classmethod
    def parenthesize(cls, text):
        def balanced(text):
            count = 0
            for char in text:
                if char == "(":
                    count = count + 1
                elif char == ")":
                    if count <= 0:
                        return False
                    count = count - 1
            return count == 0
        if not len(text) or text.isalpha() or (text[0] == "(" and text[-1] == ")" and balanced(text[1:-1])):
            return text
        else:
            return f"({text})"


class Symbol(Sentence):
    def __init__(self, name):
        self.name = name

    def __eq__(self, other):
        return isinstance(other, Symbol) and self.name == other.name

    def __hash__(self):
        return hash(("Symbol", self.name))

    def __repr__(self):
        return self.name

    def evaluate(self, model):
        try:
            return bool(model[self.name])
        except KeyError:
            raise Exception(f"Variable {self.name} not in model")

    def form(self):
        return self.name

    def symbols(self):
        return {self.name}


class Not(Sentence):
    def __init__(self, operand):
        Sentence.validate(operand)
        self.operand = operand

    def __eq__(self, other):
        return isinstance(other, Not) and self.operand == other.operand

    def __hash__(self):
        return hash(("not", hash(self.operand)))

    def __repr__(self):
        return f"Not({self.operand})"

    def evaluate(self, model):
        return not self.operand.evaluate(model)

    def form(self):
        return "Formule: ¬" + Sentence.parenthesize(self.operand.form())

    def symbols(self):
        return self.operand.symbols()


class And(Sentence):
    def __init__(self, *conjuncts):
        for conj in conjuncts:
            Sentence.validate(conj)
        self.conjuncts = list(conjuncts)

    def __eq__(self, other):
        return isinstance(other, And) and self.conjuncts == other.conjuncts

    def __hash__(self):
        return hash(("and", tuple(hash(conjunct) for conjunct in self.conjuncts)))

    def __repr__(self):
        conjunctions = ", ".join([str(conjunct) for conjunct in self.conjuncts])
        return f"And({conjunctions})"

    def add(self, conjunct):
        Sentence.validate(conjunct)
        self.conjuncts.append(conjunct)

    def evaluate(self, model):
        return all(conjunct.evaluate(model) for conjunct in self.conjuncts)

    def form(self):
        if len(self.conjuncts) == 1:
            return self.conjuncts[0].form()
        return " ∧ ".join([Sentence.parenthesize(conj.form()) for conj in self.conjuncts])

    def symbols(self):
        return set.union(*[conj.symbols() for conj in self.conjuncts])


class Or(Sentence):
    def __init__(self, *disjuncts):
        for disj in disjuncts:
            Sentence.validate(disj)
        self.disjuncts = list(disjuncts)

    def __eq__(self, other):
        return isinstance(other, Or) and self.disjuncts == other.disjuncts

    def __hash__(self):
        return hash(("or", tuple(hash(disj) for disj in self.disjuncts)))

    def __repr__(self):
        disjuncts = ", ".join([str(disj) for disj in self.disjuncts])
        return f"Or({disjuncts})"

    def evaluate(self, model):
        return any(disj.evaluate(model) for disj in self.disjuncts)

    def form(self):
        if len(self.disjuncts) == 1:
            return self.disjuncts[0].form()
        return " v ".join([Sentence.parenthesize(disj.form()) for disj in self.disjuncts])

    def symbols(self):
        return set.union(*[disj.symbols() for disj in self.disjuncts])


class Implication(Sentence):
    def __init__(self, first, second):
        Sentence.validate(first)
        Sentence.validate(second)
        self.first = first
        self.second = second

    def __eq__(self, other):
        return (isinstance(other, Implication) and self.first == other.first and self.second == other.second)

    def __hash__(self):
        return hash(("implies", hash(self.first), hash(self.second)))

    def __repr__(self):
        return f"Implication({self.first}, {self.second})"

    def evaluate(self, model):
        return ((not self.first.evaluate(model)) or self.second.evaluate(model))

    def form(self):
        first = Sentence.parenthesize(self.first.form())
        second = Sentence.parenthesize(self.second.form())
        return f"{first} => {second}"

    def symbols(self):
        return set.union(self.first.symbols(), self.second.symbols())


class Biconditional(Sentence):
    def __init__(self, left, right):
        Sentence.validate(left)
        Sentence.validate(right)
        self.left = left
        self.right = right

    def __eq__(self, other):
        return (isinstance(other, Biconditional) and self.left == other.left and self.right == other.right)

    def __hash__(self):
        return hash(("biconditional", hash(self.left), hash(self.right)))

    def __repr__(self):
        return f"Biconditional({self.left}, {self.right})"

    def evaluate(self, model):
        return ((self.left.evaluate(model) and self.right.evaluate(model)) or (not self.left.evaluate(model) and not self.right.evaluate(model)))

    def form(self):
        left = Sentence.parenthesize(str(self.left))
        right = Sentence.parenthesize(str(self.right))
        return f"{left} <=> {right}"

    def symbols(self):
        return set.union(self.left.symbols(), self.right.symbols())


def model_check(knowledge, query):
    def check_all(knowledge, query, symbols, model):
        if not symbols:
            if knowledge.evaluate(model):
                return query.evaluate(model)
            return True
        else:

            remaining = symbols.copy()
            pop = remaining.pop()

            modelTrue = model.copy()
            modelTrue[pop] = True

            modelFalse = model.copy()
            modelFalse[pop] = False

            return (check_all(knowledge, query, remaining, modelTrue) and check_all(knowledge, query, remaining, modelFalse))

    symbols = set.union(knowledge.symbols(), query.symbols())
    return check_all(knowledge, query, symbols, dict())