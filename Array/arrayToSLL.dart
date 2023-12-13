class Node{
  int? data;
  Node? next;
  
  Node(int data){
    this.data = data;
  }
}

class arrayToSLList{
  Node? head;
  Node? tail;

//to add nodes
void add(int data){
  Node? newNode = Node(data);
  if(head == null){
    head = newNode;
  }
  else{
    tail!.next = newNode;
  }
  tail = newNode;
}

//conversion part
void convert(List arr){
  for(int i=0;i<arr.length;i++){
    add(arr[i]);
  }
}

void display(){
  Node? temp = head;
  if(head == null){
    print('empty');
  }
  else{
  while(temp!=null){
    print(temp.data);
    temp = temp.next;
  }
  }
}
}

void main(){
  arrayToSLList list = arrayToSLList();
  List<int> arr = [1,2,3,4,5,6];

  list.convert(arr);
  list.display();
  
}