class Talg{
   
  PVector loc;
  PVector vel;
  PVector accel;
  
  float angle;
  float aVel;
  float aAccel;
  
  float mass;
  float radius;
  
  Mover hydrofile;
  Mover hydrofobe;
  
  Talg(){
    radius = 10;
    angle = map(random(1), 0 , 1, 0 , PI);
    loc = new PVector(random(0,width), random(0,height));
    vel = new PVector(0,0);
    accel = new PVector(0, 0);
    
    hydrofile = new Mover(loc.x + radius*cos(angle), loc.y - radius*sin(angle), 10, 6);
    hydrofobe = new Mover(loc.x - radius*cos(angle), loc.y + radius*sin(angle), 5 , 3);
  }
  
  void display(){
    pushMatrix();
    translate(loc.x, loc.y);
    stroke(200);
    line(-radius*cos(angle), radius*sin(angle), radius*cos(angle), -radius*sin(angle));
    popMatrix();
    
    fill(0,0,200);
    ellipse(hydrofile.loc.x, hydrofile.loc.y, hydrofile.volume, hydrofile.volume);
    fill(200,200,0);
    ellipse(hydrofobe.loc.x, hydrofobe.loc.y, hydrofobe.volume, hydrofobe.volume);
    
  
  }
  
  void hitOfParticle(Particle p){
   
   if(  distance(p.loc.x, p.loc.y, hydrofile.loc.x, hydrofile.loc.y) < 20){
     
   }
  }
  
  void applyForce(Force f){
    accel.add(f.vForce);
  }
  
  float distance(float x1, float y1, float x2, float y2){
    return (float) Math.pow( Math.pow(x1-x2, 2) + Math.pow(y1-y2, 2) , 0.5);
  }
  
  
}
  
    
    
    