class Node{
  int? data;
  Node? next;
  Node? prev;

  Node(int data){
    this.data =data;
  }
}

class Dtest{
  Node? head;
  Node? tail;

  void display(){
    Node? temp=head;
    while(temp != null){
      print(temp.data);
      temp = temp.next;
    }
  }

  void add(int data){
    Node newNode = Node(data);
    if(head == null){
      head = newNode;
    }
    else{
      tail?.next = newNode;
      newNode.prev = tail;
    }
    tail = newNode;
  }

  void addAfter(int data,int target){
    Node? newNode =Node(data);
    Node? temp = head;
    if(temp == null){
      return;
    }
    while(temp != null){
      if(temp.data == target){
        break;
      }
      temp=temp.next;
    }
    newNode.next = temp!.next;
    temp.next = newNode;
    newNode.prev = temp;
  }

  void addBefore(int data, int target){
    Node? newNode = Node(data);
    Node? temp = head;
    if(head!.data == target){
      newNode.next =head;
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
    temp!.prev!.next = newNode;
    newNode.prev = temp.prev;
    temp.prev = newNode;
  }

  void delete(int data){
    Node? temp = head;
    if(temp != null){
      if(temp.data == data){
        head = temp.next;
        return;
      }
    }
    while(temp != null){
      if(temp.data ==data){
        break;
      }
      temp = temp.next;
    }
    temp!.prev!.next = temp.next; 
  }

  void reverse(){
    Node? temp = tail;
    while(temp!=null){
      print(temp.data);
      temp = temp.prev;
    }
  }




}

void main(){
  Dtest test = Dtest();

  test.add(10);
  test.add(20);
  test.add(30);

  test.addAfter(40, 30);
  test.addBefore(35,40);

  test.delete(35);
  //test.reverse();

  test.display();
}