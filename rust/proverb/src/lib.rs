pub fn build_proverb(list: &[&str]) -> String {
    if list.len() == 0 {
        return String::new();
    }

    let closing_sentence = format!(
        "And all for the want of a {}.",
        list.first().expect("Expected a non-empty list")
    );

    if list.len() == 1 {
        return closing_sentence;
    }

    let riddle = list
        .iter()
        .zip(list.iter().skip(1))
        .map(|(a, b)| format!("For want of a {} the {} was lost.", a, b))
        .collect::<Vec<_>>()
        .join("\n");

    riddle + "\n" + &closing_sentence
}
