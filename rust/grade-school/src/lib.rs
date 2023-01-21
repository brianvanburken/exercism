use std::collections::{HashMap, HashSet};

// This annotation prevents Clippy from warning us that `School` has a
// `fn new()` with no arguments, but doesn't implement the `Default` trait.
//
// Normally, it's good practice to just do what Clippy tells you, but in this
// case, we want to keep things relatively simple. The `Default` trait is not the point
// of this exercise.
#[allow(clippy::new_without_default)]

pub struct School {
    students_by_grade: HashMap<u32, Vec<String>>,
    grades: HashSet<u32>,
}

impl School {
    pub fn new() -> School {
        School {
            students_by_grade: HashMap::new(),
            grades: HashSet::new(),
        }
    }

    pub fn add(&mut self, grade: u32, student: &str) {
        self.students_by_grade
            .entry(grade)
            .or_default()
            .push(student.to_owned());
        self.grades.insert(grade);
    }

    pub fn grades(&self) -> Vec<u32> {
        let mut result = Vec::from_iter(self.grades.to_owned());
        result.sort();
        result
    }

    // If `grade` returned a reference, `School` would be forced to keep a `Vec<String>`
    // internally to lend out. By returning an owned vector of owned `String`s instead,
    // the internal structure can be completely arbitrary. The tradeoff is that some data
    // must be copied each time `grade` is called.
    pub fn grade(&self, grade: u32) -> Vec<String> {
        if let Some(students) = self.students_by_grade.get(&grade) {
            let mut result = students.to_owned();
            result.sort();
            result
        } else {
            vec![]
        }
    }
}
