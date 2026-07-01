import os
import random
import re
import sys

DAMPING = 0.85
SAMPLES = 10000


def main():
    if len(sys.argv) is not 2:
        sys.exit("Execute: python pagerank.py corpus")
    corpus = crawl(sys.argv[1])
    rank = sample_pagerank(corpus, DAMPING, SAMPLES)
    print(f"Pagerank results from sampling (n = {SAMPLES})")
    for page in sorted(rank):
        print(f" {page}: {rank[page]:.4f}")
    rank = iterate_pagerank(corpus, DAMPING)
    print(f"Pagerank results from iteration")
    for page in sorted(rank):
        print(f" {page}: {rank[page]:.4f}")


def crawl(directory):
    listPages = dict()

    for file in os.listdir(directory):
        if not file.endswith(".html"):
            continue
        with open(os.path.join(directory, file)) as f:
            c = f.read()
            l = re.findall(r"<a\s+(?:[^>]*?)href=\"([^\"]*)\"", c)
            listPages[file] = set(l) - {file}

    for file in listPages:
        listPages[file] = set(
            link for link in listPages[file]
            if link in listPages
        )
    return listPages


def transition_model(corpus, page, damping_factor):
    probDist = {}
    potPages = corpus[page]

    if len(potPages) == 0:
        prob = 1 / len(corpus)
        for corpPages in corpus:
            probDist[corpPages] = prob
        return probDist

    dampProb = damping_factor / len(potPages)
    randomDampProb = (1 - damping_factor) / len(corpus)

    for potential_page in potPages:
        probDist[potential_page] = dampProb

    for corpPages in corpus:
        if corpPages in potPages:
            probDist[corpPages] = probDist[corpPages] + randomDampProb
        else:
            probDist[corpPages] = randomDampProb
    return probDist


def sample_pagerank(corpus, damping_factor, n):
    pageRank = {}
    nextP = random.choice(list(corpus))

    for i in range(n - 1):
        model = transition_model(corpus, nextP, damping_factor)
        nextP = random.choices(list(model), weights=model.values(), k=1).pop()

        if nextP in pageRank:
            pageRank[nextP] = pageRank[nextP] + 1
        else:
            pageRank[nextP] = 1

    for p in pageRank:
        pageRank[p] = pageRank[p] / n
    return pageRank


def iterate_pagerank(corpus, damping_factor):
    pageRank = {}

    for p in corpus:
        pageRank[p] = 1 / len(corpus)

    conv = False
    while not conv:
        copyPageRank = {k: v for k, v in pageRank.items()}
        pageRankD = {}

        for p in corpus.keys():
            prob = 0

            for pageI, listPages in corpus.items():
                if p in listPages:
                    prob = prob + (copyPageRank[pageI] / len(listPages))
                elif len(listPages) is 0:
                    prob = prob + (1 / len(corpus))

            pageRank[p] = (1 - damping_factor) / len(corpus) + (damping_factor * prob)
            pageRankD[p] = abs(copyPageRank[p] - pageRank[p])

        conv = True
        for p in pageRankD:
            if pageRankD[p] > 0.001:
                conv = False

    cPageRank = 0
    for k in pageRank:
        cPageRank = cPageRank + pageRank[k]

    for k in pageRank:
        pageRank[k] = pageRank[k] / cPageRank
    return pageRank


if __name__ == "__main__":
    main()