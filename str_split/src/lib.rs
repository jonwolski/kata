pub struct StrSplit<'a, 'b> {
    remainder: Option<&'a str>,
    delimiter: &'b str,
}

impl<'a, 'b> StrSplit<'a, 'b> {
    pub fn new(haystack: &'a str, delimiter: &'b str) -> Self {
        Self {
            remainder: Some(haystack),
            delimiter,
        }
    }
}

impl<'a> Iterator for StrSplit<'a, '_> {
    type Item = &'a str;

    fn next(&mut self) -> Option<Self::Item> {
        let remainder = self.remainder.as_ref()?;

        if let Some(position) = remainder.find(self.delimiter) {
            let item = Some(&remainder[..position]);
            self.remainder = Some(&remainder[(position + self.delimiter.len())..]);
            item.filter(|r| r.len() > 0).or_else(|| self.next())
        } else {
            if remainder.len() == 0 {
                return None;
            }
            self.remainder.take()
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn splits_a_delimited_string() {
        let haystack = "a b c d e";
        let actual: Vec<_> = StrSplit::new(haystack, " ").collect();
        assert_eq!(actual, vec!["a", "b", "c", "d", "e"]);
    }

    #[test]
    fn empty_string() {
        let haystack = "";
        let actual: Vec<_> = StrSplit::new(haystack, " ").collect();
        assert!(actual.is_empty());
    }

    #[test]
    fn tail_delimiter() {
        let haystack = "a b c d e ";
        let actual: Vec<_> = StrSplit::new(haystack, " ").collect();
        assert_eq!(actual, vec!["a", "b", "c", "d", "e"]);
    }

    #[test]
    fn head_delimiter() {
        let haystack = " a b c d e";
        let actual: Vec<_> = StrSplit::new(haystack, " ").collect();
        assert_eq!(actual, vec!["a", "b", "c", "d", "e"]);
    }

    #[test]
    fn multiple_delims() {
        let haystack = "  a  b";
        let actual: Vec<_> = StrSplit::new(haystack, " ").collect();
        assert_eq!(actual, vec!["a", "b"]);
    }
}
