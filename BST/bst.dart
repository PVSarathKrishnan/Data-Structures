class Node{
  int data;
  Node? left,right;

  Node({required this.data});
}

class binaryST{

  Node? root;

  void insert(int data){
    Node newNode = Node(data:data);
    Node? curNode = root;
    if(curNode==null){
      root = newNode;
      return;
    }
    while(true){
      if(data < curNode!.data){
        if(curNode.left == null){
          curNode.left = newNode;
          break;
        }
        curNode = curNode.left;
      }
      else{
        if(curNode.right == null){
          curNode.right = newNode;
          break;
        }
        curNode = curNode.right;
      }
    }
  }

  bool contains(int data){
    Node? curNode = root;
    while(curNode!=null){
      if(data<curNode.data){
        curNode = curNode.left;
      }
      else if(data>curNode.data){
        curNode = curNode.right;
      }
      else{
        return true;
      }
    }
    return false;
  }

  int getClose(int target){
    Node? curNode = root;
    int closest = curNode!.data;

    while(curNode != null){
      if((target-closest).abs() > (target-curNode.data).abs()){
        closest = curNode.data;
      }
      if(target < curNode.data){
        curNode = curNode.left;
      }
      else if(target > curNode.data){
        curNode = curNode.right;
      }
      else{
        break;
      }
    }
    return closest;
  }

  void delete(int data){
    deleteHelper(data, root, null);
  }

  void deleteHelper(int data,Node? curNode,Node? parent){
    while(curNode != null){

      if(data < curNode.data){//move to left
        parent =curNode;
        curNode =curNode.left;
      }
      else if(data > curNode.data){//move to right
        parent =curNode;
        curNode =curNode.right;
      }
      else{//item found
        if(curNode.left!=null && curNode.right!=null){ //node has 2 children
          curNode.data = getMin(curNode.right);//data swapped
          deleteHelper(data, curNode.right, curNode);
        }
        else{//node has one child or no child
          Node? child = (curNode.left!=null)?curNode.left : curNode.right;
                if(parent == null){
                  root = child; //if node to be  deleted is root
                }
                else{//update parents reference to the single child
                        if(parent.left == curNode){
                          parent.left = child;
                        }
                        else{
                          parent.right = child;
                        }
              } 
             }
        break;
      }
    }
  }

  int getMin(Node? curNode){
    if(curNode!.left==null){
      return curNode.data;
    }
    else{
      return getMin(curNode.left);
    }
  }

  void inOrder(){
    inOrderHelper(root);
  }
  inOrderHelper(Node? node){
    if(node!=null){
      inOrderHelper(node.left);
      print(node.data);
      inOrderHelper(node.right);
    }
  }

  void preOrder(){
    preOrderHelper(root);
  }
  preOrderHelper(Node? node){
   if(node!=null){
    print(node.data);
    preOrderHelper(node.left);
    preOrderHelper(node.right);
   }
  }

  void postOrder(){
    postOrderHelper(root);
  }
  postOrderHelper(Node? node){
    if(node!=null){
      postOrderHelper(node.left);
      postOrderHelper(node.right);
      print(node.data);
    }
  }

}

void main(){
  binaryST b = binaryST();

  b.insert(10);
  b.insert(15);
  b.insert(5);

  // print(b.contains(5));

  // b.delete(5);

  // print(b.contains(5));

  print(b.getClose(1));

  // b.inOrder();
  // b.preOrder();
  // b.postOrder();


  
}