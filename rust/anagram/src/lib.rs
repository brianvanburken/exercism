use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, inputs: &[&'a str]) -> HashSet<&'a str> {
    let lowercased_word = word.to_lowercase();
    let sorted_word = sort(&lowercased_word);
    inputs
        .iter()
        .filter(|input| {
            let lowercased_input = input.to_lowercase();
            lowercased_word != lowercased_input && sorted_word == sort(&lowercased_input)
        })
        .cloned()
        .collect()
}

fn sort(word: &str) -> String {
    let mut sorted: Vec<char> = word.chars().collect();
    sorted.sort();
    sorted.into_iter().collect()
}
