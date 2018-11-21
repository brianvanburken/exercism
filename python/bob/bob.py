def hey(phrase):
    is_shouting = phrase.upper() == phrase and phrase.lower() != phrase
    is_question = phrase.strip().endswith("?")
    if is_shouting and is_question:
        return "Calm down, I know what I'm doing!"
    if is_shouting:
        return "Whoa, chill out!"
    if is_question:
        return "Sure."
    if not phrase.strip():
        return "Fine. Be that way!"
    return "Whatever."
