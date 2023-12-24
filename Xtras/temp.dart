class MinHeap {
  List<int> heap = [];

  MinHeap(List<int> arr) {
    buildHeap(arr);
  }

  void buildHeap(List<int> arr) {
    heap = arr;
    for (int i = parent(heap.length - 1); i >= 0; i--) {
      shiftDown(i);
    }
  }

  void shiftDown(int cuIdx) {
    int endIdx = heap.length - 1;
    int leftIdx = leftChild(cuIdx);

    while (leftIdx <= endIdx) { 
      int rightIdx = rightChild(cuIdx);
      int idxToShift;

      if (rightIdx <= endIdx && heap[rightIdx] < heap[leftIdx]) { 
        idxToShift = rightIdx;
      } else {
        idxToShift = leftIdx;
      }

      if (heap[cuIdx] > heap[idxToShift]) {
        swap(heap, cuIdx, idxToShift);
        cuIdx = idxToShift;
        leftIdx = leftChild(cuIdx);
      } else {
        return;
      }
    }
  }

  void shiftUp(int cuIndex) {
    int parentIdx = parent(cuIndex);
    while (cuIndex > 0 && heap[parentIdx] > heap[cuIndex]) {
      swap(heap, cuIndex, parentIdx);
      cuIndex = parentIdx;
      parentIdx = parent(cuIndex);
    }
  }

  int peek() {
    return heap[0];
  }

  void remove() {
    swap(heap, 0, heap.length - 1);
    heap.remove(heap.length - 1);
    shiftDown(0);
  }

  void insert(int value) {
    heap.add(value);
    shiftUp(heap.length - 1);
  }

  int parent(int i) {
    return (i - 1) ~/ 2;
  }

  int leftChild(int i) {
    return 2 * i + 1;
  }

  int rightChild(int i) {
    return 2 * i + 2;
  }

  void display() {
    for (int i = 0; i < heap.length; i++) {
      print(heap[i]);
    }
  }

  void swap(List<int> arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}

void main() {
  List<int> arr = [9, 7, 8, 2];
  MinHeap mheap = MinHeap(arr);

  mheap.insert(10);
  mheap.insert(20);
  mheap.insert(30);

  // mheap.remove();

  mheap.display();
}
