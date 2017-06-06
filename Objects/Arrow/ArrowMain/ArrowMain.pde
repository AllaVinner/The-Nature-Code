Arrow a;

void setup(){
  size(300,300);
  background(255);
  
  a = new Arrow(width/2, height/2, 50, PI/3);
}

void draw(){
    background(255);
    a.display();
}