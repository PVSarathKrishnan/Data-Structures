int fibonacci(int i){
  if(i<=1){
    return i;
  }
  else{
    return fibonacci(i-1) + fibonacci(i-2);
  }
}

void main(){
  for(int i=0;i<5;i++){
    print(fibonacci(i));
  }
}