class sort{

  List<int> insertion(List<int> arr){

    for(int i=1;i<arr.length;i++){
      int current = arr[i]; //set current
      int j =i-1; //to check prev of i
      while(j>=0 && arr[j]>current){
        arr[j+1] = arr[j];
        j--;
      }
    arr[j+1] = current;      
    }
    return arr;
  }

}

void main(){

List<int> arr = [1,3,5,2,5,6,3];
sort s =sort();
print(s.insertion(arr));
}