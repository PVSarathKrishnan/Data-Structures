class binaryI{
  List<int> arr=[];
  int? target;
  binaryI(List<int> arr,int target){
    this.arr=arr;
    this.target=target;
  }

  int search(){
    int start=0;
    int end=arr.length-1;

    while(start<=end){
      int mid = (start+end)~/2;
      if(arr[mid]==target){
        return mid;
      }
      else if(target! < arr[mid]){
        end = mid-1;
      }
      else if(target! > arr[mid]){
        start = mid+1;
      }
    }
    return -1;
  }
}
void main(){
  List<int> arr=[1,2,3,4];
  int target =2;
  binaryI bin = binaryI(arr, target);
  print(bin.search());
}