use std::collections::{HashMap, HashSet};

#[derive(Debug, PartialEq, Eq)]
pub struct Dna(String);

impl Dna {
    pub fn new(dna: &str) -> Result<Dna, usize> {
        let allowed_dna_nucleotides: HashSet<char> = "acgtACGT".chars().collect();
        if let Some(index) = dna
            .chars()
            .position(|c| !allowed_dna_nucleotides.contains(&c))
        {
            Err(index)
        } else {
            Ok(Dna(dna.to_owned()))
        }
    }

    pub fn into_rna(self) -> Rna {
        let mut rna_accumulation = Vec::with_capacity(self.0.len());
        for nucleotide in self.0.chars() {
            let rna_nucleotide = match nucleotide {
                'g' | 'G' => 'C',
                'c' | 'C' => 'G',
                't' | 'T' => 'A',
                'a' | 'A' => 'U',
                _ => panic!("Invalid DNA nucleotide: {}", nucleotide),
            };
            rna_accumulation.push(rna_nucleotide);
        }
        Rna(rna_accumulation.into_iter().collect())
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct Rna(String);

impl Rna {
    pub fn new(rna: &str) -> Result<Rna, usize> {
        let allowed_rna_nucleotides: HashSet<char> = "acguACGU".chars().collect();
        if let Some(index) = rna
            .chars()
            .position(|c| !allowed_rna_nucleotides.contains(&c))
        {
            Err(index)
        } else {
            Ok(Rna(rna.to_owned()))
        }
    }
}
