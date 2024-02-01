//suffix - Trie

import 'dart:collection';
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

//Prefix Trie -  Just changing loop structure 

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
