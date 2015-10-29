import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;

AudioInput audioIn;
float sampleRate = 44100; // default sample rate
int bufferSize = 2048; 
float[] volumes; // sample volumes per frame

FFT fft;
int fftAverages;
float[] frequencies;

BeatDetect beat;

void setupAudio() {
  minim = new Minim(this);
  minim.debugOn();
  // get a line in from Minim, default bit depth is 16
  audioIn = minim.getLineIn(Minim.MONO, bufferSize, sampleRate);
  volumes = new float[bufferSize];
  
  fft = new FFT(bufferSize, sampleRate);
  fft.logAverages(60, 3);
  fftAverages = fft.avgSize();
  frequencies = new float[fftAverages];
  
  // we got the beat
  beat = new BeatDetect(bufferSize, sampleRate);
  beat.setSensitivity(200);
}

void getAudioData() {
  for(int i = 0; i < bufferSize; i++)
  {
    volumes[i] = audioIn.mix.get(i);
  }
  
  fft.forward(audioIn.mix);
  for(int j = 0; j < fftAverages; j++) {
    frequencies[j] = fft.getAvg(j);
  }
  
  // we got the beat,
  beat.detect(audioIn.mix);
  
}

void stop() 
{
  audioIn.close();
  minim.stop();

  super.stop();
}








