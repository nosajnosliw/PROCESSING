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
  // get data from projBox
  projBox.getData();
  getAudioData();
  
  selectEffect();
  recordFrame();
}

void keyPressed() {
  if(key == ' ') startRecording();
}

void keyReleased() {
  if(key == ' ') stopRecording();
}

/* 
** video mixer tools
*/

// draw video image
void drawVideo(PImage videoImage) {
  if(videoImage.width == width && videoImage.height == height) { 
    image(videoImage, 0, 0, width, height);
  }
}

// draw video image with blending
void drawVideo(PImage videoImage, int _blendType) {
  if(videoImage.width == width && videoImage.height == height) { 
    loadImageBuffer(); // load displayed pixels into buffer
    imageBuffer.blend(videoImage, 0, 0, width, height, 0, 0, width, height, _blendType);
    image(imageBuffer, 0, 0, width, height);
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

// jump to a playhead position
void scrubVideoFile(Boolean autoPlay) {
  float playhead = 0;

  int knob3Change = abs(projBox.knobsChange[2]);
  // move playhead only if knob has changed
  if(knob3Change > 11) {
    int knob3 = projBox.knobs[2];
    float duration = videoFiles[videoIndex].duration();
    playhead = map(knob3, 0, 1023, 0, duration);
    autoPlay = false;
  }

  if(!autoPlay) {
    videoFiles[videoIndex].jump(playhead);
  } 
  else if(autoPlay) {
    videoFiles[videoIndex].play();
  }
}


/* 
** audio visualization tools
*/

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

void frequencyWaveMarkers() {
  for(int i = 0; i < fftAverages; i++)
  {
    float percent = (float)i/(float)fftAverages;
    int index = round(percent*fftAverages);

    float x = percent*width;
    line(x,0,x,height);
  }
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

void rangeFlash(int low, int high, int threshold) {
  if(beat.isRange(low, high, threshold)) {
    rect(0,0,width,height);
  }
}







