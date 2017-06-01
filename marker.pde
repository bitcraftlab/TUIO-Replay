
// callbacks for when objects are added, updated or removed

void addTuioObject(TuioObject o) {
  println(
    "add obj",
    o.getSymbolID(), 
    "(" + o.getSessionID() + ")", 
    o.getX(), 
    o.getY(), 
    o.getAngle()
  );
}

void updateTuioObject (TuioObject o) {
  println(
    "set obj ",
    o.getSymbolID(),
    "(" + o.getSessionID() + ")",
    o.getX(),
    o.getY(), 
    o.getAngle(),
    o.getMotionSpeed(),
    o.getRotationSpeed(),
    o.getMotionAccel(),
    o.getRotationAccel()
  );
}

void removeTuioObject(TuioObject o) {
  println(
    "del obj ",
    o.getSymbolID(), 
    "(" + o.getSessionID() + ")"
  );
}


void drawObjects() {
  
  for (TuioObject o : tuioClient.getTuioObjectList()) {

    // get location and rotation
    int w = o.getScreenX(width);
    int h = o.getScreenY(height);
    float ang = o.getAngle();
    float d = 60;

    stroke(255, 0, 0);
    fill(255, 200, 200, 200);

    // rectangle, representing the fiducial
    pushMatrix();
    translate(w, h);
    rotate(ang);
    rect(-d/2, -d/2, d, d);
    
    // triangle, representing the upwards direction
    fill(255, 200, 200, 100);
    stroke(255, 0, 0, 100);
    triangle(-d/2, -d/2, 0, -d, d/2, -d/2);
    popMatrix();
    
    // draw label on top
    int id = o.getSymbolID();
    fill(0);
    text(id, w, h);
    
  }
}