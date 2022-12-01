use crate::read_lines;

fn part2(path: &str) -> usize {
    let mut lines = read_lines(path).split(|s| s.is_empty())
        .filter(|slice| !slice.is_empty())
        .map(|slice| slice.iter().map(|val| val.parse::<usize>().unwrap()).sum())
        .collect::<Vec<usize>>();
    lines.sort();
    lines.iter().rev().take(3).sum()
}

fn part1(path: &str) -> usize {
    read_lines(path)
        .split(|s| s.is_empty())
        .filter(|slice| !slice.is_empty())
        .map(|slice| slice.iter().map(|val| val.parse::<usize>().unwrap()).sum())
        .max()
        .unwrap()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn ex1() {
        assert_eq!(part1("inputs/day1.test"), 24000);
        assert_eq!(part1("inputs/day1.input"), 69912);
    }
    #[test]
    fn ex2() {
        assert_eq!(part2("inputs/day1.test"), 45000);
        assert_eq!(part2("inputs/day1.input"), 208180);
    }
}
