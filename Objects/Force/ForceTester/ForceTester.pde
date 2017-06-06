Mover m;
Mover m2;
Force gravity;
Force normal;
Force vel;

Surface s;

void setup(){
  size(900,500);
  background(150);
  
  m = new Mover(870,  100, 3, 16);
  s = new Surface(70, 480,  890, 400);
  gravity = new Force(0.2, -PI/2);
  normal = new Force(s.norm);
}

void draw(){
   background(150);
   fill(50);
   line(s.startX, s.startY, s.endX, s.endY);
   
   m.applyForce(gravity);
   if(s.isInside(m)){
     normal.setNormalForce(m);
     m.applyForce(normal);
   }

   m.update();
   m.display();



}
  