
class binaryR{

  int binaryr(List<int>arr,int target){
    return binary(arr, target, 0, arr.length-1);
  }

  int binary(List<int> arr,int target,int start,int end){
    if(start>end){
      return -1;
    }
    int mid = (start+end)~/2;
    if(arr[mid]==target){
      return mid;
    }
    else if(target < arr[mid]){
      return binary(arr, target, start, mid-1);
    }
    else{
      return binary(arr, target, mid+1, end);
    }
  }

}

void main(){
  List<int> arr=[1,2,3,4];
  int target=2;

  binaryR bin = binaryR();
  print(bin.binaryr(arr, target));
}