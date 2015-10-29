// a linear A/B crossfader
void classicMix() { 
  videoFileSelect();
  videoFileSpeed();
  
  // assign mix values
  float videoFileAlpha = map(projBox.knobs[0], 0, 1023, 0, 255);
  float audioWaveAlpha = 255-videoFileAlpha; 

  // draw video file
  tint(255, videoFileAlpha);
  drawVideo(videoFiles[videoIndex]);

  translate(0,height*.5);
  noStroke();
  fill(255, audioWaveAlpha);
  float waveAmp = map(projBox.knobs[1], 0, 1023, 0, 2000);
  volumeWave(waveAmp);
}







