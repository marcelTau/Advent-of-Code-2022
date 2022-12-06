use std::collections::HashSet;
fn part1(fname: &str, marker_size: usize) -> usize {
    let input = std::fs::read_to_string(fname).unwrap();

    for i in 0..=input.len() {
        let x = input.chars().skip(i).take(marker_size);
        let hs: HashSet<char> = HashSet::from_iter(x);

        if hs.len() == marker_size {
            return i + marker_size;
        }
    }

    0
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn ex1() {
        assert_eq!(part1("inputs/day6.input", 4), 1361);
    }

    #[test]
    fn ex2() {
        assert_eq!(part1("inputs/day6.input", 14), 3263);
    }
}
