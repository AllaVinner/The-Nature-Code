
float r;
float th;

PVector loc;

void setup(){
  
  size(500,500);
  loc = new PVector(0,0);
  r=0;
  th =0;
  
}

void draw(){
  
  translate(width/2, height/2);
  ellipse(r*cos(th), r*sin(th), 10, 10);
  fill(0);
  th+=0.02;
  r += 0.1;
  
}