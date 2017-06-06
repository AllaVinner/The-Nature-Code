class Pendelum{
  
  PVector ploc;
  PVector loc;
  PVector vel;
  PVector accel;
  
  float radius;
  float angle;
  float aVel;
  float aAccel;
  
  float mass;
  
  Pendelum(float startAngle, float radius_){
    angle = startAngle;
    radius = radius_;
    
    ploc = new PVector(radius*sin(angle), radius*cos(angle));
    loc = new PVector(width/2,height/4);
    vel = new PVector(0,0);
    accel = new PVector(0,0); 
    aVel = 0;
    aAccel=0;
    
    mass =3;
    
  }
  
  void display(){
    
    pushMatrix();
    translate(loc.x, loc.y);
    line(0,0, radius*sin(angle), radius*cos(angle));
   // ellipse(radius*sin(angle), radius*cos(angle), 16,16);
    
    ellipse(ploc.x, ploc.y, 16,16);
    popMatrix();
  }
  
  void update(){
    ploc.add(vel);
    vel.add(accel);
    println("ACCEL: " + accel.x +"   " + accel.y);
    accel.mult(0);
    
    angle = atan(ploc.x / ploc.y);
    aVel += aAccel;
  }
  
  void applyForce(Force f){
    switch(f.type){
      case " ":
        accel.add( f.force.get() );
        accel.div(mass);
        break;
     case "Normal" :
       accel.add( f.getForce(this) );
       accel.div(mass);
    }
  }
}