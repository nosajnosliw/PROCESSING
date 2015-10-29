void setup() {
size (400,800);
smooth();
  
}
    

void draw() {
 background(255);
 line (0,0,width,height);
 line (0,height,width,0);
 
 rectMode(CENTER);
 ellipse(width/2, height/2,width/2,height/2);
 rect(width/8,height/2,width/8,height/8);
 rect(width-width/8,height/2,width/8,height/8);
 }
