class Error(Exception):
    pass


class InvalidActionError(Error):
    def __init__(self, action, board, message):
        print('InvalidActionError: ', message, 'Action: ', action, 'on board: ', board)