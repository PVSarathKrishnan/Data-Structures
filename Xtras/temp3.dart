class minHeap{
  List<int> heap = [];

  minHeap(List<int>arr){
    buildHeap(arr);
  }

  void buildHeap(List<int>arr){
    heap=arr;
    for(int i=parent(heap.length-1);i>=0;i-- ){
      shiftDown(i);
    }
  }

  void shiftDown(int currentIndex){
    int leftIndex = leftChild(currentIndex);
    int endIndex = heap.length-1;
    while(leftIndex<=endIndex){
      int rightIndex = rightChild(currentIndex);
      int indexToShift;
      if(rightIndex<=endIndex && heap[rightIndex]<heap[leftIndex]){
        indexToShift = rightIndex;
      }
      else{
        indexToShift = leftIndex;
      }
      if(heap[currentIndex]>heap[indexToShift]){
        swap(heap, currentIndex, indexToShift);
        currentIndex=indexToShift;
        leftIndex = leftChild(currentIndex);
      }
      else{
        return;
      }
    }
  }

  void shiftUp(int currentIndex){
    int parentIndex = parent(currentIndex);
    while(currentIndex>0 && heap[parentIndex]>heap[currentIndex]){
      swap(heap, currentIndex, parentIndex);
      currentIndex = parentIndex;
      parentIndex = parent(currentIndex);
    }
  }

  void insert(int data){
    heap.add(data);
    shiftUp(heap.length-1);
  }
  
  void remove(){
    swap(heap, 0, heap.length-1);
    heap.removeLast();
    shiftDown(0);
  }

  int peek(){
    return heap[0];
  }

  void swap(List<int>a,int i ,int j){
    int temp = a[i];
    a[i] = a[j];
    a[j] = temp;
  }

  int parent(int i)=>(i-1)~/2;
  int leftChild(int i)=> (2*i)+1;
  int rightChild(int i)=>(2*i)+2;

  void display(){
    print(heap);
  }
}

void main(){
  List<int> arr = [2,4,11,9];
  minHeap m = minHeap(arr);

  m.insert(10);
  m.insert(1);
  print("peek : ${m.peek()}");
  m.remove();
  m.display();
}