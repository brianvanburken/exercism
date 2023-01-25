use std::{fmt::{Display, Formatter, Result}, collections::HashMap};

static ROMAN_MAP: [(usize, &str); 13] = [
    (1, "I"),
    (4, "IV"),
    (5, "V"),
    (9, "IX"),
    (10, "X"),
    (40, "XL"),
    (50, "L"),
    (90, "XC"),
    (100, "C"),
    (400, "CD"),
    (500, "D"),
    (900, "CM"),
    (1000, "M"),
];


pub struct Roman(usize);

impl Display for Roman {
    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
        let mut start = self.0;
        let lookup = HashMap::from(ROMAN_MAP);
        let mut result = String::new();
        while start > 0 {
            let max_val = *lookup.keys().filter(|&x| x <= &start).max().unwrap();
            result.push_str(lookup[&max_val]);
            start -= max_val;
        }
        write!(f, "{}", result)
    }
}

impl From<usize> for Roman {
    fn from(num: usize) -> Self {
        Self(num)
    }
}
