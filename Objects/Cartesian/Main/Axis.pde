class Axis{
  //
  PVector nVector;
  
  float angle;
  float mag;
  
  Axis(PVector axis_){
    nVector =axis_;
    nVector.normalize();
    mag = nVector.mag();
    angle = atan2(nVector.x, nVector.y);
  }
  
   Axis(float mag_, float angle_){
    loc = new PVector(x_, y_);
    mag = mag_;
    angle = angle_;
    
    arrow = new PVector(mag_*cos(angle), -1*mag_*sin(angle));
  }