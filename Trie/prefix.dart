import 'dart:collection';

class TrieNode {
  HashMap children = HashMap();
  bool? isEnd;
}


class Trie {
  TrieNode root = TrieNode();
  

  void insertSubstringAt(String str) {
    TrieNode temp = root;

    for (int i = 0; i < str.length; i++) {
      if (!temp.children.containsKey(str[i])) { //if character is not present,create a node
        TrieNode newNode = TrieNode();
        temp.children[str[i]] = newNode;
      } 
      temp = temp.children[str[i]];
    }
    temp.isEnd=true;//mark end 
  }


  bool contains(String str) {
    TrieNode temp = root;

    for (int i = 0; i < str.length; i++) {

      if (temp.children[str[i]] == null || !temp.children.containsKey(str[i])) {
        return false;
      }
      temp = temp.children[str[i]];
    }
    return true;
  }
}

void main() {

  Trie newTrie = Trie();
  newTrie.insertSubstringAt("farhan");
  print(newTrie.contains("fa"));
}
