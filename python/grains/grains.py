def on_square(integer_number):
    if integer_number >= 1 and integer_number <= 64:
        return 1 << (integer_number - 1)
    raise ValueError('Only values between 1 and 64 are allowed.')


def total_after(integer_number):
    if integer_number >= 1 and integer_number <= 64:
        return sum([on_square(i) for i in range(1, integer_number + 1)])
    raise ValueError('Only values between 1 and 64 are allowed.')
