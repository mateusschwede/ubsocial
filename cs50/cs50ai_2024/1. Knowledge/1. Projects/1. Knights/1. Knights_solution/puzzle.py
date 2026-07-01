from logic import *

AKnight = Symbol("A is a knight")
AKnave = Symbol("A is a knave")
BKnight = Symbol("B is a knight")
BKnave = Symbol("B is a knave")
CKnight = Symbol("C is a knight")
CKnave = Symbol("C is a knave")

knowledge0 = And(
    Or(AKnave, AKnight),
    Not(And(AKnave, AKnight)),
    Biconditional(AKnight, And(AKnight, AKnave))
)

knowledge1 = And(
    Or(AKnave, AKnight),
    Or(BKnave, BKnight),
    Not(And(AKnave, AKnight)),
    Not(And(BKnave, BKnight)),
    Biconditional(AKnight, And(AKnave, BKnave))
)

knowledge2 = And(
    Or(AKnave, AKnight),
    Or(BKnave, BKnight),
    Not(And(AKnave, AKnight)),
    Not(And(BKnave, BKnight)),
    Biconditional(AKnight, Or(And(AKnave, BKnave), And(AKnight, BKnight))),
    Biconditional(BKnight, Or(And(AKnave, BKnight), And(AKnight, BKnave)))
)

knowledge3 = And(
    Or(AKnave, AKnight),
    Or(BKnave, BKnight),
    Or(CKnave, CKnight),
    Not(And(AKnave, AKnight)),
    Not(And(BKnave, BKnight)),
    Not(And(CKnave, CKnight)),
    Biconditional(Or(AKnight, AKnave), Or(AKnight, AKnave)),
    Biconditional(BKnight, Biconditional(AKnight, AKnave)),
    Biconditional(BKnight, CKnave),
    Biconditional(CKnight, AKnight)
)


def main():
    symbols = [AKnight, AKnave, BKnight, BKnave, CKnight, CKnave]
    puzzles = [("Puzzle 0", knowledge0), ("Puzzle 1", knowledge1), ("Puzzle 2", knowledge2), ("Puzzle 3", knowledge3)]
    for p, k in puzzles:
        print(p)
        if len(k.conjuncts) == 0:
            print(" not implemented")
        else:
            for s in symbols:
                if model_check(k, s):
                    print(f" {s}")


if __name__ == "__main__":
    main()