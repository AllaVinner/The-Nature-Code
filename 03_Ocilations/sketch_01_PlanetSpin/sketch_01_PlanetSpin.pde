Mover[] a;
Mover sun;

PVector gravity;

void setup(){
  size(600, 600);
  sun = new Mover(width/2, height/2, 5);
  
  a = new Mover[10];
  for(int i =0; i < a.length; i++){
  float randX = (float) random(0, width);
  float randY = (float) random(0, height);
  a[i] = new Mover(randX, randY, random(10,15));
  a[i].vel.x = random(-1.5, 1.5);
  a[i].vel.y = random(-1.5, 1.5);
  }
  gravity = new PVector(0,0);
  background(0);
  
}

void draw(){
 background(0);

    for(int i =0; i < a.length; i++){
    gravity = sun.attract(a[i]);
      a[i].applyForce(gravity);
      
  a[i].update();
  a[i].display();
  }
  sun.display();
  
}