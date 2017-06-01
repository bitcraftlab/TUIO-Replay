
/////////////////////////////////////////////////////////////////////
//                                                                 //
//                             TUIO REPLAY                         //
//                                                                 //
/////////////////////////////////////////////////////////////////////

// Replaying Captured Videos + TUIO messages

// (c) bitcraft 2017


// We used camtwist to forward a prerecorded video to reactivision
// >>> http://camtwiststudio.com/

// The resulting TUIO packages were dumped as pcap using Wireshark
// >>> https://www.wireshark.org/

// Requirements 

// - Processing 3.3 
// - TUIO processing library 1.1.5 
//   (included in the code folder)
// - bittwist for replaying the network traffic
//   >>> http://bittwist.sourceforge.net/


import TUIO.*;
TuioProcessing tuioClient;

PFont font;

void setup() {
  
  size(1280, 720);
  //fullScreen();
  
  noCursor();
  noStroke();
  fill(0);
  
  font = createFont("", 12);
  textFont(font); 
  tuioClient  = new TuioProcessing(this);
  
  setupNetwork();
  setupVideo();

}

void draw() {
  drawVideo();
  drawObjects();
}

void refresh(TuioTime t) {
  println(
    "frame", 
    "#" + t.getFrameID(), 
    " (" + t.getTotalMilliseconds() + ")"
  );
}
