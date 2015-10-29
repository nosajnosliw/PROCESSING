ProjBox projBox;

void setup() {
  size(640, 480);
  frameRate(30);
  noCursor();
  smooth();
  colorMode(HSB);
  
  projBox = new ProjBox();
  setupAudio();
}

void draw() {
  projBox.getData();
  getAudioData();
  
  if(projBox.switches[0] == 1) rgbBeats();
  else freqeuncyBeat();
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

void rangeFlash(int low, int high, int threshold) {
  if(beat.isRange(low, high, threshold)) {
    rect(0,0,width,height);
  }
}






