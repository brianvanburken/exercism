use collatz_conjecture::*;

#[test]
fn test_1() {
    assert_eq!(Some(0), collatz(1));
}

#[test]
fn test_16() {
    assert_eq!(Some(4), collatz(16));
}

#[test]
fn test_12() {
    assert_eq!(Some(9), collatz(12));
}

#[test]
fn test_1000000() {
    assert_eq!(Some(152), collatz(1_000_000));
}

#[test]
fn test_0() {
    assert_eq!(None, collatz(0));
}

#[test]
fn test_110243094271() {
    let val = 110243094271;
    assert_eq!(None, collatz(val));
}

#[test]
fn test_max_div_3() {
    let max = u64::MAX / 3;
    assert_eq!(None, collatz(max));
}

#[test]
fn test_max_minus_1() {
    let max = u64::MAX - 1;
    assert_eq!(None, collatz(max));
}
