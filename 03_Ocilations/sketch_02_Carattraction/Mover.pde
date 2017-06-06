class Mover{
  PVector loc;
  PVector vel;
  PVector accel;

  float angle;
  
  Mover(){
    loc = new PVector(width/2, height/2);
    vel = new PVector(0,0);
    accel = new PVector(0, 0);
  }
  
  void update(){
    loc.add(vel);
    vel.add(accel);
    vel.limit(5);
    angle = atan2(vel.y,vel.x);
    angle = vel.heading();
  }
  
  void display(){
    fill(255);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    rect(0, 0, 16,8);
    popMatrix();
    
  }
  
  void checkEdges(){
    if(! (0 < loc.x && loc.x < width)){
      vel.x *= -1;
    }
    if(! (0 < loc.y && loc.y < height)){
      vel.y *= -1;
    }
  }
  
  void setAccel(PVector a){
    accel.x = a.x;
    accel.y = a.y;
  }
}