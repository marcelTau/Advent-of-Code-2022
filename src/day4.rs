use std::str::FromStr;

#[derive(Debug)]
struct Pair {
    pub start: usize,
    pub end: usize,
}

impl FromStr for Pair {
    type Err = ();

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        let (lhs, rhs) = s.split_once("-").unwrap();

        Ok(Self {
            start: lhs.parse().unwrap(),
            end: rhs.parse().unwrap(),
        })
    }
}

#[derive(Debug)]
struct Assignment {
    left: Pair,
    right: Pair,
}

impl FromStr for Assignment {
    type Err = ();

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        let (lhs, rhs) = s.split_once(",").unwrap();

        Ok(Self {
            left: lhs.parse().unwrap(),
            right: rhs.parse().unwrap(),
        })
    }
}

impl Assignment {
    pub fn is_contained(&self) -> bool {
        (self.left.start <= self.right.start && self.left.end >= self.right.end)
            || (self.left.start >= self.right.start && self.left.end <= self.right.end)
    }

    pub fn is_overlapped(&self) -> bool {
        (self.left.start >= self.right.start && self.left.start <= self.right.end)
            || (self.right.start >= self.left.start && self.right.start <= self.left.end)
    }
}

fn part1(lines: Vec<String>) -> usize {
    lines
        .into_iter()
        .filter(|s| !s.is_empty())
        .map(|line| line.parse::<Assignment>().unwrap())
        .filter(|a| a.is_contained())
        .count()
}

fn part2(lines: Vec<String>) -> usize {
    lines
        .into_iter()
        .filter(|s| !s.is_empty())
        .map(|line| line.parse::<Assignment>().unwrap())
        .filter(|a| a.is_overlapped())
        .count()
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::read_lines;

    #[test]
    fn ex1() {
        assert_eq!(part1(read_lines("inputs/day4.test")), 2);
    }

    #[test]
    fn ex2() {
        assert_eq!(part1(read_lines("inputs/day4.input")), 657);
    }

    #[test]
    fn ex3() {
        assert_eq!(part2(read_lines("inputs/day4.test")), 4);
    }

    #[test]
    fn ex4() {
        assert_eq!(part2(read_lines("inputs/day4.input")), 938);
    }
}
