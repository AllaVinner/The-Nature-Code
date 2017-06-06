class Particle{
  
  PVector loc;
  PVector vel;
  PVector accel;
  
  float mass =1;
  
  float startX;
  float startY;
  float radius;
  
  PVector t;
  PVector noiseT;
  

  Particle(float x_, float y_){
    loc = new PVector(x_, y_);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    
    startX = x_;
    startY = y_;
    radius = 3;
    
    t = new PVector(random(0,1000), random(0,1000));
    noiseT = new PVector(noise(t.x)- 0.5, noise(t.y)-0.5);
    vel.add(noiseT);
  }
  
    
  void run(){
    update();
    display();
    checkEdges();
    
  }
  
  void update(){
  
    loc.add(noiseT);
    vel.add(accel);
    loc.add(vel);
    accel.mult(0);
    
    noiseT.set(noise(t.x)- 0.5, noise(t.y)-0.5);
    t.x += 0.1;
    t.y += 0.1;

  }
  
  void display(){
    fill(0, 0, 255, 150);
    float theta = map(loc.x, 0, width, 0 , TWO_PI);
    noStroke();
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    ellipse(0, 0, radius, radius);
    popMatrix();
  }
  
   void applyForce(Force f){
    accel.add(f.vForce);
  }
 
  
  void reset(){
    loc.x = startX;
    loc.y = startY;
    vel.mult(0);

  }
  
  void checkEdges(){
    float c = 1;
    if(loc.x < 0){
      vel.x = c* Math.abs(vel.x);
    }
    if(width < loc.x){
      vel.x =-c* Math.abs(vel.x);
    }
    
    if(loc.y < 0){
      vel.y = c*Math.abs(vel.y);
    }
    if(height < loc.y){
      vel.y = -c*Math.abs(vel.y);
    }
  }
}