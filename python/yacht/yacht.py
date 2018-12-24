# Score categories
# Change the values as you see fit
YACHT = 0
ONES = 1
TWOS = 2
THREES = 3
FOURS = 4
FIVES = 5
SIXES = 6
FULL_HOUSE = 7
FOUR_OF_A_KIND = 8
LITTLE_STRAIGHT = 9
BIG_STRAIGHT = 10
CHOICE = 11


def score(dice, category):
    if category == YACHT and len(set(dice)) == 1:
        return 50
    if category == ONES:
        return 1 * dice.count(1)
    if category == TWOS:
        return 2 * dice.count(2)
    if category == THREES:
        return 3 * dice.count(3)
    if category == FOURS:
        return 4 * dice.count(4)
    if category == FIVES:
        return 5 * dice.count(5)
    if category == SIXES:
        return 6 * dice.count(6)
    if category == FULL_HOUSE\
            and not __is_four_of_a_kind(dice)\
            and __is_pair(dice):
        return sum(dice)
    if category == FOUR_OF_A_KIND:
        if dice.count(1) >= 4:
            return 4
        if dice.count(2) >= 4:
            return 8
        if dice.count(3) >= 4:
            return 12
        if dice.count(4) >= 4:
            return 16
        if dice.count(5) >= 4:
            return 20
        if dice.count(6) >= 4:
            return 24
    if category == LITTLE_STRAIGHT and set(dice) == set([1, 2, 3, 4, 5]) or\
       category == BIG_STRAIGHT and set(dice) == set([2, 3, 4, 5, 6]):
        return 30
    if category == CHOICE:
        return sum(dice)
    return 0


def __is_pair(dice):
    return len(set(dice)) == 2


def __is_four_of_a_kind(dice):
    return dice.count(1) >= 4\
        or dice.count(2) >= 4\
        or dice.count(3) >= 4\
        or dice.count(4) >= 4\
        or dice.count(5) >= 4\
        or dice.count(6) >= 4
