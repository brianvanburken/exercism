from string import ascii_uppercase
from random import sample, shuffle

usedNames = []
def generateName():
    alphabet = list(ascii_uppercase)
    letters = sample(alphabet, 2)
    digits = sample(range(9), 3)
    name = ''.join(str(x) for x in letters + digits)
    if name not in usedNames:
        usedNames.append(name)
        return name
    else:
        return generateName()

class Robot(object):
    def __init__(self):
        self.name = generateName()

    def reset(self):
        self.name = generateName()

