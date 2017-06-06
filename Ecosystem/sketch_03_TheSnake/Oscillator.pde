class Oscillator{

PVector loc;
PVector vel;
PVector accel;
float th;

PVector direction;

PVector origo;

float amp;
float begin;
float period;
float angle;



Oscillator( float origox_, float origoy_ , float angle_, float amp_, float begin_, float period_){
  
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
  
  origo = new PVector( origox_, origoy_);
  
  th=0;
}

void display(){
  fill(100,0,200);
  pushMatrix();
  translate(origo.x, origo.y);

  line(0,0, loc.x, loc.y);
   ellipse(loc.x, loc.y, 15, 15);
  popMatrix();
  
}

void update(){
  loc = vel.copy();
  vel = accel.copy();
  accel = PVector.mult(direction, amp*sin(th *period+begin)); 
  th += 0.01;
}
}