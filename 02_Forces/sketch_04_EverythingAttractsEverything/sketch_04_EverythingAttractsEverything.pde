Mover[] a;
Mover sun;

PVector gravity;

void setup(){
  size(600, 600);
  sun = new Mover(width/2, height/2, 50);
  
  a = new Mover[45];
  for(int i =0; i < a.length; i++){
  float randX = (float) random(0, width);
  float randY = (float) random(0, height);
  a[i] = new Mover(randX, randY, random(1,2));
  a[i].vel.x = random(-1.5, 1.5);
  a[i].vel.y = random(-1.5, 1.5);
  }
  gravity = new PVector(0,0);
  background(0);
  
}

void draw(){
 background(0);
  
  for(int i=0; i< a.length; i++){
    for(int j=0; j<a.length; j++){
      if(i != j){  
        gravity = a[j].attract(a[i]);
        a[i].applyForce(gravity);
      }
    }
  }
    for(int i =0; i < a.length; i++){
    // gravity = sun.attract(a[i]);
     // a[i].applyForce(gravity);
    //  gravity = a[i].attract(sun);
    //  sun.applyForce(gravity);
      
  a[i].update();
  a[i].display();
  }
//  sun.update();
//  sun.display();
  
}