
float xnoise = 0;
float ynoise = 100;

void setup()
{
  
 size(400, 400); 
  
}


void draw()
{
  background(255);
  stroke(0);
  noFill();
  float x = 0;
  float y = 0;
  int w = 20;
  int h = 20;
  
  x = noise(xnoise, ynoise)*width;
  y = noise(ynoise, xnoise)*height;
  ellipse(x, y, w, h);
  
  float increment = (float)mouseX/width;
  
  xnoise=xnoise+increment/10.;
  ynoise=ynoise+increment/10.;
  
  
}
