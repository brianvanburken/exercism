from string import ascii_lowercase
from functools import reduce

def is_pangram(sentence):
    normalised = sentence.lower()
    alphabet = list(ascii_lowercase)
    contains = lambda acc, letter: acc and letter in normalised
    return reduce(contains, alphabet, True)
