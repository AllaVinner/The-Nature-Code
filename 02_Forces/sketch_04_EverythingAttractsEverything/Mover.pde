class Mover{
  PVector loc;
  PVector vel;
  PVector accel;
  
  float mass;
  float volume;

  Mover(float x_, float y_, float mass_){
    loc = new PVector(x_, y_);
    vel = new PVector(0,0);
    accel = new PVector(0, 0);
    mass = mass_;
  }
  
  void update(){
    loc.add(vel);
    vel.add(accel);
    vel.limit(15);
    accel.x=0;
    accel.y=0;
  }
  
  void display(){
    fill(200);
    ellipse(loc.x, loc.y, mass*3,mass*3);
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
    float G = 20;
    float distance = PVector.sub(loc,m.loc).mag();
    distance = constrain(distance, 5, 25);
    PVector r =  PVector.sub(loc,m.loc).normalize();
    
    return r.mult(G*mass*m.mass).div(distance*distance);
  }
}