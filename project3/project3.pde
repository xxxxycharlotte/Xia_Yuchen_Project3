PImage[] myimg=new PImage[7];
color[] mycolor={color(161, 47, 47), color(244, 208, 0), color(137, 190, 178), color(64, 116, 52), color(20, 68, 106), color(78, 29, 76), color(255)};
int stepPixels=5;
ArrayList<Particle> particles = new ArrayList<Particle>();
int state=0;
import ddf.minim.*;
Minim minim;
AudioPlayer player; 
int index=0;
void setup() {
  size(900, 900);
  int r=int(random(255));
  int g=int(random(255));
  int b=int(random(255));
  mycolor[6]=color(r, g, b);
  for (int i=0; i<myimg.length; i++) {
    myimg[i]=loadImage(i+".png");
    myimg[i].resize(width, height);
  }

  minim = new Minim(this);
  player=minim.loadFile("Solstice.mp3");
  player.play();
  player.loop();
  drawText(myimg[index]);
  println(particles.size());
}

void draw() {
  background(0);
  for (int i=0; i<particles.size(); i++) {
    particles.get(i).update();
    particles.get(i).display();
  }
}

void drawText(PImage img) {
  img.loadPixels();
  for (int i=0; i<width; i+=stepPixels) {
    for (int j=0; j<height; j+=stepPixels) {
      if (brightness(img.get(i, j))<50) {
        PVector destination=new PVector(i, j);
        float r=random(700, 1200);
        float theta=random(-PI, PI);
        PVector start=new PVector(r*cos(theta)+width/2, r*sin(theta));
        particles.add(new Particle(destination, start));
      }
    }
  }
  img.updatePixels();
}

void mousePressed() {
  index=(index+1)%(myimg.length);
  particles = new ArrayList<Particle>();
  drawText(myimg[index]);
}
