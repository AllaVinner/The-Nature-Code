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
    vel = new PVector(random(-1, 1), random(-2, 0));
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
    
    lifeSpan -= 2;
      

  }
  
  void display(){
    fill(255, lifeSpan);
    float theta = map(loc.x, 0, width, 0 , TWO_PI);
    noStroke();
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    ellipse(0, 0, 15, 15);
    popMatrix();
  }
  
   void applyForce(PVector v){
    accel.add(PVector.div(v,mass));
  }
  
    void ignoreForce(PVector v){
    accel.sub(PVector.div(v,mass));
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