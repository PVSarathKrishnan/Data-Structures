class mergeSort{
  
  List<int> merge(List<int>arr){
    if(arr.length <= 1){
      return arr;
    }
    int mid = arr.length ~/2; 
    List<int> leftArr = merge(arr.sublist(0,mid));
    List<int> RightArr = merge(arr.sublist(mid));

    return sort(leftArr,RightArr);
  }

  List<int> sort(List<int> LeftArr,List<int> RightArr){
    List<int> res = [];

    int i=0;
    int j=0;

    while(i<LeftArr.length && j<RightArr.length){
      if(LeftArr[i] <= RightArr[j]){
        res.add(LeftArr[i]);
        i++;
      }
      else{
        res.add(RightArr[j]);
        j++;
      }
    }
    
    while(i<LeftArr.length){
      res.add(LeftArr[i]);
      i++;
    }
    while(j<RightArr.length){
      res.add(RightArr[j]);
      j++;
    }
    return res;
  }
  
}

void main(){

  List<int> arr = [1,2,5,6,7,4,3];
  mergeSort m = mergeSort();
  print(m.merge(arr));
}