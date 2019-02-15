
Camera cam = new Camera();
Coral coral = new Coral();
void setup(){
  size(800, 500, P3D);
  
}

void draw(){
  background(128);
  
  cam.update();
  coral.update();
  pushMatrix();
 
  popMatrix();
  //box(50,50,50);
  coral.draw();
}
