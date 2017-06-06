class Mover{
  PVector loc;
  PVector vel;
  PVector accel;
  
  Mover(){
    loc = new PVector(0, 10);
    vel = new PVector(0.4,0);
    accel = new PVector(0, 0.2);
  }
  
  void update(){
    loc.add(vel);
    vel.add(accel);
  }
  
  void display(){
    fill(255);
    rect(loc.x, loc.y, 16,16);
  }
  
  void checkEdges(){

    if(! (0 < loc.x && loc.x < width)){
      vel.x *= -0.8;
      loc.x += vel.x;
    }
    if(! (0 < loc.y && loc.y < height-66)){
      vel.y *= -0.8;
      loc.y += vel.y;
    }
  }
}