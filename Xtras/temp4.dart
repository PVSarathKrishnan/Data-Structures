
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
    if(currNode==null){
      root = newNode;
    }
    while(true){
      if(data<currNode!.data){
        if(currNode.left==null){
          currNode.left=newNode;
          break;
        }
        currNode = currNode.left;
      }
      else{
        if(currNode.right==null){
          currNode.right= newNode;
          break;
        }
        currNode = currNode.right;
      }
    }
  }

  bool contains(int target){
    Node? currNode=root;
    while(currNode!=null){
    if(target<currNode.data){
      currNode=currNode.left;
    }
    else if(target>currNode.data){
      currNode = currNode.right;
    }
    else{
      return true;
    }
    }
    return false;
  }

  int getClose(int target){
    Node? currNode = root;
    int closest = currNode!.data;

    while(currNode!=null){

      if((target-closest).abs() > (target-currNode.data).abs()){
      closest = currNode.data;
    }
    if(target<currNode.data){
      currNode= currNode.left;
    }
    else if(target > currNode.data){
      currNode = currNode.right;
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
  void deleteHelper(int data,Node? currentNode,Node? parent){
    while(currentNode != null){
      if(data<currentNode.data){
        currentNode = currentNode.left;
      }
      else if(data > currentNode.data){
        currentNode = currentNode.right;
      }
      else{
        if(currentNode.left!=null && currentNode.right!=null){
          getMin(currentNode.right);
          deleteHelper(data, currentNode.right, currentNode);
        }
        else{
          Node? child = (currentNode.left!=null)? currentNode.left:currentNode.right;
          if(parent==null){
            root = child;
          }
          else{
            if(parent.left == currentNode){
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

  int? getMin(Node? currNode){
    if(currNode?.left ==  null){
      return currNode?.data;
    }
    else{
      return getMin(currNode?.left);
    }
  }
  
}

void main(){

}