//stack using array

class stack{
  List<int> arr = [];

  bool isEmpty(){
    return arr.isEmpty;
  }

  void size(){
    print("size : ${arr.length}");
  }

  void push(int data){
    arr.add(data);
  }

  void pop(){
    if(arr.isEmpty){
      print("empty");
    }
    else{
      arr.removeLast();
    }
  }

  void peek(){
    if(arr.isEmpty){
      print("empty stack");
    }
    else{
      print("peek : ${arr.last}");
    }
  }

  void display(){
    print("stack : ${arr}");
  }
}

void main(){
  stack s = stack();

print(s.isEmpty());

  s.push(10);
  s.push(20);
  s.push(30);

  s.pop();

  s.size();

  s.peek();

print(s.isEmpty()); 

  s.display();
}