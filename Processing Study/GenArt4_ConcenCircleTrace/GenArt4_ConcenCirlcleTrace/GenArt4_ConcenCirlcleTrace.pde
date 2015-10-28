int diam = 10;
float centX, centY;


void setup() { 
size(500, 300); 
frameRate(24); 
smooth(); 
background(180); 
centX = width/2; 
centY = height/2; 
stroke(0); 
strokeWeight(1); 
noFill();
}


void draw() {
for (diam < 1000) {
// background(180); comment out this line by doing so you allow the 
//smaller circles to remain in the frame as the loop runs fo completion
ellipse(centX, centY, diam, diam);
diam += 10;

}

