class Rat extends Animal{
  
  float size;
  float maxSpeed;
  
  Rat(float size_){
    size = size_;
    maxSpeed = 3;
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
    fill(100);
    stroke(0);
    ellipse(loc.x-size, loc.y-size, size, size);
}
  