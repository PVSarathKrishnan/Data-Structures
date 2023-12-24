import 'dart:io';

class Node {
  int data;
  Node? left, right;
  Node({required this.data});
}

class BinaryTree {
  Node? root;

  void insert(int data) {
    Node newNode = Node(data: data);

    Node? currentNode = root;
    if (currentNode == null) {
      root = newNode;
      return;
    }
    while (true) {
      if (data < currentNode!.data) {
        if (currentNode.left == null) {
          currentNode.left = newNode;
          break;
        }
        currentNode = currentNode.left;
      } else {
        if (currentNode.right == null) {
          currentNode.right = newNode;
          break;
        }
        currentNode = currentNode.right;
      }
    }
  }

  bool contains(int data) {
    Node? currentNode = root;

    while (currentNode != null) {
      if (data < currentNode.data) {
        currentNode = currentNode.left;
      } else if (data > currentNode.data) {
        currentNode = currentNode.right;
      } else {
        return true;
      }
    }
    return false;
  }

  void inOrder() {
    inOrderHelper(root!);
  }

  inOrderHelper(Node? node) {
    if (node != null) {
      inOrderHelper(node.left);
      //print(node.data);
      stdout.write("${node.data} ");
      inOrderHelper(node.right);
    }
  }

  void preOrder() {
    preOrderHelper(root);
  }

  void preOrderHelper(Node? node) {
    if (node != null) {
      stdout.write("${node.data} ");
      preOrderHelper(node.left);
      preOrderHelper(node.right);
    }
  }

  void postOrder() {
    postOrderHelper(root);
  }

  void postOrderHelper(Node? node) {
    if (node != null) {
      postOrderHelper(node.left);
      postOrderHelper(node.right);
      stdout.write("${node.data} ");
    }
  }

  int findClose(int target) {
    Node? current = root;
    int closest = current!.data;

    while (current != null) {
      if ((target - closest).abs() < (target - current.data).abs()) {
        closest = current.data;
      }

      if (target < current.data) {
        current = current.left;
      } else if (target > current.data) {
        current = current.right;
      } else {
        break;
      }
    }
    return closest;
  }

  void delete(int data) {
    deleteHelper(data, root, null);
  }

  void deleteHelper(int data, Node? cuNode, Node? parent) {
    while (cuNode != null) {
      if (data < cuNode.data) {
        parent = cuNode;
        cuNode = cuNode.left;
      } else if (data > cuNode.data) {
        parent = cuNode;
        cuNode = cuNode.right;
      } else {
        if (cuNode.left != null && cuNode.right != null) {
          cuNode.data = getMin(cuNode.right);
          deleteHelper(cuNode.data, cuNode.right, cuNode);
        } else {
          Node? child = (cuNode.left != null) ? cuNode.left : cuNode.right;
          if (parent == null) {
            root = child;
          } else {
            if (parent.left == cuNode) {
              parent.left = child;
            } else {
              parent.right = child;
            }
          }
        }
        break;
      }
    }
  }

  int getMin(Node? node) {
    if (node!.left == null) {
      return node.data;
    } else {
      return getMin(node.left);
    }
  }
}

void main() {
  BinaryTree tree = BinaryTree();

  tree.insert(11);
  tree.insert(6);
  tree.insert(19);
  tree.insert(4);
  tree.insert(67);
  tree.insert(43);
  tree.insert(43);
  tree.insert(8);
  tree.insert(1);
  tree.insert(10);
  tree.insert(43);
  tree.insert(31);
  tree.insert(49);
  //print(tree.contains(34));
  // tree.inOrder()
  // stdout.write(" \n");
  // tree.preOrder();
  // stdout.write(" \n");   
  // // tree.postOrder();
  // tree.delete();
  tree.inOrder();
}