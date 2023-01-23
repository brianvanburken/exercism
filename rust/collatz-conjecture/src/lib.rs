pub fn collatz(n: u64) -> Option<u64> {
    if n == 0 {
        return None;
    }
    let mut n = n;
    let mut count = 0;
    while n != 1 {
        count += 1;
        if n & 1 == 0 {
            n = n >> 1;
        } else {
            n = n.checked_mul(3)?.checked_add(1)?;
        }
    }
    Some(count)
}
