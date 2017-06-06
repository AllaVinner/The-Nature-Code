class Arrow{
  
  PVector loc;
  PVector arrow;
  float mag;
  float angle;
  String s;
  
  Arrow(float x_, float y_, PVector arrow_, String s_){
    loc = new PVector(x_, y_);
    arrow = arrow_;
    mag = arrow.mag();
    angle = atan2(arrow.x, arrow.y);
    s=s_;
  }
  
   Arrow(float x_, float y_, float mag_, float angle_, String s_){
    loc = new PVector(x_, y_);
    mag = mag_;
    angle = angle_;
    s = s_;
    
    arrow = new PVector(mag_*cos(angle), -1*mag_*sin(angle));
  }
  
  
  void display(){
    switch(s){
      case "BLUE" :
      stroke(0,0,200);
      fill(0,0,200);
      break;
      case "GREEN" :
      stroke(0,200,0);
      fill(0,200,0);
      break;
      case "RED" :
      stroke(200,0,0);
      fill(200,0,0);
      break;
    }
      
    
    pushMatrix();
    translate(loc.x, loc.y);
    line(0,0, arrow.x, arrow.y);
    ellipse(arrow.x, arrow.y, 5,5);
    popMatrix();
  }
    
    
}