class Arrow{
  
  PVector loc;
  PVector arrow;
  float mag;
  float angle;
  
  Arrow(float x_, float y_, PVector arrow_){
    loc = new PVector(x_, y_);
    arrow = arrow_;
    mag = arrow.mag();
    angle = atan2(arrow.x, arrow.y);
  }
  
   Arrow(float x_, float y_, float mag_, float angle_){
    loc = new PVector(x_, y_);
    mag = mag_;
    angle = angle_;
    
    arrow = new PVector(mag_*cos(angle), -1*mag_*sin(angle));
  }
  
  
  void display(){
    
    pushMatrix();
    translate(loc.x, loc.y);
    line(0,0, arrow.x, arrow.y);
    fill(100);
    ellipse(arrow.x, arrow.y, 5,5);
    popMatrix();
  }
    
    
}