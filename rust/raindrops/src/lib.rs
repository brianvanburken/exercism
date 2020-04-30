pub fn raindrops(n: u32) -> String {
    let mut result = String::new();
    if n % 3 == 0 {
        result.push_str("Pling")
    }
    if n % 5 == 0 {
        result.push_str("Plang")
    }
    if n % 7 == 0 {
        result.push_str("Plong")
    }
    if n % 3 != 0 && n % 5 != 0 && n % 7 != 0 {
        result = n.to_string()
    }
    result
}
