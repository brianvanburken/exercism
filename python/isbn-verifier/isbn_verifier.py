from re import sub

def verify(isbn):
    chars = list(sub('[^0-9X]', '', isbn))
    if len(chars) != 10:
        return False
    sum = 0
    for i, char in enumerate(chars):
        if char == 'X' and i == 9:
            sum += 10
        elif char != 'X':
            sum += int(char) * (10 - i)
    return sum % 11 == 0
