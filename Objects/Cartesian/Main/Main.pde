Graf g;
PVector dot;
float f;

void setup(){
  size(600,500);
  background(255);
  g = new Graf();
  dot = new PVector(-2,-7);
  f=0;

}

void draw(){
  background(0);
  g.display();
}