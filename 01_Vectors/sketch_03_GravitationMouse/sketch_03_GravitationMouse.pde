Mover blob;
PVector mouse;
PVector a;

void setup(){
  background(100);
  size(700,450);
  blob = new Mover();
  mouse = new PVector(mouseX, mouseY);
  a = new PVector(0,0);
}

void draw(){
//  background(100);
   mouse.x = mouseX;
   mouse.y = mouseY;
   blob.update();
   a = PVector.sub(mouse, blob.loc);
   a.div(a.mag()*a.mag());
   a.mult(1);
   
   blob.setAccel(a);
   
   stroke(255);
   fill(10);
   ellipse(blob.loc.x, blob.loc.y, 16,16);
}