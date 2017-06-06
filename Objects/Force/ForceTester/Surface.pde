class Surface{
  
  float startX;
  float startY;
  float endX;
  float endY;
  
  PVector tilt;
  PVector norm;
  
  
  Surface(float startX_, float startY_, float endX_, float endY_){
    startX = startX_;
    startY = startY_;
    endX = endX_;
    endY = endY_;
    
    tilt = new PVector (endX - startX, endY - startY);
   norm = new PVector(endY - startY,-1*(endX - startX) );
   norm.normalize();
    
  }
  
  void display(){
    fill(50);
    
    line(startX, startY, endX, endY);
    
  }
  
  boolean isInside(Mover m){
    
    PVector a = new PVector(m.loc.x - startX, m.loc.y - startY);
    float mult = PVector.dot(tilt, a);
    mult = mult/tilt.mag();
    mult = mult/tilt.mag();
    PVector projection = PVector.mult(tilt, mult);
    PVector compliment = PVector.sub(a, projection);
    
    if(compliment.mag() < m.volume/2){
      return true;
    }else{
      return false;
    }
  }
  
}
    