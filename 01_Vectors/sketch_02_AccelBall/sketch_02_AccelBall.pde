Mover m;

void setup(){
  size(600,400);
  background(20);
  m = new Mover();
}

void draw(){
 // background(20);
  m.update();
  m.checkEdges();
  m.display();
}