class binaryR{
  int binaryr(List<int> arr,int target){
    return binary(arr, target, 0, arr.length-1);
  }
  
  int binary(List<int> arr,int target,int str,int end){
    if(str>end){
      return -1;
    }
    int mid = (str+end)~/2;
    if(arr[mid]==target){
      return mid;
    }
    else if(target<arr[mid]){
      return binary(arr, target, str, mid-1);
    }
    else{
      return binary(arr, target, mid+1, end);
    }
  }
}

void main(){
List<int> arr=[1,2,3,4,5];
int target = 7;
  binaryR bin = binaryR();
  print(bin.binaryr(arr, target));
}