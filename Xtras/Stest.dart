

class Node{
  int? data;
  Node? next;

  Node(int data){
    this.data = data;
  }
}

class Stest{
  Node? head;
  Node? tail;

  void add(int data){
    Node newNode = Node(data);

    if(head == null){
      head = newNode;
    }
    else{
      tail!.next = newNode;
    }
    tail = newNode ;
  }

  void display(){
    Node? temp =head;
    if(head == null){
      print('empty');
    }
    else{
      while(temp != null)
      {
        print(temp.data);
        temp = temp.next;
      }
    }
  }

  void addHead(int data){
    Node newNode = Node(data);
    newNode.next = head;
    head = newNode;
  }

  void addTail(int data){
    Node newNode = Node(data);

    tail!.next = newNode;
    tail = newNode;
  }

  void after(int data,int target){
    Node newNode = Node(data);
    Node? temp = head;

    while(temp!=null){
      if(temp.data == target){
        break;
      }
      temp = temp.next;
    }
    if(temp == null){
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

  void before(int data,int target){
    Node newNode =Node(data);
    Node? temp = head;
    Node? prev;

    if(head == target){
      newNode.next = head;
      head = newNode;
      return;
    }
    while(temp !=null){
      if(temp.data == target){
        break;
      }
      prev =temp;
      temp = temp.next;
    }
    prev?.next=newNode;
    newNode.next = temp;
  }

  void delete(int data){
    Node? temp = head;
    Node? prev;
    if(temp!.data == data){
      head = temp.next;
      return;
    }
    while(temp != null){
      if(temp.data ==  data){
        break;
      }
      prev = temp;
      temp = temp.next;
    }
    prev!.next = temp!.next;
  }

  void delteStart(){
    head = head!.next;
  }

  void deleteEnd(){
    Node? temp = head;
    Node? prev;
    while(temp!=null){
      if(temp.data == tail!.data){
        break;
      }
      prev=temp;
      temp=temp.next;
    }
    prev!.next = null;
    tail = prev;
  }

  void search(int target){
    Node? temp =  head;
    int i=0;
    while(temp != null){
      if(temp.data == target){
        print(i+1);
      }
      temp=temp.next;
      i++;
    }
  }

  void sort(){
    List<int> list=[];
    Node? temp =head ;
    while(temp!=null){
        list.add(temp.data!);
        temp=temp.next;
    }
    list.sort();
    head =null;
    for(int i=0;i<list.length;i++){
      add(list[i]);
    }
  }

}

void main(){
  Stest test = Stest();

  test.add(10);
  test.add(20);
  test.add(30);
  
  // test.addHead(1);
  // test.addTail(5);
  // test.after(22, 20);
  // test.before(11, 1);

  // test.delete(5);
  // test.delteStart();
  //test.deleteEnd();
  //test.search(10);
  test.sort();
  test.display();
}