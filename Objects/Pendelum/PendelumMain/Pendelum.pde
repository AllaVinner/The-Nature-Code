class Pendelum{
  
  PVector loc;
  float radius;
  float startAngle;
  Mover ball;
  float distance;
  
  
  Pendelum(float x_, float y_, float radius_, float startAngle_){
    
    loc = new PVector(x_, y_);
    radius = radius_;
    startAngle = startAngle_;
    
    ball = new Mover(radius * sin(startAngle), radius * cos(startAngle), 3, 16);
    distance = radius;
  }
  
  void display(){
    pushMatrix();
    translate(loc.x, loc.y);
    rect(-5, -5, 10 ,10);
    line(0,0 , ball.loc.x, ball.loc.y);
    ball.display();
    popMatrix();
  }
  
  void update(){
    distance = (float) Math.pow( Math.pow((double) ball.loc.x, 2) + Math.pow( (double) ball.loc.y , 2) , 1/2 );
    distance = (float)( Math.pow( (double) (ball.loc.x*ball.loc.x + ball.loc.y * ball.loc.y), 0.5));
    ball.update();
    
  }
}
    
    