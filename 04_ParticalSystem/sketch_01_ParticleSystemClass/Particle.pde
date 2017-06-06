class Particle{
  
  PVector loc;
  PVector vel;
  PVector accel;
  
  float lifeSpan;
  
  float startX;
  float startY;

  Particle(float x_, float y_){
    loc = new PVector(x_, y_);
    vel = new PVector(0,0);
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
    fill(200, lifeSpan);
    noStroke();
    pushMatrix();
    translate(loc.x, loc.y);
    ellipse(0, 0, 35, 35);
    popMatrix();
  }
  
  /*
   void applyForce(Force f){
    accel.add(PVector.div(f.vForce,mass));
  }
  
    void ignoreForce(Force f){
    accel.sub(PVector.div(f.vForce,mass));
  }
  */
  
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