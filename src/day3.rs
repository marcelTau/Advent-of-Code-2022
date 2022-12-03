use std::collections::HashSet;

use crate::read_lines;
use itertools::Itertools;

fn part1(input: Vec<String>) -> usize {
    input
        .into_iter()
        .map(|line| {
            let (lhs, rhs) = line.split_at(line.len() / 2);
            lhs.chars()
                .sorted()
                .dedup()
                .map(|c| match rhs.contains(c) {
                    true => match c.is_lowercase() {
                        true => (c as usize) - 96,
                        false => (c as usize) - 38,
                    },
                    false => 0,
                })
                .sum()
        })
        .collect::<Vec<usize>>()
        .iter()
        .sum()
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
        let c = dup.iter().next().unwrap();
        sum += match c.is_lowercase() {
            true => (*c as usize) - 96,
            false => (*c as usize) - 38,
        }
    }

    sum
}

#[cfg(test)]
mod tests {
    use super::*;

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
