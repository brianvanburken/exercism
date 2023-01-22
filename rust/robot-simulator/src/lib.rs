// The code below is a stub. Just enough to satisfy the compiler.
// In order to pass the tests you can add-to or change any of this code.

#[derive(PartialEq, Eq, Debug)]
pub enum Direction {
    North,
    East,
    South,
    West,
}

pub struct Robot {
    x: i32,
    y: i32,
    facing: Direction,
}

impl Robot {
    pub fn new(x: i32, y: i32, d: Direction) -> Self {
        Robot { x, y, facing: d }
    }

    #[must_use]
    pub fn turn_right(self) -> Self {
        let facing = match self.facing {
            Direction::East => Direction::South,
            Direction::West => Direction::North,
            Direction::North => Direction::East,
            Direction::South => Direction::West,
        };
        Self { facing, ..self }
    }

    #[must_use]
    pub fn turn_left(self) -> Self {
        let facing = match self.facing {
            Direction::East => Direction::North,
            Direction::West => Direction::South,
            Direction::North => Direction::West,
            Direction::South => Direction::East,
        };
        Self { facing, ..self }
    }

    #[must_use]
    pub fn advance(self) -> Self {
        match self {
            Self {
                x,
                y,
                facing: Direction::East,
            } => Self {
                x: x + 1,
                y,
                facing: self.facing,
            },
            Self {
                x,
                y,
                facing: Direction::West,
            } => Self {
                x: x - 1,
                y,
                facing: self.facing,
            },
            Self {
                x,
                y,
                facing: Direction::North,
            } => Self {
                x,
                y: y + 1,
                facing: self.facing,
            },
            Self {
                x,
                y,
                facing: Direction::South,
            } => Self {
                x,
                y: y - 1,
                facing: self.facing,
            },
        }
    }

    #[must_use]
    pub fn instructions(self, instructions: &str) -> Self {
        let mut robot = self;
        for instruction in instructions.chars() {
            robot = match instruction {
                'L' => robot.turn_left(),
                'R' => robot.turn_right(),
                'A' => robot.advance(),
                _ => panic!("Expected instructions to be one of: L, R, or A"),
            }
        }
        robot
    }

    pub fn position(&self) -> (i32, i32) {
        (self.x, self.y)
    }

    pub fn direction(&self) -> &Direction {
        &self.facing
    }
}
