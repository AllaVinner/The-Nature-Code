class Particle{
  
  PVector loc;
  PVector vel;
  PVector accel;
  
  float lifeSpan;
  
  float mass =1;
  
  float startX;
  float startY;

  Particle(float x_, float y_){
    loc = new PVector(x_, y_);
    vel = new PVector(random(-0.2, 0.2), random(0, 0.5));
    accel = new PVector(0, 0);
    
    startX = x_;
    startY = y_;
    
    lifeSpan = 255;
  }
  
    
  void run(){
    update();
    display();
    
  }
  
  void update(){
    vel.add(accel);
    loc.add(vel);
    accel.mult(0);
    
    lifeSpan -= 1;
      

  }
  
  void display(){
    fill(0, 0, 255, lifeSpan);
    float theta = map(loc.x, 0, width, 0 , TWO_PI);
    noStroke();
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    ellipse(0, 0, 10, 10);
    popMatrix();
  }
  
   void applyForce(Force f){
    accel.add(f.vForce);
  }
  
  
  boolean isDead(){
    if(lifeSpan < 0){
      return true;
    }else{
       return false;
    }
   }
  
  void reset(){
    loc.x = startX;
    loc.y = startY;
    vel.mult(0);

  }
}