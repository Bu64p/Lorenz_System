import peasy.*;
float x = 0.001;
float y = 0;
float z = 0;
float a = 10;
float b = 28;
float c = 8.0/3.0;
ArrayList<PVector> points_list;
PeasyCam cam;
void setup() {
  size(800, 800, P3D);
  colorMode(HSB);
  noFill();
  points_list = new ArrayList<PVector>();
  cam = new PeasyCam(this, 500);
}
void draw() {
  background(0);
  scale(5);
  float dt = 0.009;
  float dx = (a * (y - x)) * dt;
  float dy = (x * (b - z) - y) * dt;
  float dz = (x * y - c * z)*dt;
  x = x + dx;
  y = y + dy;
  z = z + dz;
  points_list.add(new PVector(x, y, z));
  float HUoffset = 0;
  beginShape();
  for (PVector vec : points_list) {
    stroke(HUoffset, 255, 255);
    vertex(vec.x, vec.y, vec.z);
    if (HUoffset>255) {
      HUoffset=0;
    }
    HUoffset+=0.07;
  }
  endShape();
}
void keyPressed() {
  /*points_list = new ArrayList<PVector>();
  x = 0.001;
  y = 0;
  z = 0;*/
}
