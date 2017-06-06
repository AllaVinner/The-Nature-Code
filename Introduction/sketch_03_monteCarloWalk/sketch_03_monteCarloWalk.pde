Walker w;

void setup(){
  size(640, 500);
  w = new Walker();
  background(255);
}

void draw(){
  w.step();
  w.display();
}