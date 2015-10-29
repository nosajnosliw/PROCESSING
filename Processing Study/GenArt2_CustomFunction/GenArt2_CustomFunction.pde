/*Functions:
returnType funcName([parameters]) { // code in here
}
Note the int x is designated return value of the custome function in this case
AddNumbers(1,2)
*/


void setup() {
int x = AddNumbers(1,2); 
println(x);
}
int AddNumbers(int a, int b) { 
  int returnValue = a + b; 
  return returnValue;
}


