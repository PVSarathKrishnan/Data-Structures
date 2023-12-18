class encrytor{
  
  String convert(String value,int key){
    List<String> arr =[];
    int newKey = key%26;
    for(int i=0;i<value.length;i++){
      int pos = value.codeUnitAt(i)+newKey;
      if(pos<122){
        arr.add(String.fromCharCode(pos));
      }
      else{
        arr.add(String.fromCharCode(96+pos%122));
      }
    }
    return arr.join();
  }
}

void main(){
  String value="assddd";
  int key = 2;

  encrytor en = encrytor();
  print(en.convert(value, key));

}