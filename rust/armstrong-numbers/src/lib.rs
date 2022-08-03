pub fn is_armstrong_number(num: u32) -> bool {
    if num < 10 {
        return true;
    }

    let mut sum = 0;
    let mut temp = num.clone();
    let len = num_of_digits(num);

    while temp > 0 {
        let remainder = temp % 10;
        sum += remainder.pow(len);
        temp /= 10;
    }

    num == sum
}

fn num_of_digits(num: u32) -> u32 {
    let mut i = 0;
    let mut temp = num.clone();

    while temp > 0 {
        temp /= 10;
        i += 1;
    }
    i
}
