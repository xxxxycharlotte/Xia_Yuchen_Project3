class Particle {
  PVector destination;
  PVector start;
  PVector pos;
  PVector ppos;
  PVector vel;
  PVector acc;
  color col;
  float mag=random(2, 5);
  float r=stepPixels;
  Particle(PVector d, PVector s) {
    destination=d.get();
    start=s.get();
    ppos=s.get();
    pos=s.get();
    vel=new PVector(destination.x-start.x, destination.y-start.y);
    vel.normalize();
    vel.mult(mag);
  }

  void update() {
    PVector dis=new PVector(destination.x-pos.x, destination.y-pos.y);
    mag=dis.mag();
    if (mag>3) {
      vel.normalize();
      vel.mult(constrain(mag*0.02, 0.5, 10));
      pos.add(vel);
    } else {
      pos=destination.get();
    }
  }
  void display() {
    col=mycolor[index];
    fill(col);
    noStroke();
    pushMatrix();
    translate(pos.x, pos.y);
    ellipse(0, 0, r, r);
    popMatrix();
  }
}
