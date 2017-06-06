  class Attractor{
    
    PVector loc;
    float mass;
    
    Attractor(float x_, float y_, float mass_){
      loc = new PVector(x_,y_);
      mass = mass_;
    }
    
    void display(){
      fill(100, 200);
      stroke(0);
      ellipse(loc.x, loc.y, mass, mass);
    }
   
    PVector attract(Mover m){
      float G = 20;
      float distance = PVector.sub(loc,m.loc).mag();
      distance = constrain(distance, 5, 250);
      PVector r =  PVector.sub(loc,m.loc).normalize();
      
      return r.mult(G*mass*m.mass).div(distance*distance);
    }
    
    
  }
    