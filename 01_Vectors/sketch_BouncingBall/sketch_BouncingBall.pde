PVector loc;
PVector vel;

void setup(){
  size(700,400);
  background(130);
  
  loc = new PVector(width/2, height/2);
  vel = new PVector(2.5, 5);
 
 }
 
 void draw(){
       background(130);
    
     loc.add(vel);
    if(!(0 < loc.x && loc.x < width)){
      vel.x*= -1;
    }
    if(!(0 < loc.y && loc.y < height)){
      vel.y *= -1;
    }
    stroke(255);
    fill(175);
    ellipse(loc.x, loc.y, 16,16);

 }
 


  