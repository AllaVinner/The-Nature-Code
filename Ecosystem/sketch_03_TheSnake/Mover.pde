class Mover{
  
  PVector loc;
  PVector vel;
  PVector accel;
  
  float angle;
  float aVel;
  float aAccel;
  
  float mass;
  float volume;
  
  float startX;
  float startY;

  float control = 100;
  Mover(float x_, float y_, float mass_, float volume_){
    loc = new PVector(x_, y_);
    vel = new PVector(0,0);
    accel = new PVector(0, 0);
    
    
    mass = mass_;
    volume = volume_;
    
    startX = x_;
    startY = y_;
  }
  
  void update(){
    accel.mult(control);
    loc.add(vel);
    vel.add(accel);
    vel.limit(30);
    accel.mult(0);
    loc.x = constrain(loc.x, 0, width);
    loc.y = constrain(loc.y, 0, height);
    
    angle += aVel;
    aVel += aAccel;
    aVel = constrain(aVel,-15,15);
    aAccel =0;
  }
  
  void display(){
    fill(200);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    rect(-volume/2, -volume/2, volume, volume);
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
  
  /*
   void applyForce(Force f){
    accel.add(PVector.div(f.vForce,mass));
  }
  
    void ignoreForce(Force f){
    accel.sub(PVector.div(f.vForce,mass));
  }
  */
  
  void reset(){
    loc.x = startX;
    loc.y = startY;
    vel.mult(0);
    
    angle =0;
    aVel =0;
  }
    
  
  PVector attract(Mover m){
    float G = 10;
    float distance = PVector.sub(loc,m.loc).mag();
    distance = constrain(distance, 5, 25);
    PVector r =  PVector.sub(loc,m.loc).normalize();
    
    return r.mult(G*mass*m.mass).div(distance*distance);
  }
}