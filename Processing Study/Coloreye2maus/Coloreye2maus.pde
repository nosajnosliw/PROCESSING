    float r;
    float g;
    float b;
    float a;
    float diam;
    float x;
    float y;
    float a2;
    float b2;
    float c;
    float d;
    float e;
    float f;
    float j;
    float i;
    float maus = mouseX;
    float maus2 = mouseY;
    float p;
    
float xnoise = 0;
float ynoise = 100;
    
    void setup() {
     size(900,600);
     smooth();
     background(0);
     frameRate(30);
}
    void draw() {
      triangles ();
      bubbles ();
      pupil();
      
      
     // Fill all variables with random values
     r = random(255);
     g = random(255);
     b = random(255);
     a = random(255);
     j = random(600);
     i = random(900);
     diam = random(10,450);
     x = noise(xnoise, ynoise)*width;
     y = noise(ynoise, xnoise)*height;
     a2 = random(10,width + 50);
     b2 = random(10,height + 50);
     c = random(10,width + 50);
     c = random(10,height + 50);
     e = random(10,width + 50);
     f = random(10,height + 50);
     p = random(60,90);
}     
     // Use values to draw an ellipse
void bubbles() {
     stroke(0,a);
     fill(r,g,b,a);
     ellipse(maus,maus2,diam,diam);
    
     
      xnoise=xnoise+.008;
      ynoise=ynoise+.008;
    
}    

void pupil() {
  fill(0);
  ellipse(x,y,p,p);
}
    
void triangles() {     
     stroke(0);
     strokeWeight(5);
     fill(x,x,b);
     triangle(0,0,maus,maus2,900,600);
}



