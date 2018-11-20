from functools import reduce

def to_rna(dna_strand):
    dna_to_rna_mapping = {
        'G': 'C',
        'C': 'G',
        'T': 'A',
        'A': 'U'
    }
    translate = lambda acc, char: acc + dna_to_rna_mapping.get(char, char)
    return reduce(translate, list(dna_strand), "")
