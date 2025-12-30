// 139. Word Break
// https://leetcode.com/problems/word-break/description/
// Medium

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let trie = Trie()
        for word in wordDict {
            trie.insert(word)
        }
        var memo = Dictionary<String, Bool>()
        return solve(s, wordDict, trie, &memo)
    }

    func solve(_ s: String, _ wordDict: [String], _ trie: Trie, _ memo: inout Dictionary<String, Bool>) -> Bool {
        if s.isEmpty { 
            return true
        }

        if let alreadySolved = memo[s] {
            return alreadySolved
        }

        let n = s.count
        let chars = Array(s)

        for i in 0..<n {
            let firstPart = String(chars[0..<(i + 1)])
            let secondPart = String(chars[(i + 1)..<n])
            let checkFirstPart = trie.search(firstPart)
            memo[firstPart] = checkFirstPart
            var checkSecondPart = false
            if checkFirstPart {
                checkSecondPart = solve(secondPart, wordDict, trie, &memo)
                memo[secondPart] = checkSecondPart
            }

            if checkFirstPart && checkSecondPart { return true }
        }
        return false
    }
}

/*
Trie Data Structure Theory 
Trie also known as Prefix Tree
Trie -> K ary tree
Root is empty node, means dont have character
UseCase => Autocompletion , Spellchecker 
Time Complexity of Trie Operations =>
Insert word  => O(l) , l = length of word
Search word  => O(l) , l = lenth of word
Starts with prefix => O(l) , l = length of prefix
*/

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
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