class Node{
  int? data;
  Node? next;
  Node? prev;

  Node(int data){
    this.data = data;
  }
}

class Dll{
  Node? head;
  Node? tail;

  void add(int data){
    Node newNode = Node(data);
    if(head == null){
      head = newNode;
    }
    else{
      tail?.next=newNode;
      newNode.prev = tail;
    }
tail=newNode;
  }

  void display(){
    Node? temp = head;
    if(head==null){
      print('empty');
    }
    else{
      while(temp!=null){
        print(temp.data);
        temp = temp.next;
      }
    }
  }

  void delete(int data){
    Node? temp = head;
    if(temp!=null && temp.data == data){
      head=temp.next;
      return;
    }
    else{
      while(temp != null){
        if(temp.data == data){
          break;
        }
        temp = temp.next;
      }
      temp!.prev!.next = temp.next;
    }
  }

  void addAfter(int data,int target){
    Node newNode = Node(data);
    Node? temp = head;
    while(temp!=null){
      if(temp.data == target){
        break;
      }
      temp=temp.next;
    }
    newNode.next = temp!.next;
    newNode.prev=temp;
    temp.next=newNode;
  }

  void addBefore(int data,int target){
    Node? newNode = Node(data);
    Node? temp = head;
    if(head!.data == target){
      newNode.next = head;
      head!.prev=newNode;
      head = newNode;
      return;
    }
   while(temp!.data != null){
    if(temp.data == target){
      break;
    }
    temp =temp.next;
   }
   newNode.next = temp;
   newNode.prev = temp.prev;
   temp.prev!.next=newNode;
   temp.prev = newNode;
  }

  void reverse(){
    Node? temp = tail;
    while(temp!=null){
      print(temp.data);
      temp = temp.next;
      
    }
  }

}

void main(){

  Dll l=Dll();

  l.add(10);
  l.add(20);

  l.delete(20);

  l.addAfter(30, 10);
  l.addBefore(20, 30);

  l.display();

}