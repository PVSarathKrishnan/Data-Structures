class Node {
  int? data;
  Node? next;

  Node(int data) {
    this.data = data;
  }
}

class SLinkedLIst {
  Node? head;
  Node? tail;

  void addValues(int data) {
    Node newNode = Node(data);

    if (head == null) {
      head = newNode;
    } else {
      tail!.next = newNode;
    }
    tail = newNode;
  }

  void addBeg(int data) {
    Node newNode = Node(data);

    newNode.next = head;
    head = newNode;
  }

  void addEnd(int data) {
    Node newNode = Node(data);

    tail!.next = newNode;
    tail = newNode;
  }
  //1,2,3,4,5

  void deleteBeg() {
    head = head!.next;
  }

  void deleteEnd() {
    Node? temp = head;
    Node? prev;

    while (temp != null) {
      if (temp.data == tail!.data) {
        break;
      }
      prev = temp;
      temp = temp.next;
    }

    prev!.next = null;
    tail = prev;
  }

  //delete specific value;
  void deleteValue(int target) {
    Node? temp = head;
    Node? prev;
    if (head!.data == target) {
      head = head!.next;
    }

    while (temp != null) {
      if (temp.data == target) {
        break;
      }
      prev = temp;
      temp = temp.next;
    }
    if (temp == tail && tail!.data == target) {
      prev!.next = null;
      prev = tail;
    }

    prev!.next = temp!.next;
  }

  void display() {
    Node? temp = head;

    if (head == null) {
      print("empty");
    }

    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  void search(int target) {
    Node? temp = head;
    int i = 0;

    if (head == null) {
      print("empty List");
    }

    while (temp != null) {
      if (temp.data == target) {
        print("item found in ${i + 1}");
      }
      i++;
      temp = temp.next;
    }
  }

//1,2,3,4,
  void displayRev() {
    Node? curNode = head;
    Node? NextNode = head;
    Node? prev;
    while (curNode != null) {
      NextNode = NextNode!.next;
      curNode.next = prev;
      prev = curNode;
      curNode = NextNode;
    }
    head = prev;
  }

  //1,2,3,3,3,4,5,5;
  void removeDup() {
    Node? temp = head;

    while (temp != null) {
      Node? ref = temp;
      while (ref!.next !=null) {
     if(temp.data ==ref.next!.data){
           ref.next = ref.next!.next;
     }else{
      ref = ref.next;

     }
    
      }

      temp = temp.next;
 
    }
  }

  void sortNode() {
    List<int> listss = [];
    Node? temp = head;
    while (temp != null) {
      listss.add(temp.data!);
      temp = temp.next;
    }
    listss.sort();
    head = null;
    for (int i = 0; i < listss.length; i++) {
      addValues(listss[i]);
    }
  }
}

void main() {
  SLinkedLIst list = SLinkedLIst();
  list.addValues(30);
  list.addValues(40);
  list.addValues(40);
  list.addValues(40);
  list.addValues(10);
  list.addValues(20);
  list.addValues(50);
//list.deleteBeg();
  //list.deleteEnd();
//list.deleteValue(50);
  //list.addBeg(500);
// list.deleteValue(10);

// list.display();
// print("----------------");
//   list.displayRev();

//list.sortNode();
//list.display();
  list.removeDup();
//list.addEnd(700);
 list.display();
  // int target = 10;
   //list.search(target);
}