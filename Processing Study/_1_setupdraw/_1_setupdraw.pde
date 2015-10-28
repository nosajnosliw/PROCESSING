/* variables are initialized here or operations that we only 
want to perform once.  
*/
void setup () {
 size(600,600);
 smooth();
 //background can go from 255(white) - 0(black)
 background (0);
 
  
}
/*this section of the code is constantly refreshing.  Note that
when we move the background to the set up section, the moving cursor
is not animated. The background is not refresshing with the ellipse
*/
void draw (){
 
  //(x,y,w,h)  remembner the other formats for these parameters)
  ellipse(mouseX,mouseY,20,20);
  
  
}
