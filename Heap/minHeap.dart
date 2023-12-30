class minHeap{

  List<int> heap =[];

  minHeap(List<int>arr){
    buildHeap(arr);
  }

  void buildHeap(List<int>arr){
    heap = arr;
    for(int i=parent(heap.length-1); i>=0; i--){
      shiftDown(i);
    }
  }

  void shiftDown(int currentIndex){
    int endIndex = heap.length-1; //last index of heap
    int leftIndex = leftChild(currentIndex);  //left child index of currNode
    
    while(leftIndex<=endIndex){ //continues until there is atleast one left child to consider
       int rightIndex = rightChild(currentIndex);
       int indexToShift;
    //determine which child node has smaller value
      if(rightIndex<=endIndex && heap[rightIndex]<heap[leftIndex]){
        indexToShift = rightIndex;
      }
      else{
        indexToShift = leftIndex;
      }

      if(heap[currentIndex] > heap[indexToShift]){ //if current value is greater
        swap(heap, currentIndex, indexToShift); 
        currentIndex = indexToShift;
        leftIndex = leftChild(currentIndex);
      }
      else{ //heap property is satisified
        return;
      }
    }
  }

  void shiftUp(int currentIndex){
    int parentIndex = parent(currentIndex);
    while(currentIndex > 0 && heap[parentIndex] > heap[currentIndex]){
      swap(heap, currentIndex, parentIndex);
      currentIndex = parentIndex;
      parentIndex = parent(currentIndex);
    }
  }

  int peek(){
    return heap[0];
  }

  void remove(){
    swap(heap, 0, heap.length-1);
    heap.removeLast();
    shiftDown(0);
  }

  void insert(int value){
    heap.add(value);
    shiftUp(heap.length-1);
  }

  void swap(List<int>a,int i , int j){
    int temp = a[i];
    a[i] = a[j];
    a[j] = temp;
  }

int parent(int i)=> (i-1)~/2;
int leftChild(int i)=> 2*i+1;
int rightChild(int i) => 2*i+2;


  void display(){
   print(heap);
  }

}

void main(){
  List<int> arr =[9,7,8,2];

  minHeap m = minHeap(arr); 
  m.insert(10);
  m.insert(20);
  m.insert(30);
  
  // print(m.peek());
  m.remove();
  // m.display();

  List<int> sorted = heapSort(m);
  print(sorted);
}

List<int> heapSort(minHeap m){
  List<int> sorted = [];
  while(m.heap.isNotEmpty){
    int min = m.peek();
    sorted.add(min);
    m.remove();
  }
  return sorted;
}