class Node{
  int data;
  Node? left,right;
  Node({required this.data});
}

class bst{
  Node? root;

  void insert(int data){
    Node newNode = Node(data: data);
    Node? currNode = root;
    if(currNode == null){
      root = newNode;
      return;
    }
    while(true){
      if(data<currNode!.data){
      if(currNode.left == null){
        currNode.left=newNode;
        break;
      }
      currNode=currNode.left;
      }
      else{
        if(currNode.right==null){
          currNode.right = newNode;
          break;
        }
        currNode=currNode.right;
      }
    }
  }

  bool contains(int target){
    Node? currNode = root;
    while(currNode != null){
      if(target<currNode.data){
        currNode = currNode.left;
      }
      else if(target>currNode.data){
        currNode=currNode.right;
      }
      else{
        return true;
      }
    }
    return false;
  }

}

void main(){
bst b = bst();
b.insert(10);
b.insert(20);
b.insert(5);

print(b.contains(10 ));
}