use std::str::FromStr;
use std::num::ParseFloatError;

enum Token {
  Plus,
  Minus,
  Star,
  Slash,
  Val(f32),
}
use Token::*;

impl FromStr for Token {
  type Err = ParseFloatError;

  fn from_str(token: &str) -> Result<Self, ParseFloatError> {
    match token {
      "+" => Ok(Plus),
      "-" => Ok(Minus),
      "*" => Ok(Star),
      "/" => Ok(Slash),
      ""  => Ok(Val(0.0)),
      _ => token.parse().map(|f| Val(f))
    }
  }
}

fn reduce(tokens: Vec<Token>) -> f32 {
  let mut stack : Vec<f32> = Vec::with_capacity(tokens.len());
  stack.push(0.0);
  tokens.iter().fold(stack, |mut stack, ref token| {
    match *token {
      &Plus  => {
        let a = stack.pop().unwrap();
        let b = stack.pop().unwrap();
        stack.push(a + b)
      },
      &Minus => {
        let a = stack.pop().unwrap();
        let b = stack.pop().unwrap();
        stack.push(b - a)
      },
      &Star  => {
        let a = stack.pop().unwrap();
        let b = stack.pop().unwrap();
        stack.push(a * b)
      },
      &Slash => {
        let a = stack.pop().unwrap();
        let b = stack.pop().unwrap();
        stack.push(b / a)
      },
      &Val(v) => stack.push(v),
    };
    stack
  }).pop().unwrap()
}

pub fn calc(expr: &str) -> f32 {
  let tokens : Vec<Token> = expr.split_whitespace().filter_map(|x| x.parse().ok()).collect();
  reduce(tokens)
}

// Rust test example:
// TODO: replace with your own tests (TDD), these are just how-to examples.
// See: https://doc.rust-lang.org/book/testing.html
#[cfg(test)]
mod test {
  use super::calc;

  #[test]
  fn works_with_empty_string() {
    assert_eq!(calc(""), 0.0);
  }

  #[test]
  fn parses_numbers() {
    assert_eq!(calc("3"), 3.0);
  }

  #[test]
  fn parses_floating_point_numbers() {
    assert_eq!(calc("3.5"), 3.5);
  }

  #[test]
  fn supports_addition() {
    assert_eq!(calc("1 3 +"), 4.0);
  }

  #[test]
  fn supports_multiplication() {
    assert_eq!(calc("1 3 *"), 3.0);
  }

  #[test]
  fn supports_subtraction() {
    assert_eq!(calc("1 3 -"), -2.0);
  }

  #[test]
  fn supports_division() {
    assert_eq!(calc("4 2 /"), 2.0);
  }
}
