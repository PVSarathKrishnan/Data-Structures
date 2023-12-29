import 'dart:collection';

class trieNode{
  HashMap children = HashMap();
  bool? isEnd;
}

class trie{
  trieNode root = trieNode();

  void insert(String str){
    trieNode temp = root;
    for(int i=0;i<str.length;i++){
      if(!temp.children.containsKey(str[i])){
        trieNode newNode = trieNode();
        temp.children[str[i]]=newNode;
      }
      temp = temp.children[str[i]];
    }
    temp.isEnd=true;
  }

  bool contains(String str){
    trieNode temp = root;
    for(int i=0;i<str.length;i++){
      if(temp.children[str[i]]==null || !temp.children.containsKey(str[i])){
        return false;
      }
      temp = temp.children[str[i]];
    }
    return true;
  }

}


void main(){
  trie t = trie();
  t.insert("asd");
  print(t.contains("d"));
}