class Node{
  int? data;
  Node? next;
  Node(int data){
    this.data=data;
  }
}

class single{
  Node? head;
  Node? tail;

  void display(){
    Node? temp = head;
    head??print("empty list");
    while(temp!=null){
      print(temp.data);
      temp = temp.next;
    }
  }

  void addValue(int data){
    Node newNode = Node(data);
    head??= newNode;
    tail?.next = newNode;
    tail = newNode;
  }

  void addBeg(int data){
    Node  newNode = Node(data);
    newNode.next=head;
    head=newNode;
  }

  void addEnd(int data){
    Node newNode = Node(data);
    tail?.next=newNode;
    tail=newNode;
  }

  void addBefore(int target,int data){
    Node newNode = Node(data);
    Node? prev;
    Node? temp = head;
    if(temp?.data==target){
      newNode.next=head;
      head=newNode;
    }
    while(temp!=null){
      if(temp.data == target){
        break;
      }
      prev=temp;
      temp=temp.next;
    }
    prev?.next=newNode;
    newNode.next=temp;
  }

  void addAfter(int target,int data){
    Node newNode =Node(data);
    Node? temp = head;
    while(temp!=null){
      if(temp.data==target){
        break;
      }
      temp = temp.next;
    }
    newNode.next=temp?.next;
    temp?.next = newNode;
  }
}