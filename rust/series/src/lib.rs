pub fn series(digits: &str, len: usize) -> Vec<String> {
    if len > digits.len() {
        return vec![];
    } else if len == 0 {
        return vec!["".to_string(); digits.len() + 1];
    }
    let mut substrings = Vec::with_capacity(digits.len() - len + 1);
    for window in digits.chars().collect::<Vec<char>>().windows(len) {
        substrings.push(window.iter().collect::<String>());
    }
    substrings
}
