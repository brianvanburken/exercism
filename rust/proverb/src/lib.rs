use std::iter::once;

pub fn build_proverb(list: &[&str]) -> String {
    let closing_sentence = match list.first() {
        None => String::new(),
        Some(word) => format!("And all for the want of a {}.", word),
    };

    return list
        .windows(2)
        .map(|w| format!("For want of a {} the {} was lost.\n", w[0], w[1]))
        .chain(once(closing_sentence))
        .collect();
}
