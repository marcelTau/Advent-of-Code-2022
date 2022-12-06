// Definition for a binary tree node.
 #[derive(Debug, PartialEq, Eq)]
 pub struct TreeNode {
   pub val: i32,
   pub left: Option<Rc<RefCell<TreeNode>>>,
   pub right: Option<Rc<RefCell<TreeNode>>>,
 }
// 
 impl TreeNode {
   #[inline]
   pub fn new(val: i32) -> Self {
     TreeNode {
       val,
       left: None,
       right: None
     }
   }
 }
use std::rc::Rc;
use std::cell::RefCell;
struct Solution;
impl Solution {
    pub fn has_path_sum(root: Option<Rc<RefCell<TreeNode>>>, target_sum: i32) -> bool {
        let root = root.unwrap();

        fn helper(root: Rc<RefCell<TreeNode>>, current_sum: i32, target_sum: i32) -> bool {
            match (root.borrow().left.as_ref(), root.borrow().right.as_ref()) {
                (None, None) => root.borrow().val + current_sum == target_sum,
                (Some(left), None) => helper(left.clone(), root.borrow().val + current_sum, target_sum),
                (None, Some(right)) => helper(right.clone(), root.borrow().val + current_sum, target_sum),
                (_, _) => false
            }
        }
        return helper(root, 0, target_sum);
    }
}


struct CrateStacks {
    stack: Vec<Vec<char>>,
    instructions: Vec<String>,
    pattern: Vec<String>,
}

impl CrateStacks {
    fn mov(&mut self, from: usize, to: usize, count: usize) -> Option<()> {
        let from = from - 1;
        let to = to - 1;

        for _ in 1..=count {
            let item = self.stack.get_mut(from)?.pop()?;
            self.stack.get_mut(to)?.push(item);
        }
        Some(())
    }

    fn mov2(&mut self, from: usize, to: usize, count: usize) -> Option<()> {
        let from = from - 1;
        let to = to - 1;

        let mut tmp = Vec::new();
        for _ in 1..=count {
            let item = self.stack.get_mut(from)?.pop()?;
            tmp.insert(0, item);
        }
        self.stack.get_mut(to)?.append(&mut tmp);
        Some(())
    }

    fn apply_instructions(&mut self) {
        for ins in self.instructions[1..self.instructions.len() - 1].to_vec() {
            let nums: Vec<usize> = ins.split(' ').flat_map(str::parse).collect();
            if let [count, from, to] = nums[..] {
                self.mov(from, to, count);
            }
        }
    }

    fn apply_instructions2(&mut self) {
        for ins in self.instructions[1..self.instructions.len() - 1].to_vec() {
            let nums: Vec<usize> = ins.split(' ').flat_map(str::parse).collect();
            if let [count, from, to] = nums[..] {
                self.mov2(from, to, count);
            }
        }
    }

    pub fn get_solution(&self) -> String {
        self.stack.iter().flat_map(|s| s.last()).collect()
    }


    pub fn from(fname: impl Into<String>) -> Self {
        let lines = std::fs::read_to_string(fname.into()).unwrap();
        let lines: Vec<&str> = lines.split("\n").collect();
        let (pattern, instructions) =
            lines.split_at(lines.iter().position(|s| s.is_empty()).unwrap());
        let indecies: Vec<usize> = (1..=(pattern.last().unwrap().len() - 1))
            .step_by(4)
            .collect();

        let mut stacks: Vec<Vec<char>> = vec![Vec::new(); indecies.len()];

        for line in pattern[..pattern.len() - 1].to_vec() {
            for (i, idx) in indecies.iter().enumerate() {
                match line.chars().nth(*idx) {
                    Some(' ') => (),
                    Some(n) => stacks.get_mut(i).unwrap().insert(0, n as char),
                    None => (),
                }
            }
        }

        return Self {
            stack: stacks,
            instructions: instructions.iter().map(|s| s.to_string()).collect(),
            pattern: pattern.iter().map(|s| s.to_string()).collect(),
        };
    }
}

fn part1(fname: impl Into<String>) -> String {
    let mut stack = CrateStacks::from(fname);
    stack.apply_instructions();
    stack.get_solution()
}

fn part2(fname: impl Into<String>) -> String {
    let mut stack = CrateStacks::from(fname);
    stack.apply_instructions2();
    stack.get_solution()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn ex1() {
        assert_eq!(part1("inputs/day5.test"), "CMZ".to_string());
    }
    #[test]
    fn ex2() {
        assert_eq!(part1("inputs/day5.input"), "FCVRLMVQP".to_string());
    }
    #[test]
    fn ex3() {
        assert_eq!(part2("inputs/day5.test"), "MCD".to_string());
    }
    #[test]
    fn ex4() {
        assert_eq!(part2("inputs/day5.input"), "RWLWGJGFD".to_string());
    }
}
