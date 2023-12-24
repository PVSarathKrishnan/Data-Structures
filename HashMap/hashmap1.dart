import 'dart:collection';

void main(){
  HashMap<String,int> studentAges = HashMap<String,int>();

  //add key values
  studentAges['a'] = 25;
  studentAges['b'] = 26;
  studentAges['c'] = 27;
  studentAges['d'] = 28;

  //print
   print('age of a is ${studentAges['a']}');

  //update
   studentAges['a'] = 26;

  // print('updated age of a is ${studentAges['a']}');

  //check if key contains
  // if(studentAges.containsKey('c')){
  //   print(studentAges['c']);
  // }

  //iterate using key
  // for(var key in studentAges.keys){
  //   print(key.hashCode);
  // }

  //iterate using values
  // for(var value in studentAges.values){
  //   print(value.hashCode);
  // }

  //iterate key-value
  studentAges.forEach((key, value) {
    print('$key : $value');
  });

  //clear values
  // print("value : $studentAges");
  // studentAges.clear();
  // print("value cleared : $studentAges");


}