float yPos;
float yPos;

float xVel;
float yVel;

void setup(){
  size(720,400);
  smooth();
  /*we will define a variblae to subistitute in the x,y positions
  float xPos = 100;
  float yPos = 200;
  variable scope - the variable is only defined int he setup and will on
  only exist in the setup.  We must assing the variobales outside of both 
  of the function even before the setup.
  */
  //This will place the shape in the middle of the canvas.  Width and height 
  //are defined above.
  xPos = width/2;
  yPos = height/2;
  
  xVel = 1;
  yVel = 2;
  
}

void draw () {
  background(255);
   
   /*attach the varible (position fo the circle) to the mouse position)
   xPos = mouseX
   yPos = mouseY
  */
  
  /*make the cirlcle move on its own.  Add 1 pixel to the position of the circle
  for every time the draw function runs.  Where + # is the velocity.  You can 
  define a variable (xVel, yVel) instead of using 1, 2, 3, etc...
  */
  xPos = xPos + xVel;
  yPos = yPos + yVel;

  
  fill(0); noStroke();
  //     (x,y,width,height)
  ellipse(xPos,yPos,60,60);
  
}



