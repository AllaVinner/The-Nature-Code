Mover car;
PVector mouse;
PVector a;

void setup(){
  background(100);
  size(700,450);
  car = new Mover();
  mouse = new PVector(mouseX, mouseY);
  a = new PVector(0,0);
}

void draw(){
  background(100);
   mouse.x = mouseX;
   mouse.y = mouseY;
   car.update();
   a = PVector.sub(mouse, car.loc);
   a.div(a.mag());
   a.mult(3);
   
   car.setAccel(a);
   car.display();

}