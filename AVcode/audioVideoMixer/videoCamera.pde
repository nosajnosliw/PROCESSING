Capture videoCamera;

// open the video camera stream
void setupVideoCamera() {
  String[] cameraList = Capture.list();
  println(cameraList);
  // select from available cameras
  String cameraName = cameraList[3]; 
  
  // connect to camera
  videoCamera = new Capture(
                            this, 
                            width, 
                            height, 
                            cameraName, 
                            30 
                           );
}

// read camera frame when available
void captureEvent(Capture _videoCamera) {
  try {
    _videoCamera.read();
  } 
  catch(Error e) {
    println(e);
  }
}


