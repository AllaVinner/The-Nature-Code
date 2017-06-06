class Oscillator{

PVector loc;
PVector vel;
PVector accel;

PVector direction;
float angle;

float th;
float begin;
float amp;
float period;

float startX;
float startY;

Oscillator(float amp_, float begin_, float period_, float angle_, float startx_, float starty_){
  
  loc = new PVector(0,0);
  vel = new PVector(0,0);
  accel = new PVector(0,0);
  direction = new PVector(0,0);
  begin = begin_;
  amp = amp_;
  period = period_;
  angle = angle_;
  direction.x = cos(angle);
  direction.y= -sin(angle);
  
  startX = startx_;
  startY = starty_;
  
  th=0;
}

void display(){
  fill(100, 100);
  pushMatrix();
  translate(startX, startY);

  line(0,0, loc.x, loc.y);
   ellipse(loc.x, loc.y, 25, 25);
  popMatrix();
  
}

void update(){
  loc = vel.get();
  vel = accel.get();
  accel = PVector.mult(direction, amp*sin(th *period+begin)*cos(th+PI/3)); 
  th += 0.01;
}
}