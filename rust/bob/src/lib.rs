pub fn reply(message: &str) -> &str {
    let trimmed_message = message.trim();
    let is_empty = trimmed_message == "";
    let is_question = trimmed_message.ends_with("?");
    let is_yelling = trimmed_message.to_uppercase() == trimmed_message
        && trimmed_message.to_lowercase() != trimmed_message;

    if is_empty {
        "Fine. Be that way!"
    } else if is_yelling && is_question {
        "Calm down, I know what I'm doing!"
    } else if is_yelling {
        "Whoa, chill out!"
    } else if is_question {
        "Sure."
    } else {
        "Whatever."
    }
}
