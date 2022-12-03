use itertools::Itertools;
use std::collections::HashSet;

trait Priority {
    fn priority(&self) -> usize;
}

impl Priority for char {
    fn priority(&self) -> usize {
        match self.is_lowercase() {
            true => (*self as usize) - 96,
            false => (*self as usize) - 38,
        }
    }
}

fn part1(input: Vec<String>) -> usize {
    input
        .into_iter()
        .map(|line| {
            let (lhs, rhs) = line.split_at(line.len() / 2);
            lhs.chars()
                .sorted()
                .dedup()
                .filter(|c| rhs.contains(*c))
                .map(|c| c.priority())
                .sum::<usize>()
        })
        .sum::<usize>()
}

fn part2(input: Vec<String>) -> usize {
    let all_chars = HashSet::<char>::from_iter(('a'..='z').chain('A'..='Z'));
    let mut sum = 0;

    let input: Vec<String> = input.into_iter().filter(|s| !s.is_empty()).collect();

    for lines in input.chunks(3) {
        let dup = lines
            .iter()
            .map(|line| HashSet::from_iter(line.chars()))
            .fold(all_chars.clone(), |a, b| {
                a.intersection(&b).copied().collect()
            });
        sum += dup.iter().next().unwrap().priority();
    }
    sum
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::read_lines;

    #[test]
    fn ex1() {
        assert_eq!(part1(read_lines("inputs/day3.test")), 157);
    }

    #[test]
    fn ex2() {
        assert_eq!(part1(read_lines("inputs/day3.input")), 8185);
    }

    #[test]
    fn ex3() {
        assert_eq!(part2(read_lines("inputs/day3.test")), 70);
    }

    #[test]
    fn ex4() {
        assert_eq!(part2(read_lines("inputs/day3.input")), 2817);
    }
}
