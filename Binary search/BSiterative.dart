
class binaryIteration{
  List<int> arr = [];
  int? target;

  binaryIteration(List<int> arr,int target){
    this.arr = arr;
    this.target = target;
  }
  
  int search(){
    int str = 0;
    int end = arr.length-1;

    while(str <= end){
      int mid = str + (end-str) ~/ 2;
      if(arr[mid]==target){
        return mid;
      }
      else if(target! < arr[mid]){
        end = mid - 1;
      }
      else if(target! > arr[mid]){
        str = mid+1;
      }
    }
    return -1;
  }
}

void main(){
  List<int> arr = [1,2,3,4,5];

  int target  = 3;

  binaryIteration list =  binaryIteration(arr, target);
  print(list.search());

}