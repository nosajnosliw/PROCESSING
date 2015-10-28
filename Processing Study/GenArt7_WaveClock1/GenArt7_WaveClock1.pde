float _angnoise, _radiusnoise;
float _xnoise, _ynoise;
float _angle = -PI/2;
float _radius;
float _strokeCol = 254;
int _strokeChange = -1;

void setup(){

size (800, 500);
smooth();
frameRate(30);
background(255);
noFill();
_angnoise = random(10);
_radiusnoise = random(10);
_xnoise = random(10);
_ynoise = random(10);
}
void draw() {
  
/*Next, I made the length of the connecting line change by varying the 
radius with a noise value
as it rotated (see figure 4.13).
*/
_radiusnoise += 0.005;
_radius = (noise(_radiusnoise) * 550) +1;

/*I varied the density of the line packing by adding a second noise
variance to the angle of rotation. I allowed the angle to increase 
or decrease so the rotation could reverse. This gave the effect you 
can see in figure 4.14
*/
_angnoise += 0.005;
_angle += (noise(_angnoise) * 6) - 3;
if (_angle > 360) { _angle -= 360; }
if (_angle < 0) { _angle += 360; }

/*Finally, for one extra touch of non-linearity, I wobbled the center of the 
circle slightly, again using a noise function to move it plus or minus 10 
pixels in the x or y direction:
*/
_xnoise += 0.01;
_ynoise += 0.01;
float centerX = width/2 + (noise(_xnoise) * 100) - 50;
float centerY = height/2 + (noise(_ynoise) * 100) - 50;

/*calculated the opposite point by adding pi to the current angle, which, 
if you’re using radians, rotates it 180 degrees. I then extrapolated
the two circumference points using the same sine and cosine functions
*/
float rad = radians(_angle);

float x1 = centerX + (_radius * cos(rad));
float y1 = centerY + (_radius * sin(rad));

float opprad = rad + PI;
float x2 = centerX + (_radius * cos(opprad));
float y2 = centerY + (_radius * sin(opprad));

_strokeCol += _strokeChange;
if (_strokeCol > 254) { _strokeChange = -1; }
if (_strokeCol < 0) { _strokeChange = 1; }
stroke(_strokeCol, 60);

strokeWeight(1);
line(x1, y1, x2, y2);
}


