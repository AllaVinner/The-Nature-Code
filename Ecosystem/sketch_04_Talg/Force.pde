class Force{
  
  PVector vForce;
  
  float mag;
  float angle;
  
  String type;
  
  Force(PVector vForce_){
    vForce = vForce_;
    
    mag = vForce.mag();
    angle = atan2(vForce.y, vForce.x);
  }
  
  Force(float mag_, float angle_){
    mag = mag_;
    angle = angle_;
    
    vForce = new PVector(mag * cos(angle) ,
                         mag * -sin(angle) ); // - because the orientation of the canvas
   
  }
  
  
}
  
  