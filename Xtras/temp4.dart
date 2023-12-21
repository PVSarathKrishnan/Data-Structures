import '../Sort/merge.dart';

class quicksort{
  
  List<int> quick(List<int>arr){
    sort(arr, 0, arr.length-1);
    return arr;
  }

  void sort(List<int>arr,int str,int end){
    if(str>=end){
      return;
    }
    int pivot = str;
    int left = str+1;
    int right = end;

    while(str<=end){
      if(arr[left]>arr[pivot] && arr[right]<arr[pivot]){
        swap(arr, left, right);
        left++;
        right--;
      }
      if(arr[left]<arr[pivot]){
        left++;
      }
      if(arr[right]>arr[pivot]){
        right--;
      }
    }
    swap(arr, right, pivot);
    sort(arr, str, right-1);
    sort(arr, right+1, end);
  }

  void swap(List<int>arr,int i,int j){
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j]=temp;
  }
}

void main(){
  List<int>arr=[2,1,5,2,3,2,2];
  mergeSort m = mergeSort();
  print(m.merge(arr));
}