use std::collections::HashSet;

/// Determine whether a sentence is a pangram.
pub fn is_pangram(sentence: &str) -> bool {
    let mut alphabet: u32 = 0;
    for c in sentence.to_lowercase().chars() {
        if c >= 'a' && c <= 'z' {
            alphabet |= 1 << (c as u8 - 'a' as u8) as usize;
        }
    }
    alphabet == (1 << 26) - 1
}
