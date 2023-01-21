#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq>(first_list: &[T], second_list: &[T]) -> Comparison {
    match (first_list, second_list) {
        (a, b) if a.is_empty() && b.is_empty() => Comparison::Equal,
        (a, _) if a.is_empty() => Comparison::Sublist,
        (_, b) if b.is_empty() => Comparison::Superlist,
        (a, b) if a == b => Comparison::Equal,
        (a, b) if is_sublist(a, b) => Comparison::Sublist,
        (a, b) if is_sublist(b, a) => Comparison::Superlist,
        _ => Comparison::Unequal,
    }
}

fn is_sublist<T: PartialEq>(first_list: &[T], second_list: &[T]) -> bool {
    second_list
        .windows(first_list.len())
        .any(|window| window == first_list)
}
