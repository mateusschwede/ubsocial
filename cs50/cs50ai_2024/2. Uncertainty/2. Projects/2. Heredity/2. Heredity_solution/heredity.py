import csv
import itertools
import sys

PROBS = {
    "gene": {
        2: 0.01,
        1: 0.03,
        0: 0.96
    },
    "trait": {
        2: {
            True: 0.65,
            False: 0.35
        },
        1: {
            True: 0.56,
            False: 0.44
        },
        0: {
            True: 0.01,
            False: 0.99
        }
    },
    "mutation": 0.01
}


def main():
    if len(sys.argv) != 2:
        sys.exit("Execute: python heredity.py data.csv")
    people = load_data(sys.argv[1])

    probabilities = {
        person: {
            "gene": {
                2: 0,
                1: 0,
                0: 0
            },
            "trait": {
                True: 0,
                False: 0
            }
        }
        for person in people
    }
    names = set(people)
    
    for have_trait in powerset(names):
        failsEvid = any(
            (people[person]["trait"] is not None and people[person]["trait"] != (person in have_trait))
            for person in names
        )
        if failsEvid:
            continue

        for oneGene in powerset(names):
            for twoGenes in powerset(names - oneGene):
                p = joint_probability(people, oneGene, twoGenes, have_trait)
                update(probabilities, oneGene, twoGenes, have_trait, p)
    normalize(probabilities)

    for person in people:
        print(f"{person}:")
        for field in probabilities[person]:
            print(f" {field.capitalize()}:")
            for value in probabilities[person][field]:
                p = probabilities[person][field][value]
                print(f" {value}: {p:.4f}")


def load_data(filename):
    csv = dict()
    
    with open(filename) as f:
        file = csv.DictReader(f)
        for f in file:
            name = f["name"]
            csv[name] = {
                "name": name,
                "mother": f["mother"] or None,
                "father": f["father"] or None,
                "trait": (True if f["trait"] == "1" else
                          False if f["trait"] == "0" else None)
            }
    return csv


def powerset(s):
    s = list(s)
    return [
        set(s) for s in itertools.chain.from_iterable(
            itertools.combinations(s, r) for r in range(len(s) + 1)
        )
    ]


def joint_probability(people, one_gene, two_genes, have_trait):
    prob = 1
    zeroGene = people.keys() - (one_gene | two_genes)

    for ps in zeroGene:
        if people[ps]["mother"] is None:
            prob = prob * (PROBS["gene"][0])
        elif people[ps]["mother"] is not None:
            mother = people[ps]["mother"]
            father = people[ps]["father"]

            if mother in zeroGene and father in zeroGene:
                prob = prob * ((1 - PROBS["mutation"]) ** 2)
            
            if mother in zeroGene and father in one_gene:
                prob = prob * ((1 - PROBS["mutation"]) * 0.5)
            
            if mother in zeroGene and father in two_genes:
                prob = prob * ((1 - PROBS["mutation"]) * PROBS["mutation"])

            if mother in one_gene and father in zeroGene:
                prob = prob * (0.5 * (1 - PROBS["mutation"]))
            
            if mother in one_gene and father in one_gene:
                prob = prob * (0.5 ** 2)
            
            if mother in one_gene and father in two_genes:
                prob = prob * (0.5 * PROBS["mutation"])

            if mother in two_genes and father in zeroGene:
                prob = prob * (PROBS["mutation"] * (1 - PROBS["mutation"]))
            
            if mother in two_genes and father in one_gene:
                prob = prob * (PROBS["mutation"] * 0.5)
            
            if mother in two_genes and father in two_genes:
                prob = prob * (PROBS["mutation"] ** 2)

        prob = prob * (PROBS["trait"][0][ps in have_trait])

    for ps in one_gene:
        if people[ps]["mother"] is None:
            prob = prob * (PROBS["gene"][1])
        elif people[ps]["mother"] is not None:
            mother = people[ps]["mother"]
            father = people[ps]["father"]

            if mother in zeroGene and father in zeroGene:
                prob = prob * (PROBS["mutation"] * (1 - PROBS["mutation"]) + PROBS["mutation"] * (1 - PROBS["mutation"]))
            
            if mother in zeroGene and father in one_gene:
                prob = prob * (PROBS["mutation"] * 0.5 + (1 - PROBS["mutation"]) * 0.5)
            
            if mother in zeroGene and father in two_genes:
                prob = prob * (PROBS["mutation"] ** 2 + (1 - PROBS["mutation"]) ** 2)
            
            if mother in one_gene and father in zeroGene:
                prob = prob * ((1 - PROBS["mutation"]) * 0.5 + PROBS["mutation"] * 0.5)
            
            if mother in one_gene and father in one_gene:
                prob = prob * (0.5 ** 2 + 0.5 ** 2)
            
            if mother in one_gene and father in two_genes:
                prob = prob * (0.5 * PROBS["mutation"] + (1 - PROBS["mutation"]) * 0.5)
            
            if mother in two_genes and father in zeroGene:
                prob = prob * ((1 - PROBS["mutation"]) ** 2 + PROBS["mutation"] ** 2)
            
            if mother in two_genes and father in one_gene:
                prob = prob * ((1 - PROBS["mutation"]) * 0.5 + PROBS["mutation"] * 0.5)
            
            if mother in two_genes and father in two_genes:
                prob = prob * ((1 - PROBS["mutation"]) * PROBS["mutation"] + (1 - PROBS["mutation"]) * PROBS["mutation"])

        prob = prob * (PROBS["trait"][1][ps in have_trait])

    for ps in two_genes:
        if people[ps]["mother"] is None:
            prob = prob * (PROBS["gene"][2])
        elif people[ps]["mother"] is not None:
            mother = people[ps]["mother"]
            father = people[ps]["father"]

            if mother in zeroGene and father in zeroGene:
                prob = prob * (PROBS["mutation"] * PROBS["mutation"])
            
            if mother in zeroGene and father in one_gene:
                prob = prob * (PROBS["mutation"] * 0.5)
            
            if mother in zeroGene and father in two_genes:
                prob = prob * (PROBS["mutation"] * (1 - PROBS["mutation"]))

            if mother in one_gene and father in zeroGene:
                prob = prob * (0.5 * PROBS["mutation"])
            
            if mother in one_gene and father in one_gene:
                prob = prob * (0.5 * 0.5)
            
            if mother in one_gene and father in two_genes:
                prob = prob * (0.5 * (1 - PROBS["mutation"]))
            
            if mother in two_genes and father in zeroGene:
                prob = prob * ((1 - PROBS["mutation"]) * PROBS["mutation"])
            
            if mother in two_genes and father in one_gene:
                prob = prob * ((1 - PROBS["mutation"]) * 0.5)
            
            if mother in two_genes and father in two_genes:
                prob = prob * ((1 - PROBS["mutation"]) ** 2)

        prob = prob * (PROBS["trait"][2][ps in have_trait])

    return prob


def update(probabilities, one_gene, two_genes, have_trait, p):
    for ps in probabilities:
        if ps in one_gene:
            probabilities[ps]["gene"][1] = probabilities[ps]["gene"][1] + p
        elif ps in two_genes:
            probabilities[ps]["gene"][2] = probabilities[ps]["gene"][2] + p
        else:
            probabilities[ps]["gene"][0] = probabilities[ps]["gene"][0] + p

        probabilities[ps]["trait"][ps in have_trait] = probabilities[ps]["trait"][ps in have_trait] + p


def normalize(probabilities):
    for ps in probabilities:
        genes = sum(probabilities[ps]["gene"].values())

        for i in range(0, 3):
            probabilities[ps]["gene"][i] = probabilities[ps]["gene"][i] / genes
        traits = sum(probabilities[ps]["trait"].values())

        for i in range(0, 2):
            probabilities[ps]["trait"][i] = probabilities[ps]["trait"][i] / traits


if __name__ == "__main__":
    main()