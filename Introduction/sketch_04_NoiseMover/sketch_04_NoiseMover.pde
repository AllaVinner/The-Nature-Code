Mover m;

void setup(){
  size(650, 200);
  m = new Mover();
  background(100);
}

void draw(){
  m.move();
  m.display();
}
  