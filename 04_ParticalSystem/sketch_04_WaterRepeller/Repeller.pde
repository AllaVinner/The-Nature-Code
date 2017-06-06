class Repeller{
  
  PVector loc;
  
  Repeller(float x_, float y_){
    loc = new PVector(x_,y_);
  }
  
  void display(){
    fill(200, 200);
    stroke(0);
    ellipse(loc.x, loc.y, 40, 40);
  }
 
  PVector repell(Particle p){
    float G = 50;
    float distance = PVector.sub(loc,p.loc).mag();
    distance = constrain(distance, 5, 250);
    PVector r =  PVector.sub(loc,p.loc).normalize();
    
    return r.mult(-1*G).div(distance*distance);
  }
  
  
}