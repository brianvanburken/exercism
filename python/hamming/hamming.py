def distance(strand_a, strand_b):
    if (len(strand_a) == len(strand_b)):
        return sum([1 for a,b in zip(list(strand_a), list(strand_b)) if a != b])
    raise ValueError('Strands are of indifferent length')

