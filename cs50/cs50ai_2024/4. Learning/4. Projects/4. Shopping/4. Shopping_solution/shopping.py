import csv
import sys

from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier

# Define a porcentagem de dados que será usada como teste
TEST_SIZE = 0.4

# Mapeamento de nomes dos meses para índices de 0 (Jan) a 11 (Dec)
MONTHS = {
    "Jan": 0, "Feb": 1, "Mar": 2, "Apr": 3,
    "May": 4, "June": 5, "Jul": 6, "Aug": 7,
    "Sep": 8, "Oct": 9, "Nov": 10, "Dec": 11
}


def main():
    # Verifica se o nome do arquivo foi passado corretamente
    if len(sys.argv) != 2:
        sys.exit("Usage: python shopping.py data")

    # Carrega os dados do arquivo CSV e separa em evidências (features) e rótulos (labels)
    evidence, labels = load_data(sys.argv[1])

    # Divide os dados em conjunto de treino e teste
    X_train, X_test, y_train, y_test = train_test_split(
        evidence, labels, test_size=TEST_SIZE
    )

    # Treina o modelo usando os dados de treino
    model = train_model(X_train, y_train)

    # Realiza predições usando o conjunto de teste
    predictions = model.predict(X_test)

    # Avalia a performance do modelo
    sensitivity, specificity = evaluate(y_test, predictions)

    # Exibe os resultados da classificação
    print(f"Correct: {(y_test == predictions).sum()}")
    print(f"Incorrect: {(y_test != predictions).sum()}")
    print(f"True Positive Rate: {100 * sensitivity:.2f}%")
    print(f"True Negative Rate: {100 * specificity:.2f}%")


def load_data(filename):
    """
    Lê o arquivo CSV e transforma os dados em listas numéricas para treino e teste.
    Retorna duas listas: evidence (dados de entrada) e labels (resultado esperado).
    """
    evidence = []
    labels = []

    # Abre o arquivo CSV e lê os dados como dicionário
    with open(filename, newline='') as f:
        reader = csv.DictReader(f)

        for row in reader:
            # Cria a lista de evidências convertendo cada campo para o tipo adequado
            ev = [
                int(row["Administrative"]),
                float(row["Administrative_Duration"]),
                int(row["Informational"]),
                float(row["Informational_Duration"]),
                int(row["ProductRelated"]),
                float(row["ProductRelated_Duration"]),
                float(row["BounceRates"]),
                float(row["ExitRates"]),
                float(row["PageValues"]),
                float(row["SpecialDay"]),
                MONTHS.get(row["Month"], 0),  # Converte o nome do mês para número
                int(row["OperatingSystems"]),
                int(row["Browser"]),
                int(row["Region"]),
                int(row["TrafficType"]),
                # 1 se for visitante retornando
                1 if row["VisitorType"] == "Returning_Visitor" else 0,
                1 if row["Weekend"] == "TRUE" else 0  # 1 se for fim de semana
            ]

            # Label é 1 se houve receita (Revenue), senão 0
            label = 1 if row["Revenue"] == "TRUE" else 0

            evidence.append(ev)
            labels.append(label)

    return evidence, labels


def train_model(evidence, labels):
    """
    Treina um modelo K-Nearest Neighbors com k=1 e retorna o modelo treinado.
    """
    model = KNeighborsClassifier(n_neighbors=1)
    model.fit(evidence, labels)
    return model


def evaluate(labels, predictions):
    """
    Calcula sensibilidade e especificidade com base nas predições do modelo.
    - Sensibilidade: porcentagem de positivos reais corretamente identificados.
    - Especificidade: porcentagem de negativos reais corretamente identificados.
    """
    true_positive = sum(1 for actual, pred in zip(labels, predictions) if actual == 1 and pred == 1)
    true_negative = sum(1 for actual, pred in zip(labels, predictions) if actual == 0 and pred == 0)
    total_positive = labels.count(1)
    total_negative = labels.count(0)

    sensitivity = true_positive / total_positive if total_positive > 0 else 0
    specificity = true_negative / total_negative if total_negative > 0 else 0

    return sensitivity, specificity


# Ponto de entrada principal do script
if __name__ == "__main__":
    main()
