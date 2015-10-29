void freqeuncyBeat() {
  noStroke();
  float bgAlpha = map(projBox.knobs[0], 0,1023,0,255);
  fill(0,bgAlpha);
  rect(0,0,width,height);
  
  rgbBeats();
  
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








