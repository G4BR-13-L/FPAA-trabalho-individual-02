fn soma(x: usize, y: usize) -> usize{
    return x + y;
}

fn main() {
    println!("{}", soma(2,2));
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn testar_soma() {
        assert_eq!(soma(2, 2), 4);
        assert_eq!(soma(3, 3), 6);
        assert_eq!(soma(10, 10), 20);
        assert_eq!(soma(1, 1), 2);
    }
}

