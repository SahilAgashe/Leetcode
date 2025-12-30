// 208. Implement Trie (Prefix Tree)
// https://leetcode.com/problems/implement-trie-prefix-tree/description/
// Medium 

/*
Trie Data Structure Theory 
Trie is also known as Prefix Tree
Trie -> K ary tree
Root is empty node, means dont have character
UseCase => Autocompletion , Spellchecker 
Time Complexity of Trie Operations =>
Insert word  => O(l) , l = length of word
Search word  => O(l) , l = lenth of word
Starts with prefix => O(l) , l = length of prefix
*/
class Trie {
    class TrieNode {
        var children: [Character: TrieNode]
        var isEndOfWord: Bool 
        init() {
            children = [Character: TrieNode]()
            isEndOfWord = false
        }
    }
    
    private var root: TrieNode

    init() {
        root = TrieNode()
    }
    
    func insert(_ word: String) {
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
        for ch in word {
            if let next = node.children[ch] {
                node = next
            } else {
                return false
            }
        }
        return node.isEndOfWord
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var node = root 
        for ch in prefix {
            if let next = node.children[ch] {
                node = next
            } else {
                return false
            }
        }
        return true
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */