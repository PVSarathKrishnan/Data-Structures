class mergeSort {
  List<int> merge(List<int> arr) {
    if (arr.length <= 1) {
      return arr;
    }
    int mid = arr.length ~/ 2;
    List<int> leftArr = merge(arr.sublist(0, mid));
    List<int> rightArr = merge(arr.sublist(mid));

    return sort(leftArr, rightArr);
  }

  List<int> sort(List<int> leftArr, List<int> rightArr) {
    List<int> res = [];

    int i = 0;
    int j = 0;

    while (i < leftArr.length && j < rightArr.length) {
      if (leftArr[i] <= rightArr[j]) {
        res.add(leftArr[i]);
        i++;
      } else {
        res.add(rightArr[j]);
        j++;
      }
    }

    while (i < leftArr.length) {
      res.add(leftArr[i]);
      i++;
    }
    while (j < rightArr.length) {
      res.add(rightArr[j]);
      j++;
    }
    return res;
  }
}

void main() {
  List<int> arr = [1, 2, 5, 6, 7, 4, 3];
  mergeSort m = mergeSort();
  print(m.merge(arr));
}
