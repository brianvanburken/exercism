// Not secure for production, but it works without using crates
pub fn private_key(prime_number: u64) -> u64 {
    prime_number / 2
}

pub fn public_key(prime_number: u64, generator: u64, private_key: u64) -> u64 {
    let mut result = 1;
    let mut base = generator;
    let mut exponent = private_key;
    while exponent > 0 {
        if exponent & 1 == 1 {
            result = (result * base) % prime_number;
        }
        base = (base * base) % prime_number;
        exponent >>= 1;
    }
    result
}

pub fn secret(prime_number: u64, other_party_public_key: u64, private_key: u64) -> u64 {
    public_key(prime_number, other_party_public_key, private_key)
}
