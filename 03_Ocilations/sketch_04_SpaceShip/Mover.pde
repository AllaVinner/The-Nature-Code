class Mover{
  PVector loc;
  PVector vel;
  PVector accel;
  
  float mass;
  float volume;
  
    
  float angle;
  float aVel;
  float aAccel;
  
  float cellWidth =15;
  float cellHeight = 10;
  
  PVector direction;

  Mover(float x_, float y_, float mass_){
    loc = new PVector(x_, y_);
    vel = new PVector(0,0);
    accel = new PVector(0, 0);
    mass = mass_;
    
    angle =0;
    aVel=0;
    aAccel =0;
    
    direction = new PVector(0,1);
  }
  
  void update(){
    loc.add(vel);
    vel.add(accel);
    vel.limit(15);
    loc.x = constrain(loc.x, 0, width);
    loc.y = constrain(loc.y, 0, height);
         
    angle += aVel;
    aVel += aAccel;
    aVel = constrain(aVel, -0.05, 0.05);

  direction.x = sin(angle);
  direction.y = -cos(angle);
  
  accel.x =0;
  accel.y=0;
  }
  
  void display(){
    fill(200);
    pushMatrix();
    translate(loc.x+cellWidth/2,loc.y+cellHeight/2);
    rotate(angle);
    rect(-cellWidth/2, -cellHeight/2, cellWidth, cellHeight);
    ellipse(0, -20, 10, 10);
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
  
  void push(){
    accel.x = direction.x*0.1;
    accel.y = direction.y*0.1;
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