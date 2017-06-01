
import processing.video.*;
Movie vid;

void setupVideo() {
    vid = new Movie(this, "drawing-bots.m4v");
    vid.play();
}

void drawVideo() {
  if (vid != null) {
    image(vid, 0, 0);
  }
}

void movieEvent(Movie m) {
  m.read();
}