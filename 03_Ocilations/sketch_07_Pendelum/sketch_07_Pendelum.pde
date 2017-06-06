Pendelum p;
Force gravity;
Force normal;

void setup(){
  size(600, 400);
  background(700);
  
  p = new Pendelum(PI/4, 150);
  gravity = new Force( new PVector(0,0.2), " ");
  normal = new Force( new PVector(0,0), "Normal");
}

void draw(){
  background(700);
  
  println(gravity.force.x + "    " + gravity.force.y);
  p.applyForce(gravity);
  p.applyForce(normal);
  
  p.update();
  p.display();
}