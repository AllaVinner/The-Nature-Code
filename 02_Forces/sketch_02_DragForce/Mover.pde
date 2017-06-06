class Mover{
  PVector loc;
  PVector vel;
  PVector accel;
  
  float mass;
  float volume;
  
  Mover(float mass_){
    loc = new PVector(0, height/2);
    vel = new PVector(0,0);
    accel = new PVector(0, 0);
    mass = mass_;
  }
  
  Mover(float x_, float y_, float mass_){
    loc = new PVector(x_, y_);
    vel = new PVector(0,0);
    accel = new PVector(0, 0);
    mass = mass_;
  }
  
   Mover(float mass_, float volume_){
    loc = new PVector(0, 0);
    vel = new PVector(0,0);
    accel = new PVector(0, 0);
    mass = mass_;
    volume = volume_;
  }
  
  void update(){
    loc.add(vel);
    vel.add(accel);
    vel.limit(15);
    accel.x=0;
    accel.y=0;
  }
  
  void display(){
    fill(150);
    ellipse(loc.x, loc.y, mass*10,mass*10);
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
}