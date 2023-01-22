// This code is optimized using the Sieve of Eratosthenes algorithm.
pub fn factors(n: u64) -> Vec<u64> {
    let mut val = n;
    let mut out: Vec<u64> = vec![];
    let mut possible: u64 = 2;
    let upper_bound = (n as f64).sqrt() as u64 + 1;
    while val > 1 && possible <= upper_bound {
        while val % possible == 0 {
            out.push(possible);
            val /= possible;
        }
        possible += 1;
    }
    if val > 1 {
        out.push(val);
    }
    out
}
