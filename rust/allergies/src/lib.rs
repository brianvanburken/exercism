use std::collections::HashSet;

pub struct Allergies {
    score: u32,
    allergies: HashSet<Allergen>,
}

#[derive(Debug, PartialEq, Eq, Clone, Hash)]
pub enum Allergen {
    Eggs,
    Peanuts,
    Shellfish,
    Strawberries,
    Tomatoes,
    Chocolate,
    Pollen,
    Cats,
}

impl Allergies {
    pub fn new(score: u32) -> Self {
        let allergies = Self::calculate_allergies(score);
        Self { score, allergies }
    }

    pub fn is_allergic_to(&self, allergen: &Allergen) -> bool {
        self.allergies.contains(allergen)
    }

    pub fn allergies(&self) -> Vec<Allergen> {
        self.allergies.iter().cloned().collect()
    }

    fn calculate_allergies(score: u32) -> HashSet<Allergen> {
        let mut result = HashSet::new();
        for i in 0..8 {
            if (score >> i) & 1 == 1 {
                result.insert(match i {
                    0 => Allergen::Eggs,
                    1 => Allergen::Peanuts,
                    2 => Allergen::Shellfish,
                    3 => Allergen::Strawberries,
                    4 => Allergen::Tomatoes,
                    5 => Allergen::Chocolate,
                    6 => Allergen::Pollen,
                    7 => Allergen::Cats,
                    _ => unreachable!(),
                });
            }
        }
        result
    }
}
