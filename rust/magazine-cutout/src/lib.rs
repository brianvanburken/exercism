// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

use std::collections::HashMap;

pub fn can_construct_note(magazine: &[&str], note: &[&str]) -> bool {
    let mut word_counter: HashMap<&str, i32> = HashMap::with_capacity(magazine.len());

    for m in magazine {
        word_counter.entry(*m).and_modify(|i| *i += 1).or_insert(1);
    }

    for n in note {
        word_counter.entry(*n).and_modify(|i| *i -= 1).or_insert(-1);

        if word_counter[n] < 0 {
            return false;
        }
    }

    true
}
