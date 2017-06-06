class Gas{
  
  float density;
  
  Gas(float density_){
    
    density = density_;
  }
 
  PVector getLiftForce(PVector g, float volume){    
    return PVector.mult(g, -1*volume * density);
  }
  
  void display(){
    fill(100,100,200);
    rect(0,0, width, height);
  }
  
}
  