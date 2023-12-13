sum(int n){
if(n==1){
  return 1;
}
return n+sum(n-1);
}

void main(){

  int n = 5;
  print(sum(n));

}