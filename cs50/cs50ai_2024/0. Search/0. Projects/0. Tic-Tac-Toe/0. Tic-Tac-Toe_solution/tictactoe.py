import random
from errors import InvalidActionError
from copy import deepcopy

X = "X"
O = "O"
EMPTY = None


def initial_state():
    return [[EMPTY, EMPTY, EMPTY],
            [EMPTY, EMPTY, EMPTY],
            [EMPTY, EMPTY, EMPTY]]


def player(board):
    countX = 0
    countO = 0
    countEMPTY = 0

    for r in board:
        countX = countX + r.count(X)
        countO = countO + r.count(O)
        countEMPTY = countEMPTY + r.count(EMPTY)

    if countX > countO:
        return O
    else:
        return X


def actions(board):
    move = set()

    for i in range(3):
        for j in range(3):
            if board[i][j] == EMPTY:
                move.add((i, j))
    return move


def result(board, action):
    i = action[0]
    j = action[1]

    if i not in [0, 1, 2] or j not in [0, 1, 2]:
        raise InvalidActionError(action, board, 'Invalid board position for action')
    elif board[i][j] is not EMPTY:
        raise InvalidActionError(action, board, 'Invalid action on occupaied tile')

    copyBoard = deepcopy(board)
    copyBoard[i][j] = player(board)
    return copyBoard


def winner(board):

    for r in board:
        if r.count(X) == 3:
            return X
        if r.count(O) == 3:
            return O

    for j in range(3):
        column = ''
        for i in range(3):
            column = column + str(board[i][j])

        if column == 'XXX':
            return X
        elif column == 'OOO':
            return O

    d1 = ''
    d2 = ''
    j = 2

    for i in range(3):
        d1 = d1 + str(board[i][i])
        d2 = d2 + str(board[i][j])
        j = j - 1

    if d1 == 'XXX' or d2 == 'XXX':
        return X
    elif d1 == 'OOO' or d2 == 'OOO':
        return O
    return None


def terminal(board):
    if winner(board) or not actions(board):
        return True
    else:
        return False


def utility(board):
    if winner(board) == 'X':
        return 1
    elif winner(board) == 'O':
        return -1
    else:
        return 0


exploredActions = 0


def minimax(board):
    global exploredActions
    exploredActions = 0

    def max_player(board, bMin=10):
        global exploredActions

        if terminal(board):
            return (utility(board), None)

        value = -10
        bAction = None
        actionSet = actions(board)

        while len(actionSet) > 0:
            action = random.choice(tuple(actionSet))
            actionSet.remove(action)

            if bMin <= value:
                break

            exploredActions = exploredActions + 1
            min_player_result = min_player(result(board, action), value)
            
            if min_player_result[0] > value:
                bAction = action
                value = min_player_result[0]
        return (value, bAction)

    def min_player(board, bMax=-10):
        global exploredActions

        if terminal(board):
            return (utility(board), None)

        value = 10
        bAction = None
        actionSet = actions(board)

        while len(actionSet) > 0:
            action = random.choice(tuple(actionSet))
            actionSet.remove(action)

            if bMax >= value:
                break

            exploredActions = exploredActions + 1
            max_player_result = max_player(result(board, action), value)
        
            if max_player_result[0] < value:
                bAction = action
                value = max_player_result[0]
        return (value, bAction)

    if terminal(board):
        return None

    if player(board) == 'X':
        print('AI is working')
        bMove = max_player(board)[1]
        print('AI actions: ', exploredActions)
        return bMove
    else:
        print('AI is working')
        bMove = min_player(board)[1]
        print('AI actions: ', exploredActions)
        return bMove