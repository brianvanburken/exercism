pub fn nth(n: u32) -> u32 {
    if (n == 0) {
        return 2;
    }
    let mut number = 1;
    let mut found_primes = 0;
    loop {
        number += 2;
        if is_prime(number) {
            found_primes += 1;
            if found_primes == n {
                return number;
            }
        }
    }
}

fn is_prime(n: u32) -> bool {
    for a in 2..(n / 2) {
        if n % a == 0 {
            return false;
        }
    }
    true
}
