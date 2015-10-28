

int rchoice = 0;
int gchoice = 33;
int bchoice = 66;

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
  
  float choice = random(0,100);
  
  if(choice<rchoice)
  {
    fill(255, 0, 0);
  ellipse(150, 150, 50, 50);
    
  }
  if(choice<gchoice)
  {
    fill(0, 255, 0);
  ellipse(200, 200, 50, 50);
    
  }
  
  if(choice<bchoice)
  {
    fill(0, 0, 255);
  ellipse(250, 250, 50, 50);
    
  }
  
  
  rchoice++;
  gchoice++;
  bchoice++;
  if(rchoice>100) rchoice = 0;
  if(gchoice>100) gchoice = 0;
  if(bchoice>100) bchoice = 0;
}
