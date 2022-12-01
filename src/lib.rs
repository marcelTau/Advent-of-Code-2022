#![allow(dead_code)]

mod day1;

pub fn read_lines(path: &str) -> Vec<String> {
    std::fs::read_to_string(path)
        .unwrap_or_else(|_| panic!("Unable to open file: {path}"))
        .split('\n')
        .map(|s| s.to_string())
        .collect()
}