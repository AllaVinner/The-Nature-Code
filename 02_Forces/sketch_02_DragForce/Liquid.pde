class Liquid{
  float startX;
  float startY;
  float endX;
  float endY;
  
  float dens;
  
  Liquid(float startX_, float startY_, float endX_, float endY_, float dens_){
    startX = startX_;
    startY = startY_;
    endX = endX_;
    endY = endY_; 
    
    dens = dens_;
}

void display(){
  fill(0,0,150);
  rect(startX, startY, endX, endY);
}

PVector getDragForce(PVector vel){
  PVector temp = vel.get();
  float C = 0.2;
  float mag = temp.mag();
  temp.normalize();
  return temp.mult(-1*mag*mag*C*dens); 
  }
  
  boolean inside(PVector loc){
    if(startX < loc.x && loc.x < endX && startY < loc.y && loc.y < endY){
      return true;
    } else{
      return false;
    }
  } 
}