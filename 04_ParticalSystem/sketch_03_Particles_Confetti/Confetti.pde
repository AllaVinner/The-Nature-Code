class Confetti extends Particle{
  
   int red;
   int green;
   int blue;
  
  Confetti(float x_, float y_){
    super(x_, y_);
    
    red =  (int) random(255);
    green = (int) random(255);
    blue = (int) random(255);
    
    
  }
  
   void display(){
    fill(red, green, blue, lifeSpan);
    float theta = map(loc.x,0, width, 0 , 2*TWO_PI);
    noStroke();
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    rect(0, 0, 15, 15);
    popMatrix();
  }
  
  
  
  
}