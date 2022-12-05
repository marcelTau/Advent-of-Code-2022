struct CrateStacks {
    stack: Vec<Vec<char>>,
}

impl CrateStacks {
    fn mov(stack: &mut Vec<Vec<char>>, from: usize, to: usize, count: usize) {
        let from = from - 1;
        let to = to - 1;

        //println!("before: {stack:#?}");
        for _ in 1..=count {
            let item = stack.get_mut(from).unwrap().pop().unwrap();
            stack.get_mut(to).unwrap().push(item);
        }
        //println!("after: {stack:#?}");
    }

    fn mov2(stack: &mut Vec<Vec<char>>, from: usize, to: usize, count: usize) {
        let from = from - 1;
        let to = to - 1;

        //println!("before: {stack:#?}");
        let mut tmp = Vec::new();
        for _ in 1..=count {
            let item = stack.get_mut(from).unwrap().pop().unwrap();
            tmp.insert(0, item);
        }
        stack.get_mut(to).unwrap().append(&mut tmp);
        //println!("after: {stack:#?}");
    }

    pub fn from(fname: impl Into<String>) -> String {
        let lines = std::fs::read_to_string(fname.into()).unwrap();
        let lines: Vec<&str> = lines.split("\n").collect();
        let pos = lines.iter().position(|s| s.is_empty());
        let (pattern, instructions) = lines.split_at(pos.unwrap());
        let indecies: Vec<usize> = (1..=(pattern.last().unwrap().len() - 1)).step_by(4).collect();


        let mut stacks: Vec<Vec<char>> = Vec::new();
        for _ in 0..=(indecies.len() - 1) {
            stacks.push(vec![]);
        }

        for line in pattern[..pattern.len() - 1].to_vec() {
            for (i, idx) in indecies.iter().enumerate() {
                match line.chars().nth(*idx) {
                    Some(' ') => (),
                    Some(n) => stacks.get_mut(i).unwrap().insert(0, n as char),
                    None => (),
                }
            }
        }

        // move 1 from 2 to 1

        //println!("{instructions:?}");
        for ins in instructions[1..instructions.len()-1].to_vec() {
            //println!("{ins:?}");
            let s: Vec<&str> = ins.split(' ').collect();
            let count = s[1].parse::<usize>().unwrap();
            let from = s[3].parse::<usize>().unwrap();
            let to = s[5].parse::<usize>().unwrap();

            Self::mov2(&mut stacks, from, to, count);
        }

        stacks.iter().flat_map(|s| s.last()).collect::<String>()
    }
}


fn part1(fname: impl Into<String>) -> String {
    CrateStacks::from(fname)
}

#[cfg(test)]
mod tests {
    use super::*;

    //#[test]
    //fn ex1() {
        //assert_eq!(part1("inputs/day5.test"), "CMZ".to_string());
    //}
    //#[test]
    //fn ex2() {
        //assert_eq!(part1("inputs/day5.input"), "FCVRLMVQP".to_string());
    //}
    #[test]
    fn ex3() {
        assert_eq!(part1("inputs/day5.input"), "MCD".to_string());
    }
}
