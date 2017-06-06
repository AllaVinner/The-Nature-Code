class Rotator{
  
  float cellWidth;
  float cellHeight;
  float radius;
  
  float angle;
  float aVel;
  float aAccel;
  
  Rotator(){
    cellHeight = 16;
    cellWidth = 16;
    radius = 30;
    angle =0;
    aVel=0;
    aAccel = 0.001;

  }
  
  void display(){
    fill(200);
    line(-radius, 0, radius , 0);
    ellipse(-radius,0, cellWidth, cellHeight);
    ellipse(radius, 0, cellWidth, cellHeight); 
  }
  
  void update(){
    angle += aVel;
    aVel += aAccel;
  }
}  