class minHeap{

  List<int>heap=[];
  minHeap(List<int>arr){
    buildHeap(arr);
  }

  void buildHeap(List<int>arr){
    heap = arr;
    for(int i= parent(heap.length-1);i>=0;i--){
      shiftDown(i);
    }
  }

  void shiftDown(int currentrIndex){
    int leftIndex=leftChild(currentrIndex);
    int endIndex=heap.length-1;
    while(leftIndex<=endIndex){
      int rightIndex = rightChild(currentrIndex);
      int indextoShift;
      if(rightIndex<=endIndex && heap[rightIndex]<heap[leftIndex]){
        indextoShift = rightIndex;
      }
      else{
        indextoShift = leftIndex;
      }if(heap[currentrIndex]>heap[indextoShift]){
          swap(heap, currentrIndex, indextoShift);
          currentrIndex = indextoShift;
          leftIndex = leftChild(currentrIndex);
      }
      else{
        return;
      }
    }
  }

  void shiftUp(int currentIndex){
    int parentIndex = parent(currentIndex);
    while(currentIndex>0 && heap[parentIndex]>heap[currentIndex]){
      swap(heap, parentIndex, currentIndex);
      currentIndex=parentIndex;
      parentIndex = parent(currentIndex);
    }
  }

  void swap(List<int>a,int i,int j){
    int temp = a[i];
    a[i] = a[j];
    a[j] = temp;
  }


int parent(int i)=>(i-1)~/2;
int leftChild(int i)=>2*i+1;
int rightChild(int i)=>2*i+2;
}

void main(){

}