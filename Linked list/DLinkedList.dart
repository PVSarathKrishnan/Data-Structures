class Node{
  int? data;
  Node? next;
  Node? prev;

  Node(int data){
    this.data = data;
  }
}

class DLinkedList{
  Node? head;
  Node? tail;

//to display list
void display(){
  Node? temp = head;
  while(temp != null){
    print(temp.data);
    temp=temp.next;
  }
}

//to add values
  void addValues(int data){
    Node newNode = Node(data);
    if(head == null){
      head = newNode;
    }
    else{
      tail?.next=newNode;
      newNode.prev = tail;
    }
    tail = newNode;
  }

//to add after
  void addAfter(int data,int target){
    Node newNode = Node(data);
    Node? temp = head;
    if(temp == null){
      return;
    }
    while(temp != null){
      if(temp.data == target){
        break;
      }
      temp = temp.next;
    }
    newNode.next = temp!.next;
    newNode.prev = temp;
    temp.next = newNode;
  }

//to add before
void addBefore(int data,int target){
  Node newNode = Node(data);
  Node? temp = head;
  if(head!.data == target){
    newNode.next = head;
    head!.prev = newNode;
    head = newNode;
    return;
  }
  while(temp != null){
    if(temp.data == target){
      break;
    }
    temp = temp.next;
  }
  newNode.next=temp;
  newNode.prev = temp?.prev;
  temp?.prev?.next=newNode;    
  temp?.prev = newNode;
}

//delete data
void delete(int data){
  Node? temp = head;
  if(temp != null){
    if(temp.data == data){
      head = temp.next;
      return;
    }
  }while(temp != null){
    if(temp.data == data){
      break;
    }
    temp = temp.next;
  }
temp!.prev!.next = temp.next;
}

//display in reverse
void revDisplay(){
  Node? temp = tail;
  while(temp != null){
    print(temp.data);
    temp = temp.prev;
  }
}

//to remove duplicates
void removeDuplicate(){
  Node? i = head;
  while(i != null){
    Node? j = i.next;
    while(j != null && j.data == i.data){
      j = j.next;
    }
    i.next = j;
    if(j == tail && i.data == j!.data){
      tail = i;
      tail!.next = null;
    }
    i = j;
  }
}



}

void main(){
  DLinkedList list = DLinkedList();

  list.addValues(10);
  list.addValues(20);
  list.addValues(30);
  list.addValues(40);
  list.addValues(50);
  list.addValues(40);

  //list.addAfter(2, 40);
  //list.addBefore(3, 10);

  //list.delete(3);

  //list.revDisplay();
  list.removeDuplicate();

  list.display();

}