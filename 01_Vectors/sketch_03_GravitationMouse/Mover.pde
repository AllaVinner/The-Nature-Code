class Mover{
  PVector loc;
  PVector vel;
  PVector accel;

  
  Mover(){
    loc = new PVector(width/2, height/2);
    vel = new PVector(0,0);
    accel = new PVector(0, 0);
 
  }
  
  void update(){
    loc.add(vel);
    vel.add(accel);
    vel.limit(10);
    


    
  }
  
  void display(){
    fill(255);
    rect(loc.x, loc.y, 16,16);
  }
  
  void checkEdges(){
    if(! (0 < loc.x && loc.x < width)){
      vel.x *= -1;
    }
    if(! (0 < loc.y && loc.y < height)){
      vel.y *= -1;
    }
  }
  
  void setAccel(PVector a){
    accel.x = a.x;
    accel.y = a.y;
  }
}