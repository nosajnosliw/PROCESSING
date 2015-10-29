MovieMaker videoRecording;
Boolean recording = false;
String recordingFileName;

void startRecording() {
  if(!recording) {
    recording = true;
    recordingFileName = timeStamp()+".mov";
    println("starting recording: "+recordingFileName);
    //
    String filePath = path+recordingFileName;
    int codec = MovieMaker.MOTION_JPEG_B;
    int quality = MovieMaker.BEST;
    int FPS = 30;
    videoRecording = new MovieMaker(
                                    this, 
                                    width, 
                                    height, 
                                    filePath, 
                                    FPS, 
                                    codec, 
                                    quality
                                    );
  }
}

void recordFrame() {
  if(recording) videoRecording.addFrame();
}

void stopRecording() {
  if(recording) {
    videoRecording.finish();
    println("stopped recording");
    recording = false;
    appendVideoFileList(recordingFileName);
    loadVideoFile(recordingFileName);
  }
}















