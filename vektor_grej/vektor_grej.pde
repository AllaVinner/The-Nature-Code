Arrow start;
Arrow tangent;
Arrow normal;

Arrow tanComponent;

void setup(){
size(400,400);
background(0);

start = new Arrow(width/2, height/2, 40, PI/3, "BLUE");
tangent = new Arrow(start.loc.x + start.arrow.x, start.loc.y + start.arrow.y, 40, -PI/4, "GREEN");
normal = new Arrow(start.loc.x + start.arrow.x, start.loc.y + start.arrow.y, 40, PI/4, "GREEN");
tanComponent = new Arrow(start.loc.x + start.arrow.x, start.loc.y + start.arrow.y, getTangentComponent(start.arrow,tangent.arrow, normal.arrow), "RED");
}

void draw(){
  background(0);
  start.display();
  tangent.display();
  normal.display();
  tanComponent.display();
}

PVector getTangentComponent(PVector start, PVector tangent, PVector normal){
  float mag = PVector.dot(start, tangent);
  mag /= tangent.mag();
  PVector tangentHat = tangent.copy();
  return tangentHat.mult(mag);
}
  
  