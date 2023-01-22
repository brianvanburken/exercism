use std::collections::HashMap;

/// Count occurrences of words.
pub fn word_count(words: &str) -> HashMap<String, u32> {
    words
        .to_lowercase()
        .split(|c: char| !c.is_alphanumeric() && c != '\'')
        .fold(HashMap::new(), |mut accumulator, word| {
            if !word.is_empty() {
                accumulator
                    .entry(word.trim_matches('\'').to_owned())
                    .and_modify(|count| *count += 1)
                    .or_insert(1);
            }
            accumulator
        })
}
