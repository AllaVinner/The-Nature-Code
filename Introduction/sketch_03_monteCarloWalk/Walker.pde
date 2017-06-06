import java.util.Random;


class Walker{
  float x;
  float y;
  
  Walker(){
    x = width/2;
    y = height/2;
  }
  
  void display(){
    stroke(0);
    point(x,y);
  }
  
  void step(){
    float stepSize = (float) random(10) *monteCarlo();
    float stepX = random(-stepSize, stepSize);
    float stepY = random(-stepSize, stepSize);  
    println(y);
    println(x);
      x += stepX;
      y += stepY;
  }
  
  float monteCarlo(){
    while(true){
      float  r1 = (float) random(0,1);
      float prob = r1;
      float r2 = (float) random(0,1);
      if(prob > r2){
        return r1;
      }
    }
}  
}