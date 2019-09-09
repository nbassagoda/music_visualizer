import ddf.minim.*;
import peasy.*;

PeasyCam cam;
AudioPlayer player;
Minim minim;

void setup() {
  size(900, 600, P3D);
  background(0);
  cam = new PeasyCam(this, width/2, 200, 20, 500);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(1000);
  smooth();
  minim = new Minim(this);
  player = minim.loadFile("../data/audio.mp3");
  player.loop(); 
}


void draw() {
  background(#00023a, 400);
  float color1 = random(334, 267);
  float color2 = random(0, 303);
  float color3 = random(0, 227);
  float color4 = random(0, 222);

  float level = player.mix.level();
  float leftLevel = player.left.level();
  float rightLevel = player.right.level();

  float rectW = (level * width)/2;
  float leftRect = (leftLevel * width)/4;
  float rightRect = (rightLevel * width)/4;
  
  cam.rotateZ(1);

  if (level > 0.35) {
    drawRect(100, 100, color1, rectW );
  }
  else {
    drawRect(0, 0, color1, rectW );
  }
  
  
  if (level > 0.35) {
    drawRect(0, 0, color2, rectW );
  }
  else {
    drawRect(100, 100, color2, rectW );
  }


  if (level > 0.4) {
    drawTriangle(0,100,color4,leftRect);
  }
  else {
    for (int i = 100; i < 2300; i = i+200) {
      for (int j = 0; j < 2200; j = j+200) {
        fill(color4, 195, 255, 64);
        ellipse(i, j, leftRect, leftRect);
      }
    }
  }


  if (level > 0.4) {
     drawTriangle(100,0,color4,rightRect);
  }
  else {
    for (int i = 0; i < 2200; i = i+200) {
      for (int j = 100; j < 2300; j = j+200) {
        fill(255, 119, color3, 64);
        ellipse(i, j, rightRect, rightRect);
      }
    }
  }
  
}

//Auxiliary voids
void drawRect(int k, int l,float rectColor, float rectW ){
  for (int i = k; i < k+2300; i = i+200) {
      for (int j = l; j < l+2300; j = j+200) {
        fill(255, 255, rectColor, 64);
        rect(i-rectW/2, j-rectW/2, rectW, rectW);
      }
    }
}

void drawTriangle(int k, int l,float triColor, float calculatePoint ){
 for (int i = k; i < k+2200; i = i+200) {
      for (int j = l; j < l+2300; j = j+200) {
        fill( triColor, 195, 255, 64);
        triangle(i, j+calculatePoint*0.5, i-calculatePoint/2.5, j-calculatePoint*0.25, i+calculatePoint/2.5, j-calculatePoint*0.25);
      }
  }
}