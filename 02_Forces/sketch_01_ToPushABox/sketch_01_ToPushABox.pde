Mover box;
PVector push;
PVector friction;

void setup(){
  size(700,300);
  
  push = new PVector(2,0);
  friction = new PVector(0,0);
  
  box = new Mover(3);
}

void draw(){
  background(40);

  if(mousePressed){
        box.applyForce(push);
  }

  friction = getFriction(box.vel);
  box.applyForce(friction);
  
  box.update();
  box.checkEdges();
  box.display();   
  
}

PVector getFriction(PVector vel){
  float N = 3;
  float my = 0.2;
  PVector copVel = vel.get();
  copVel.normalize();
  return copVel.mult(-1*N*my);
}
  
  