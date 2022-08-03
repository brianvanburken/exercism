pub fn reply(message: &str) -> &str {
    let trimmed_message = message.trim();
    let is_empty = trimmed_message == "";
    let is_question = trimmed_message.ends_with("?");
    let is_yelling = trimmed_message.to_uppercase() == trimmed_message
        && trimmed_message.to_lowercase() != trimmed_message;

    match (is_empty, is_yelling, is_question) {
        (true, _, _) => "Fine. Be that way!",
        (_, true, true) => "Calm down, I know what I'm doing!",
        (_, true, _) => "Whoa, chill out!",
        (_, _, true) => "Sure.",
        (_, _, _) => "Whatever.",
    }
}
