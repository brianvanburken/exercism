use std::collections::HashSet;

/// Determine whether a sentence is a pangram.
pub fn is_pangram(sentence: &str) -> bool {
    let mut alphabet = [0; 26];
    for c in sentence.to_lowercase().chars() {
        if c >= 'a' && c <= 'z' {
            alphabet[(c as u8 - 'a' as u8) as usize] += 1;
        }
    }
    !alphabet.iter().any(|&x| x == 0)
}
