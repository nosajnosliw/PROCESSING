float radius;
float centX;
float centY;
float xnoise;
float ynoise;

void setup () {
size(500,300); 
 
strokeWeight(5); 
smooth();
float radius = 100; 
int centX = 250; 
int centY = 150;
}

void draw() {
  
background(255,25);
radius = 100;
float x, y;
float lastx = -999;
float lasty = -999;
float radiusNoise = random(10);
for (float ang = 0; ang <= 1440; ang += 5) {
radiusNoise += 0.05;  
radius += 0.5;
float thisRadius = radius + (noise(radiusNoise) * 200) - 100;
float rad = radians(ang);
x = centX + (thisRadius * cos(rad)); 
y = centY + (thisRadius * sin(rad)); 
if (lastx > -999) 
{
line(x,y,lastx,lasty); 
}
lastx = centX;
lasty = centY;
xnoise += .0009;
ynoise += .0009;


}
}

