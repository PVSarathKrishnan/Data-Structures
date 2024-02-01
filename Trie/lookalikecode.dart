//Prefix  - Trie
import 'dart:collection';

class TrieNode {
  HashMap<String, TrieNode> children = HashMap();
  bool end = false;
}

class Trie {
  TrieNode root = TrieNode();

  void insertWord(String word) {
    TrieNode temp = root;

    for (int i = 0; i < word.length; i++) {
      if (!temp.children.containsKey(word[i])) {
        TrieNode newNode = TrieNode();
        temp.children[word[i]] = newNode;
      }
      temp = temp.children[word[i]]!;
    }
    temp.end = true; // Mark the end of the inserted word.
  }

  bool containsPrefix(String prefix) {
    TrieNode temp = root;

    for (int i = 0; i < prefix.length; i++) {
      if (temp.children[prefix[i]] == null ||
          !temp.children.containsKey(prefix[i])) {
        return false;
      }
      temp = temp.children[prefix[i]]!;
    }
    return true; // Return true for any prefix of inserted words.
  }
}

//suffix - Trie -just reversing the for loop structure is enough 

class TrieNode{
  HashMap<String, TrieNode> children = HashMap();
  bool end = false;
}

class Trie {
  TrieNode root = TrieNode();

  void insertWord(String word) {
    TrieNode temp = root;
for(int i = word.length-1;i>=0;i--){
  if(!temp.children.containsKey(word[i])) {
    TrieNode newNode = TrieNode();
    temp.children[word[i]] = newNode;
  }
  temp = temp.children[word[i]]!;
}
    temp.end = true;//end marking
  }

  //contains function
  bool containsSuffix(String suffix) {
    TrieNode temp = root;
    for(int i=suffix.length-1;i>=0;i--) {
      if(temp.children[suffix[i]]==null ||
        !temp.children.containsKey(suffix[i])) {
        return false;
      }
      temp = temp.children[suffix[i]]!;
    }
    return true;
  }
}


void main() {
  Trie newTrie = Trie();
  newTrie.insertWord("farhan");
  newTrie.insertWord("alto");

  print(newTrie.containsSuffix("alt")); // Output: false
  print(newTrie.containsSuffix("lto")); // Output: true
  print(newTrie.containsPrefix("far")); // Output: true
  print(newTrie.containsPrefix("han")); // Output: false
}

