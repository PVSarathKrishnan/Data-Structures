
class Node{
  int? data;
  Node? next;

  Node(int data){
    this.data=data;
  }
}

class SLinkedList{
  Node? head;
  Node? tail;

//to display 
  void display(){
    Node? temp = head;
    head??print('empty list');
    while(temp != null){
      print(temp.data);
      temp = temp.next;
    }
  }

//to add a value  
  void addValue(int data){
    Node newNode = Node(data); 
    head ??= newNode; 
    tail?.next = newNode;
    tail=newNode; 
  }

//add at beginning
  void addBeg(int data){
    Node newNode = Node(data);
    newNode.next = head;
    head = newNode;
  }

//add at end
  void addEnd(int data){
    Node newNode = Node(data);
    tail!.next = newNode;
    tail = newNode;
  }

//insert before specific
  void addBefore(int target,int data){
    Node newNode = Node(data);
    Node? prev;
    Node? temp = head;
    if(temp!.data == target){
      newNode.next = head;
      head = newNode;
    }
    while(temp!=null){
      if(temp.data == target){
        break;
      }
      prev = temp;
      temp = temp.next;
    }
    prev?.next = newNode;  //newNode is placed between prev and temp
    newNode.next = temp;
  }

//insert after specific
  void addAfter(int target,int data){
    Node newNode=Node(data);
    Node? temp = head;
    while(temp!=null){
      if(temp.data == target){
        break;
      }
      temp = temp.next;
    }
    if(temp==null){  //not found
      return;
    }
    if(temp == tail){
      tail!.next = newNode;
      tail = newNode;
      return;
    }
    newNode.next = temp.next;
    temp.next = newNode;
  }

//delete a node
  void deleteNode(int data){
    Node? temp = head;
    Node? prev;

    if(temp!=null && temp.data==data){ //check if head is to be deleted...
      head = temp.next;
      return;
    }
    while(temp != null){
      if(temp.data == data){
        break;
      }
      prev = temp;
      temp = temp.next;
    }
    prev!.next = temp!.next;
  }

//deletion at beginning
  void deleteBeg(){
    head = head!.next;
  }

//deletion at end
  void deleteEnd(){
    head??print('empty list');
    Node? temp =  head;
    Node? prev;
  while (temp!=null){
    if (temp.data == tail!.data){
      break;
    }
    prev=temp;
    temp=temp.next;
  }
  prev!.next=null; //prev is 2nd last
  tail = prev;   //prev is set as tail
  }

//to search an element
void search(int target){
  Node? temp = head;
  int i = 0;
  head??print('empty list');
  while(temp != null){
    if(temp.data == target){
      print('item found in ${i+1}');
    }
    i++;
    temp = temp.next;
  }
}

//display reversed
void displayReverse(){
  Node? currNode = head;
  Node? nextNode = head;
  Node? prev;
  while(currNode != null){
    nextNode = currNode.next;
    currNode.next = prev;
    prev = currNode;
    currNode = nextNode;
  }
  head=prev;
} 

//remove duplicate
void removeDuplicate(){
  Node? temp = head;
  while(temp != null){
    Node? ref = temp;
    while(ref!.next != null){
      if(temp.data == ref.next!.data){
        ref.next = ref.next!.next;
      }
      else{
        ref = ref.next;
      }
    }
    temp = temp.next; 
  }
}

//sort
void sort(){
  List<int> lists = [];
  Node? temp = head;
  while(temp != null){
    lists.add(temp.data!);
    temp = temp.next;
  }
  lists.sort();
  head = null;
  for(int i=0;i<lists.length;i++){
    addValue(lists[i]);
  }
}




}

void main(){
  SLinkedList list=SLinkedList();

  list.addValue(10);
  list.addValue(20);
  list.addValue(30);
  list.addValue(40);
  list.addValue(30);
  list.addValue(40);
  list.addValue(30);
  list.addValue(40);
  list.addValue(40);


  // list.addBeg(1);
  // list.addEnd(100);
  // list.addBefore(20,2);
  // list.addAfter(20,3);

  // list.deleteNode(50);
  // list.deleteBeg();
  // list.deleteEnd();

  //list.search(2);
  //list.displayReverse();
  list.removeDuplicate();
  //list.sort();
  list.display();

}