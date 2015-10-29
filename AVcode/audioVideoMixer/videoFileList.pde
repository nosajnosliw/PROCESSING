String videoFileListTxt = "videoFileList.txt";
String[] videoFileList = new String[0];

void loadVideoFileList() {
  videoFileList = loadStrings(path+videoFileListTxt);
}

void appendVideoFileList(String _recordingFileName) {
  loadVideoFileList();
  videoFileList = append(videoFileList, _recordingFileName);
  saveStrings(path+videoFileListTxt, videoFileList);
  loadVideoFileList();
}


