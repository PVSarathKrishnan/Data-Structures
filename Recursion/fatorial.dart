void recursion(int n){
  if(n < 1){
    return;
  }
  print(n);
  recursion(n-1);
}

void main(){
  recursion(5);
}