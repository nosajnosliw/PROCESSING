PImage  imageBuffer = new PImage(width,height);

void loadImageBuffer() {
  imageBuffer = get();
}


String timeStamp() {
  int m = millis()%1000;
  String timestamp = year()+"_"+month()+"_"+day()+"_"+minute()+"_"+second()+"_"+m;
  return timestamp;
}


