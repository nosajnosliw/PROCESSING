Movie[] videoFiles = new Movie[0];

void loadVideoFile(String fileName) {
  String URL = path+fileName;
  videoFiles = (Movie[])append(videoFiles, new Movie(this, URL));
  int index = videoFiles.length-1;
  videoFiles[index].stop(); 
  println("loaded: "+fileName);
}

void setupVideoFiles() {
  loadVideoFileList();
  //
  int totalFiles = videoFileList.length;
  for(int i=0; i<totalFiles; i++) {
    loadVideoFile(videoFileList[i]);
  }
}

void movieEvent(Movie _videoFile) {
  try {
   _videoFile.read();
  }
  catch(Error e) {
    println(e);
  }
}



