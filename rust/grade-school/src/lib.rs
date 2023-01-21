use std::{collections::HashMap, result};

// This annotation prevents Clippy from warning us that `School` has a
// `fn new()` with no arguments, but doesn't implement the `Default` trait.
//
// Normally, it's good practice to just do what Clippy tells you, but in this
// case, we want to keep things relatively simple. The `Default` trait is not the point
// of this exercise.
#[allow(clippy::new_without_default)]

pub struct School {
    students: HashMap<String, Vec<u32>>,
}

impl School {
    pub fn new() -> School {
        School {
            students: HashMap::new(),
        }
    }

    pub fn add(&mut self, grade: u32, student: &str) {
        self.students
            .entry(student.to_owned())
            .or_default()
            .push(grade);
    }

    pub fn grades(&self) -> Vec<u32> {
        let mut grades = self
            .students
            .values()
            .flatten()
            .cloned()
            .collect::<Vec<u32>>();
        grades.dedup();
        grades.sort();
        grades
    }

    // If `grade` returned a reference, `School` would be forced to keep a `Vec<String>`
    // internally to lend out. By returning an owned vector of owned `String`s instead,
    // the internal structure can be completely arbitrary. The tradeoff is that some data
    // must be copied each time `grade` is called.
    pub fn grade(&self, grade: u32) -> Vec<String> {
        let mut result = self
            .students
            .iter()
            .filter_map(|(student, grades)| {
                if grades.contains(&grade) {
                    Some(student.to_owned())
                } else {
                    None
                }
            })
            .collect::<Vec<String>>();
        result.sort();
        result
    }
}
