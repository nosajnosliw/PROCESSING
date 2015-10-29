/*
** select visual effect with switch matrix
 */

void selectEffect() {
  if(projBox.switchMatrix.equals("0000")) frequencyBeat(); 
  else if(projBox.switchMatrix.equals("1111")) funkMix();
  else classicMix();
}


// a linear A/B crossfader
void classicMix() { 
  videoFileSelect();
  videoFileSpeed();
  scrubVideoFile(true);
  
  background(0);
  
  // assign mix values
  float videoFileAlpha = map(projBox.knobs[0], 0, 1023, 0, 255);
  println("videoFileAlpha: "+videoFileAlpha);
  float videoCameraAlpha = 255-videoFileAlpha; 

  // draw video file
  tint(255, videoFileAlpha);
  drawVideo(videoFiles[videoIndex]);

  // draw video camera
  tint(255, videoCameraAlpha);
  drawVideo(videoCamera);
}

// a difference blend mix
void funkMix() {
  videoFileSelect();
  videoFileSpeed();
  scrubVideoFile(true);
  
  // assign mix values
  float videoFileAlpha = map(projBox.knobs[0], 0, 1023, 0, 255);
  float videoCameraAlpha = 255-videoFileAlpha; 

  // draw video file
  tint(255, videoFileAlpha);
  drawVideo(videoFiles[videoIndex], DIFFERENCE);

  // draw video camera
  tint(255, videoCameraAlpha);
  drawVideo(videoCamera, DIFFERENCE);
}

void frequencyBeat() {
  noStroke();
  float bgAlpha = map(projBox.knobs[0], 0,1023,0,255);
  fill(0,bgAlpha);
  rect(0,0,width,height);
  
  fill(255);
  rangeFlash(3,3,1);
  fill(255,0,0);
  rangeFlash(7,9,2);
  stroke(255);
  frequencyWaveMarkers();
  
  translate(0,height*.5);
  
  float waveHue = map(projBox.knobs[1], 0,1023,0,255);
  fill(waveHue, 255, 255);
  stroke(waveHue, 255, 255);
  
  float waveAmp = map(projBox.knobs[2], 0,1023,0,10);
  frequencyWave(waveAmp); 
}

void rgbBeats() {
  noStroke();
  fill(0,255,255); // HSB red
  kickFlash();
  fill(77,255,255); // HSB green
  snareFlash();
  fill(144,255,255); // HSB blue
  hatFlash();
}











