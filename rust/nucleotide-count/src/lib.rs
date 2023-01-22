use std::collections::HashMap;

const ALLOWED_NUCLEOTIDES: [char; 4] = ['A', 'C', 'G', 'T'];

pub fn count(nucleotide: char, dna: &str) -> Result<usize, char> {
    if !ALLOWED_NUCLEOTIDES.contains(&nucleotide) {
        Err(nucleotide)
    } else {
        let mut count = 0;
        for string_nucleotide in dna.chars() {
            if !ALLOWED_NUCLEOTIDES.contains(&string_nucleotide) {
                return Err(string_nucleotide);
            } else if string_nucleotide == nucleotide {
                count += 1;
            }
        }
        Ok(count)
    }
}

pub fn nucleotide_counts(dna: &str) -> Result<HashMap<char, usize>, char> {
    let mut count: HashMap<char, usize> =
        HashMap::from_iter(ALLOWED_NUCLEOTIDES.iter().map(|&n| (n, 0)));
    for nucleotide in dna.chars() {
        if let Some(nucleotide_count) = count.get_mut(&nucleotide) {
            *nucleotide_count += 1;
        } else {
            return Err(nucleotide);
        }
    }
    Ok(count)
}
