Snake snake;
Rat rat;
PVector cheese;
PVector temp;

void setup(){
  size(800, 700);
  background(200);
  rat = new Rat(3);
  snake = new Snake(5);
  cheese = new PVector(0,0);
  temp = new PVector(0,0);
  snake.loc.x = 0;
  snake.loc.y = 0;
   
}

void draw(){
  background(200);
  /*
  cheese.x = mouseX;
  cheese.y = mouseY;
  
  temp = PVector.sub(cheese,rat.loc);
  temp.div(temp.mag()*temp.mag());
  temp.mult(2);
  rat.accel = temp.copy();
  
  temp = PVector.sub(snake.loc, rat.loc);
  temp.div(temp.mag()*temp.mag());
  temp.mult(-4);
  rat.accel.add(temp);
  
  
  rat.update();
  rat.maxSpeed();
  rat.display();
  
  temp = PVector.sub(rat.loc, snake.loc);
  temp.div(0.001);
  temp.mult(2);
  snake.accel = temp.copy();
  snake.hit(rat.loc);
  rat.hit(snake.loc);
  
  snake.update();
  snake.maxSpeed();
  snake.display();
 */ 
}