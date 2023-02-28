use std::fmt::{Display, Formatter, Result};

static ROMAN_MAP: [(usize, &str); 13] = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I"),
];

pub struct Roman(usize);

impl Display for Roman {
    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
        let mut start = self.0;
        let mut result = String::new();
        for &(value, symbol) in ROMAN_MAP.iter() {
            while start >= value {
                result.push_str(symbol);
                start -= value;
            }
        }
        write!(f, "{result}")
    }
}

impl From<usize> for Roman {
    fn from(num: usize) -> Self {
        Self(num)
    }
}
