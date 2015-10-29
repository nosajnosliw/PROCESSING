Capture videoCamera;

// open the video camera stream
void setupVideoCamera() {
  String[] cameraList = Capture.list();
  println(cameraList);

  // hack on OS X for using external webcam instead of built in iSight
  // camerList[1] is the built-in iSight in this case:
 // Capture defaultCamera = new Capture(this, width, height, cameraList[1], 1);
  
  // select the camera you want to use (i.e. cameraList[3])
  // change the index values to match the camera on your system
  String cameraName = cameraList[1]; 

  // connect to camera you want to use
  videoCamera = new Capture( this, width, height, cameraName, 30 );
  
  // stop calling frames from the "dummy" camera
  //defaultCamera.stop();
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

