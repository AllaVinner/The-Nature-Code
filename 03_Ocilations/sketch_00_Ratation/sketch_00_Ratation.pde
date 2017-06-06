
 Rotator r;
 
void setup(){
  size(200,200);
 r = new Rotator();
 
  
}

void draw(){
  background(100);
  translate(width/2, height/2);
  rotate(r.angle);
  r.update();
  r.display();
}