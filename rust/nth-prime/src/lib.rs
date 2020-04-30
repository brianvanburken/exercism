pub fn nth(n: u32) -> u32 {
    let mut number = 1;
    let mut found_primes = 0;
    if (n == 0) {
        return 2;
    }
    loop {
        number += 2;
        let prime = is_prime(number);
        if prime {
            found_primes += 1;
            if found_primes == n {
                break;
            }
        }
    }
    number
}

fn is_prime(n: u32) -> bool {
    if n == 1 {
        return false;
    }
    if n == 2 {
        return true;
    }
    if n % 2 == 0 {
        return false;
    }
    for a in 3..n {
        if n % a == 0 {
            return false;
        }
    }
    true
}
