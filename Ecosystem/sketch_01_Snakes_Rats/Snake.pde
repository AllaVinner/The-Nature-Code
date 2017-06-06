class Snake extends Animal{
  
  float size;
  float maxSpeed;
  
  Snake(PVector loc_,
      PVector vel_,
      PVector accel_,
          float size_){
    super(loc_, vel_, accel_);
    
    size = size_;
    maxSpeed = 2;
  }
  
  void move(){
    loc.add(vel);
    vel.add(accel);
    vel.limit(maxSpeed);
  }
  
    void hit(PVector predLoc){
    if(PVector.sub(predLoc, loc).mag() < 20){
      loc.x = (float) random(width);
      loc.y = (float) random(height);
      vel.x = 0;
      vel.y = 0;
    }
  }
  
  
  void display(){
    fill(200);
    stroke(0);
    ellipse(loc.x-size, loc.y-size, size, size);
  }
}}}