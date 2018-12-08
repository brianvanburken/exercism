ALLERGENS = {
    'cats': 128,
    'pollen': 64,
    'chocolate': 32,
    'tomatoes': 16,
    'strawberries': 8,
    'shellfish': 4,
    'peanuts': 2,
    'eggs': 1
}

class Allergies(object):

    def __init__(self, score):
        self.allergens = [
            allergy for allergy, value in ALLERGENS.items() if value & score > 0
        ]

    def is_allergic_to(self, item):
        return item in self.allergens

    @property
    def lst(self):
        return self.allergens
