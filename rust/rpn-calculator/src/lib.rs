#[derive(Debug)]
pub enum CalculatorInput {
    Add,
    Subtract,
    Multiply,
    Divide,
    Value(i32),
}

pub fn evaluate(inputs: &[CalculatorInput]) -> Option<i32> {
    let mut stack = Vec::new();
    for input in inputs {
        match input {
            CalculatorInput::Add => {
                let rhs = stack.pop()?;
                let lhs = stack.pop()?;
                stack.push(lhs + rhs);
            }
            CalculatorInput::Subtract => {
                let rhs = stack.pop()?;
                let lhs = stack.pop()?;
                stack.push(lhs - rhs);
            }
            CalculatorInput::Multiply => {
                let rhs = stack.pop()?;
                let lhs = stack.pop()?;
                stack.push(lhs * rhs);
            }
            CalculatorInput::Divide => {
                let rhs = stack.pop()?;
                let lhs = stack.pop()?;
                stack.push(lhs / rhs);
            }
            CalculatorInput::Value(value) => stack.push(*value),
        }
    }

    if stack.len() == 1 {
        stack.pop()
    } else {
        None
    }
}
