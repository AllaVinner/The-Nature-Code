PVector mouse;
PVector center;

void setup(){
  background(130);
  size(600,300);
  mouse= new PVector(mouseX, mouseY);
  center = new PVector(width/2, height/2);
}

void draw(){
  background(130);
  mouse.x = mouseX;
  mouse.y = mouseY;

  mouse.sub(center);
  

  mouse.mult(0.5);
  
  fill(200);
  noStroke();
  rect(0,0, mouse.mag(), 16);
  
  
  
  translate(center.x, center.y);
  stroke(255);
  line(0, 0,mouse.x,mouse.y);
  
  stroke(0);
  mouse.normalize().mult(40);
  line(0, 0,mouse.x,mouse.y);
  
 
  
}