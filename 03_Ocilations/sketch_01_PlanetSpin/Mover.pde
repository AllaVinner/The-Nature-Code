class Mover{
  PVector loc;
  PVector vel;
  PVector accel;
  
  float angle;
  float aVel;
  float aAccel;
  
  float mass;
  float volume;

  Mover(float x_, float y_, float mass_){
    loc = new PVector(x_, y_);
    vel = new PVector(0,0);
    accel = new PVector(0, 0);
    mass = mass_;
    
    angle =0;
    aVel=0;
    aAccel = 1/(100*x_);
  }
  
  void update(){
    loc.add(vel);
    vel.add(accel);
    vel.limit(5);
    accel.x=0;
    accel.y=0;
    
    angle += aVel;
    aVel += aAccel;
    
  }
  
  void display(){
    fill(200);
    
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(angle);
    rect(0, 0, mass,mass);
    popMatrix();
  }
  
  void checkEdges(){
    float c = 0.5;
    if(loc.x < 0){
      vel.x = c* Math.abs(vel.x);
    }
    if(width-mass < loc.x){
      vel.x =-c* Math.abs(vel.x);
    }
    
    if(loc.y < 0){
      vel.y = c*Math.abs(vel.y);
    }
    if(height-mass < loc.y){
      vel.y = -c*Math.abs(vel.y);
    }
  }
  
  void applyForce(PVector force){
    accel.add(PVector.div(force,mass));
  }
  
    void ignoreForce(PVector force){
    accel.sub(PVector.div(force,mass));
  }
  
  PVector attract(Mover m){
    float G = 2;
    float distance = PVector.sub(loc,m.loc).mag();
    distance = constrain(distance, 5, 25);
    PVector r =  PVector.sub(loc,m.loc).normalize();
    
    return r.mult(G*mass*m.mass).div(distance*distance);
  }
}