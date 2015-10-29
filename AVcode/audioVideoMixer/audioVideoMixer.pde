import processing.video.*;

int videoWidth = 640;
int videoHeight = 480;

String path = "data/";

ProjBox projBox;

void setup() {
  size(videoWidth,videoHeight);
  frameRate(30);
  noCursor();

  // setup projBox
  projBox = new ProjBox();
  setupAudio();
  setupVideoCamera();
  setupVideoFiles();
}

void draw() {
  projBox.getData();
  getAudioData();

  classicMix();
  recordFrame();
}

void keyPressed() {
  if(key == ' ') startRecording();
}

void keyReleased() {
  if(key == ' ') stopRecording();
}


// draw video image
void drawVideo(PImage videoImage) {
  if(videoImage.width == width && videoImage.height == height) { 
    image(videoImage, 0, 0, width, height);
  }
}

void videoFileSpeed() {
  int knob2 = projBox.knobs[1];
  float speed = map(knob2, 0, 1023, 0, 2);
  videoFiles[videoIndex].speed(speed);
  videoFiles[videoIndex].loop();
}

int videoIndex = 0;
void videoFileSelect() {
  int knob4Change = abs(projBox.knobsChange[3]);
  if(knob4Change > 11) {
    videoFiles[videoIndex].stop();
    int totalVideoFiles = videoFiles.length-1;
    int knob4 = projBox.knobs[3];
    videoIndex = round(map(knob4, 0, 1023, 0, totalVideoFiles));
    videoFiles[videoIndex].loop();
  }
}


void volumeWave(float amp) {
  float x = 0;
  float y = 0;
  //
  beginShape(QUAD_STRIP);

  for(int i = 0; i < width; i++)
  {
    float percent = (float)i/width;
    int index = round(percent*volumes.length);

    x = i+1;
    y = abs(volumes[index])*amp;
    vertex(x,y);
    vertex(x,y*-1);
  }
  endShape();
}

void frequencyWave(float amp) {
  float x = 0;
  float y = 0;
  //
  beginShape(QUAD_STRIP);

  for(int i = 0; i < fftAverages; i++)
  {
    float percent = (float)i/fftAverages;
    int index = round(percent*fftAverages);

    x = percent*width+(2.0/(float)fftAverages);
    y = frequencies[index]*amp;
    vertex(x,y);
    vertex(x,y*-1);
  }
  endShape();
}

void kickFlash() {
  if(beat.isKick()) {
    rect(0,0,width,height);
  }
}

void snareFlash() {
  if(beat.isSnare()) {
    rect(0,0,width,height);
  }
}

void hatFlash() {
  if(beat.isHat()) {
    rect(0,0,width,height);
  }
}

