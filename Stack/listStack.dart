//stack using linked list 

class Node{
  int? data;
  Node? next;

  Node(int data){
    this.data = data;
  }
}

class stackL{
  Node? top;

  void push(int data){
    Node newNode = Node(data);
    if(top == null){
      top = newNode;
    }
    else{
      newNode.next = top;
      top = newNode;
    }
  }

  void pop(){
    if(top == null){
      print('stack underflow');
    }
    else{
      top = top?.next;
    }
  }

  void display(){
    Node? temp = top;
    if(top == null){
      print('empty');
    }
    else{
      while(temp != null){
        print(temp.data);
        temp = temp.next;
      }
    }
  }

  void getSize(){
    Node? temp = top;
    int i =0;
    if(temp == null){
      print('empty');
    }
    else{
      while(temp != null){
        i++;
        temp = temp.next;
      }
    }
    print('size: ${i}');
  }

  void delete(int target){
    Node? temp = top;
    Node? prev;
    if(temp == null){
      print('empty');
    }
    else{
      while(temp != null){
        if(temp.data == target){
          break;
        }
        prev = temp;
        temp = temp.next;
      }
      prev?.next = temp?.next;
    }
  }

  void peek(){
    final top = this.top;
    if(top != null){
      print("Peek : ${top.data}");
    }
  }
}

void main(){
  stackL s = stackL();

  s.push(10);
  s.push(20);
  s.push(30);
  s.push(40);
  s.push(50);

  //s.pop();
  
  //s.delete(20);

  //s.getSize();

  s.peek();

  s.display();

}