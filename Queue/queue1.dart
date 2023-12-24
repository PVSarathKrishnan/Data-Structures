 class Node{
  int? data;
  Node? next;

  Node(int data){
    this.data = data;
  }
}

class queue{
  Node? front;
  Node? rear;

  void enqueue(int data){
    Node? newNode = Node(data);
    if(front==null){
      front = rear = newNode;
      return;
    }
    else{
      rear?.next = newNode;
      rear = newNode;
    }
  }

  void dequeue(){
    if(front == null){
      print('empty queue');
    }
    front = front?.next;
    if(front == null){
      rear = null;
    }
  }

  void display(){
    Node? temp = front;
    if(front == null){
      print('empty list');
    }
    while(temp!=null){
      print(temp.data);
      temp = temp.next;
    }
  }
}

void main(){
  queue q = queue();

  q.enqueue(10);
  q.enqueue(20);
  q.enqueue(30);

  q.dequeue();
  
  q.display();
}