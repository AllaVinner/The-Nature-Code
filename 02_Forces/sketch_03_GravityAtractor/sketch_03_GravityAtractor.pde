Mover m;
Attractor a;

PVector gravity;

void setup(){
  size(600, 600);
  
  m = new Mover(8);
  a = new Attractor(width/2, height/2, 50);
  gravity = new PVector(0,0);
  
}

void draw(){
 // background(0);
  
  gravity = a.attract(m);
  m.applyForce(gravity);
  
  a.display();
  m.update();
  m.display();
}