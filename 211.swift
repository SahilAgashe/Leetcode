// 211. Design Add and Search Words Data Structure
// https://leetcode.com/problems/design-add-and-search-words-data-structure/description/
// Medium

// Modified Trie Data Structure
class WordDictionary {
    class TrieNode {
        var children: Dictionary<Character, TrieNode>
        var isEndOfWord: Bool
        init() {
            children = Dictionary<Character, TrieNode>()
            isEndOfWord = false
        }
    }

    let root: TrieNode

    init() {
        root = TrieNode()
    }
    
    func addWord(_ word: String) {
        var node = root
        for ch in word {
            if node.children[ch] == nil {
                node.children[ch] = TrieNode()
            }
            if let next = node.children[ch] {
                node = next
            }
        }
        node.isEndOfWord = true
    }
    
    func search(_ word: String) -> Bool {
        var node = root 
        let chars = Array<Character>(word)
        for i in 0..<(chars.count) {
            let ch = chars[i]
            if ch == "." {
               for next in node.children.values {
                let run = dfs(next, i + 1, chars)
                if run { return true }
               }
               return false
            } else {
                 if let next = node.children[ch] {
                    node = next
                 } else {
                    return false
                 }
            }
        }
        return node.isEndOfWord
    }

    func dfs(_ root: TrieNode, _ index: Int, _ chars: Array<Character>) -> Bool {
        var node = root
        let n = chars.count
        if index == n {
            return node.isEndOfWord
        }
        guard index < n else { return true}

        for i in index..<n {
            let ch = chars[i]
            if ch == "." {
              for next in node.children.values {
                let run = dfs(next, i + 1, chars)
                if run { return run }
               }
               return false 
            } else {
                if let next = node.children[ch] {
                node = next
               } else {
                return false
               }
            }
        }
        return node.isEndOfWord
    }
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */