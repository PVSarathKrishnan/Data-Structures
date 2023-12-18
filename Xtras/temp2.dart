
class Node{
  int? data;
  Node? next;
  Node? prev;

  Node(int data){
    this.data = data;
  }
}

class dLL{
  Node? head;
  Node? tail;

  void addNode(int data){
    Node newNode = Node(data);
    if(head==null){
      head = newNode;
    }
    else{
      tail?.next = newNode;
      newNode.prev = tail;
    }
    tail = newNode;
  }

  void display(){
    Node? temp = head;
    while(temp!=null){
      print(temp.data);
      temp = temp.next;
    }
  }

  void addAfter(int data,int target){
    Node? newNode = Node(data);
    Node? temp = head;
    while(temp!=null){
      if(temp.data == target){
        break;
      }
      temp = temp.next;
    }
    newNode.next = temp?.next;
    temp?.next=newNode;
    newNode.prev=temp;
  }

  void addBefore(int data,int target){
    Node? newNode = Node(data);
    Node? temp = head;
    while(temp!=null){
      if(temp.data == target){
        break;
      }
      temp = temp.next;
    }
    newNode.next = temp;
    newNode.prev = temp?.prev;
    temp!.prev?.next = newNode;
    temp.prev = newNode;
  }

  void delete(int target){
    Node? temp = head;
    while(temp != null){
      if(temp.data == target ){
        break;
      }
      temp = temp.next;
    }
    temp!.prev?.next = temp.next;
  }

  void reverse(){
    Node?  temp = tail;
    while(temp!=null){
      print(temp.data);
      temp=temp.prev;
    }
  }

  void duplicate(){
    Node? i = head;
    while(i != null){
      Node? j = i.next;
      while(j !=null && j.data == i.data){
        j = j.next;
      }
      i.next =j;
      if(j== tail && j?.data == i.data){
        tail = i;
        tail?.next = null;
      }
      i = j;
    }
    
  }

}

void main(){
  dLL d =dLL();

  d.addNode(10);
  d.addNode(20);
  d.addNode(20);
  d.addNode(30);
  // d.addAfter(15, 10);
  // d.addAfter(17, 15);

  // d.addBefore(25, 30);
  // d.addBefore(22, 25);

  // d.reverse();
  d.duplicate();

  d.display();
}