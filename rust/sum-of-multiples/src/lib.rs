fn n_if_factor(n: u32, factors: &[u32]) -> u32 {
    for factor in factors {
        if *factor == 0 {
            return 0;
        }
        if n % factor == 0 {
            return n;
        }
    }
    return 0;
}

pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    let mut sum = 0;

    for n in 0..limit {
        sum += n_if_factor(n, factors);
    }

    sum
}
