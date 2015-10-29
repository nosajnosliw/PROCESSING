/* The upper left hand corner is the (0,0) where x is the 
horizontal coordinate and y is the vertical 

*/

void setup() {
  size(400,400);
  
}


void draw() {
  background(255);
  /*you can set the color of the object's fill
  with the fill(r,g,b) or fill(#1a2b3c) like a color you would pull from kuler.  
  */
  
  fill(#5C23FF);
  rect(mouseX,mouseY,100,100);
  
  /* with the fill(#,#) the second value is the alpha value using 0-255 values in this particular
  coordination of the fill command.  If you set the parameter as mouseX (horizontal)
  the value will go up and down with the movement of the mouseX coordinate.
  since the mouse coordinates range from 0 to 400 we will use the map() function 
  to re establish the values from 0 - 255 instead)
  */
  
  fill(0,mouseX);
  rect(mouseX,mouseY,100,100);
  
}
