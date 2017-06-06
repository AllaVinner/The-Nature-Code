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
  
  void setNormalForce(Mover m){
    
    PVector totAccel = m.accel.copy();
    vForce.normalize();
    
    float normalMag = PVector.dot(vForce, totAccel);
    
    if(normalMag < 0){
    vForce.mult(-1*normalMag*m.mass);
      } else{
        vForce.mult(0);
      }
      
      
      
      PVector totVel = m.vel.copy();
      PVector velNormal = vForce.copy();
      velNormal.normalize();
      
      normalMag = PVector.dot(velNormal, totVel);
      
      if(normalMag < 0){
      velNormal.mult(-1*normalMag*m.mass);
      } else{
        velNormal.mult(0);
      }
        vForce.add(velNormal);
      

  }

  
}
  
  