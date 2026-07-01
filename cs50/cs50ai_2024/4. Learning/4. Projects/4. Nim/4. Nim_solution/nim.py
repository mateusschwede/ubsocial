import math
import random
import time

# Define a classe principal do jogo Nim


class Nim():

    def __init__(self, initial=[1, 3, 5, 7]):
        """
        Inicializa o tabuleiro com as pilhas fornecidas.
        Por padrão: 4 pilhas com 1, 3, 5 e 7 objetos.
        """
        self.piles = initial.copy()  # Estado atual do jogo
        self.player = 0              # Começa com o jogador 0
        self.winner = None           # Nenhum vencedor no início

    @classmethod
    def available_actions(cls, piles):
        """
        Retorna todas as ações possíveis (pile, count) dado o estado atual das pilhas.
        """
        actions = set()
        for i, pile in enumerate(piles):
            for j in range(1, pile + 1):
                actions.add((i, j))  # É possível tirar de 1 até a quantidade atual da pilha
        return actions

    @classmethod
    def other_player(cls, player):
        """
        Retorna o número do outro jogador.
        """
        return 0 if player == 1 else 1

    def switch_player(self):
        """
        Alterna o jogador da vez.
        """
        self.player = Nim.other_player(self.player)

    def move(self, action):
        """
        Executa uma jogada, removendo 'count' objetos da pilha 'pile'.
        """
        pile, count = action

        if self.winner is not None:
            raise Exception("Jogo já acabou")
        elif pile < 0 or pile >= len(self.piles):
            raise Exception("Pilha inválida")
        elif count < 1 or count > self.piles[pile]:
            raise Exception("Número inválido de objetos")

        self.piles[pile] -= count  # Atualiza o estado do jogo
        self.switch_player()       # Troca para o próximo jogador

        # Se todas as pilhas estiverem vazias, define o vencedor
        if all(pile == 0 for pile in self.piles):
            self.winner = self.player  # Quem NÃO fez a jogada é o vencedor


# Define a Inteligência Artificial que aprende via Q-Learning
class NimAI():

    def __init__(self, alpha=0.5, epsilon=0.1):
        """
        Inicializa a IA com taxa de aprendizado (alpha) e taxa de exploração (epsilon).
        """
        self.q = dict()           # Tabela Q: {(estado, ação): valor_Q}
        self.alpha = alpha        # Quanto do novo valor influencia o valor antigo
        self.epsilon = epsilon    # Probabilidade de explorar (ação aleatória)

    def get_q_value(self, state, action):
        """
        Retorna o valor Q para uma combinação (estado, ação).
        Retorna 0 se ainda não foi registrado.
        """
        return self.q.get((tuple(state), action), 0)

    def update_q_value(self, state, action, old_q, reward, future_rewards):
        """
        Atualiza o valor Q usando a fórmula de Q-learning:
        Q(s, a) <- Q(s, a) + α * [(recompensa + melhor recompensa futura) - Q(s, a)]
        """
        new_value_estimate = reward + future_rewards
        new_q = old_q + self.alpha * (new_value_estimate - old_q)
        self.q[(tuple(state), action)] = new_q

    def best_future_reward(self, state):
        """
        Retorna o melhor valor Q possível para ações futuras, dado o estado atual.
        """
        actions = Nim.available_actions(state)
        if not actions:
            return 0
        return max(self.get_q_value(state, action) for action in actions)

    def update(self, old_state, action, new_state, reward):
        """
        Atualiza a Q-table após transição de estado:
        (estado anterior, ação realizada, novo estado, recompensa recebida)
        """
        old_q = self.get_q_value(old_state, action)
        future_rewards = self.best_future_reward(new_state)
        self.update_q_value(old_state, action, old_q, reward, future_rewards)

    def choose_action(self, state, epsilon=True):
        """
        Escolhe a melhor ação usando a estratégia epsilon-greedy:
        - Com probabilidade epsilon, escolhe ação aleatória (exploração)
        - Caso contrário, escolhe a ação com maior valor Q (exploração)
        """
        actions = list(Nim.available_actions(state))
        if not actions:
            return None

        if epsilon and random.random() < self.epsilon:
            return random.choice(actions)

        q_values = [self.get_q_value(state, action) for action in actions]
        max_q = max(q_values)
        best_actions = [action for action, q in zip(actions, q_values) if q == max_q]
        return random.choice(best_actions)


def train(n):
    """
    Treina a IA jogando 'n' partidas contra ela mesma.
    """
    player = NimAI()

    for i in range(n):
        print(f"Jogando partida de treino {i + 1}")
        game = Nim()

        # Armazena o último estado e ação de cada jogador
        last = {
            0: {"state": None, "action": None},
            1: {"state": None, "action": None}
        }

        while True:
            state = game.piles.copy()
            action = player.choose_action(game.piles)

            # Salva a jogada feita por esse jogador
            last[game.player]["state"] = state
            last[game.player]["action"] = action

            game.move(action)
            new_state = game.piles.copy()

            # Se o jogo acabou, atualiza com recompensas finais
            if game.winner is not None:
                player.update(state, action, new_state, -1)  # Último jogador perdeu
                player.update(
                    last[game.player]["state"],
                    last[game.player]["action"],
                    new_state,
                    1  # Jogador atual venceu
                )
                break

            # Atualiza recompensas intermediárias (neutras)
            elif last[game.player]["state"] is not None:
                player.update(
                    last[game.player]["state"],
                    last[game.player]["action"],
                    new_state,
                    0  # Recompensa neutra
                )

    print("Treinamento finalizado")
    return player


def play(ai, human_player=None):
    """
    Permite um humano jogar contra a IA treinada.
    """
    if human_player is None:
        human_player = random.randint(0, 1)

    game = Nim()

    while True:
        # Mostra o estado atual das pilhas
        print("\nPilhas:")
        for i, pile in enumerate(game.piles):
            print(f"Pilha {i}: {pile}")
        print()

        available_actions = Nim.available_actions(game.piles)
        time.sleep(1)

        if game.player == human_player:
            print("Sua vez")
            while True:
                try:
                    pile = int(input("Escolha a pilha: "))
                    count = int(input("Quantos remover? "))
                    if (pile, count) in available_actions:
                        break
                except ValueError:
                    pass
                print("Jogada inválida, tente novamente.")
        else:
            print("Vez da IA")
            pile, count = ai.choose_action(game.piles, epsilon=False)
            print(f"A IA removeu {count} da pilha {pile}.")

        game.move((pile, count))

        if game.winner is not None:
            print("\nFIM DE JOGO")
            winner = "Você" if game.winner == human_player else "IA"
            print(f"O vencedor é: {winner}")
            return
