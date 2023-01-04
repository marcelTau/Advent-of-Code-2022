use std::collections::HashSet;

fn part1(fname: &str) -> usize {
    let lines = std::fs::read_to_string(fname).unwrap();
    let lines: Vec<&str> = lines.split("\n").collect();
    let lines = lines.into_iter().filter(|line| !line.is_empty()).collect::<Vec<&str>>();

    let mut grid: Vec<Vec<char>> = vec![];
    lines
        .iter()
        .for_each(|line| grid.push(line.chars().collect::<Vec<char>>()));

    let width = lines[0].len() as i32;
    let height = lines.len() as i32;

    println!("{width}, {height}");

    let up = (-1, 0);
    let down = (1, 0);
    let left = (0, -1);
    let right = (0, 1);

    let mut total = HashSet::new();

    for (start, step, search_dir) in [
        ((0, 0), right, down),
        ((0, 0), down, right),
        ((height - 1, width - 1), up, left),
        ((height - 1, width - 1), left, up),
    ] {
        let mut walk = start;

        while walk.0 >= 0 && walk.0 < height && walk.1 >= 0 && walk.1 < width {
            let (mut row, mut col) = walk;
            let mut tallest = grid[row as usize][col as usize];

            total.insert((row, col));

            while tallest < '9' {
                row += search_dir.0;
                col += search_dir.1;
                if row < 0 || row >= height || col < 0 || col >= width {
                    break;
                }

                let tree = grid[row as usize][col as usize];

                if tree > tallest {
                    total.insert((row, col));
                    tallest = tree;
                }
            }

            walk.0 += step.0;
            walk.1 += step.1;
        }
    }

    total.len()
}

fn part2(fname: &str) -> usize {
    let lines = std::fs::read_to_string(fname).unwrap();
    let lines: Vec<&str> = lines.split("\n").collect();
    let lines = lines.into_iter().filter(|line| !line.is_empty()).collect::<Vec<&str>>();

    let mut grid: Vec<Vec<char>> = vec![];
    lines
        .iter()
        .for_each(|line| grid.push(line.chars().collect::<Vec<char>>()));

    let width = lines[0].len() as i32;
    let height = lines.len() as i32;

    println!("{width}, {height}");

    let up = (-1, 0);
    let down = (1, 0);
    let left = (0, -1);
    let right = (0, 1);

    let mut max = 0;

    for row in 1..height - 1 {
        for col in 1..width - 1 {
            let mut total = 1;
            for step in [up, down, left, right] {
                let mut walk = (row, col);

                let current_height = grid[row as usize][col as usize];
                walk.0 += step.0;
                walk.1 += step.1;

                let mut count = 0;
                while walk.0 >= 0 && walk.0 < height && walk.1 >= 0 && walk.1 < width {
                    count += 1;

                    if grid[walk.0 as usize][walk.1 as usize] >= current_height {
                        break;
                    }

                    walk.0 += step.0;
                    walk.1 += step.1;
                }

                total *= count;
            }
            max = max.max(total);
        }
    }
    max
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn ex1() {
        assert_eq!(part1("inputs/day8.test"), 21);
    }

    #[test]
    fn ex2() {
        assert_eq!(part1("inputs/day8.input"), 1805);
    }

    #[test]
    fn ex3() {
        assert_eq!(part2("inputs/day8.test"), 8);
    }

    #[test]
    fn ex4() {
        assert_eq!(part2("inputs/day8.input"), 444528);
    }
}
