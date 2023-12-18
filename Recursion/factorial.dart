int recursion(int n){
  if(n < 1){
    return 1;
  }
  return n*recursion(n-1);
}

void main(){
  print(recursion(7));
}