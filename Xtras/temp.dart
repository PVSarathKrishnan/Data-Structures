
class Node{
  int?data;
  Node? next;
  Node(int data){
    this.data = data;
  }
}

class Sll{
  Node? head;
  Node? tail;

  void add(int data){
    Node newNode = Node(data);
    if(head == null){
      head = newNode;
    }
    tail?.next = newNode;
    tail = newNode;
  }

  void display(){
    Node? temp = head;
    if(head == null){
      Node? temp = head;      print('empty');return;
    }
    while(temp!=null){
      print(temp.data);
      temp = temp.next;
    }
  }

  void addH(int data){
    Node newNode = Node(data);
    newNode.next=head;
    head=newNode;
  }

  void addT(int data){
    Node newNode = Node(data);
    tail?.next=newNode;
    tail = newNode;
  }

  void addB(int data,int target){
    Node newNode = Node(data);
    Node? temp = head;
    Node? prev;
    if(temp!.data == target){
      newNode.next = head;
      head = newNode;
    }
    while(temp!=null){
      if(temp.data == target){
        break;
      }
      prev = temp;
      temp =temp.next;
    }
    prev?.next = newNode;
    newNode.next = temp;
  }

  void addAfter(int data,int target){
    Node newnode = Node(data);
    Node? temp = head;
    while(temp != null){
      if(temp.data == target){
        break;
      }
      temp = temp.next;
    }
    if(temp == tail){
      tail!.next=newnode;
      tail = newnode;
      return;
    }
    newnode.next = temp!.next;
    temp.next = newnode;
  }

  void delete(int data){
    Node? temp = head;
    Node? prev;
    if(temp!=null && temp.data == data){
      head=temp.next;
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

  void deleteH(){
    head = head!.next;
  }

  void deleteT(){
    Node? temp = head;
    Node? prev;
    while(temp !=null){
      if(temp.data == tail!.data){
        break;
      }
      prev= temp;
      temp = temp.next;
    }
    prev!.next = null;
    tail = prev;
  }

  void sort(){
    List<int> list =[];
    Node? temp = head;
    while(temp!=null){
      list.add(temp.data!);
      temp = temp.next;
    }
    list.sort();
    head=null;
    for(int i=0;i<list.length;i++){
      add(list[i]);
    }
  }

  void search(int data){
    Node?temp = head;
    int i=0;
    while(temp!=null){
      if(temp.data == data){
            print("position ${i+1}");
      }
      i++;
      temp = temp.next;
    }
  }

  void reverse(){
    Node? currNode=head;
    Node? nextNode=head;
    Node?prev;
    while(currNode!=null){
      nextNode =currNode.next;
      currNode.next = prev;
      prev = currNode;
      currNode = nextNode;
    }
    head= prev;
  }

  void duplicates(){
    Node? temp = head;
    while(temp!=null){
      Node? ref=temp;
      while(ref!.next != null){
        if(temp.data == ref.next!.data){
          ref.next = ref.next!.next;
        }
        else{
          ref=ref.next;
          }
      }
      temp=temp.next;
    }
  }

}

void main(){
Sll l = Sll();

l.add(80);
l.add(10);
l.add(20);
l.add(30);
l.add(10);
l.add(20);
l.add(30);

// l.addH(1);
// l.addT(40);

// l.addB(35, 40);
// l.addAfter(45, 40);

// l.delete(40);

// l.deleteH();
// l.deleteT();

l.sort();

//l.search(20);

l.reverse();
l.duplicates();

l.display();
}