class Mover{
  float x;
  float y;
  
  Mover (){
    x = width/2;
    y = height/2;
  }
  
  void display(){
    stroke(0);
    ellipse(x, y, 16,16);
  }
  
  float tx=0;
  float ty=10000;
  
  void move(){
   float n = noise(tx);
   float m = noise(ty);
   x = map(n, 0, 1, 0, width);
   y = map(m, 0, 1, 0, height);
   tx+=0.01;
   ty+=0.01;
  }
}