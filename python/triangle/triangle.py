def is_equilateral(sides):
    return valid(sides) and len(set(sides)) == 1


def is_isosceles(sides):
    return valid(sides) and len(set(sides)) == 2 or is_equilateral(sides)


def is_scalene(sides):
    return valid(sides) and len(set(sides)) == 3

def valid(sides):
    return all(sides) and not inequal(sides[0], sides[1], sides[2])

def inequal(a, b, c):
    return a + b <= c or a + c <= b or b + c <= a
