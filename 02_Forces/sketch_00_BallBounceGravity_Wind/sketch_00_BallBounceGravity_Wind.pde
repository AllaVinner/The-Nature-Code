Mover[] m;
Mover m2;
PVector wind;
PVector gravity;
PVector zero;

float windT=0;

Gas air;

void setup(){
  size(700,500);
  
  m = new Mover [20];
  wind = new PVector(0.05,0);
  gravity = new PVector(0,0.4);
  zero = new PVector(0,0);

  for(int i=0; i < m.length; i++){
    m[i] = new Mover(i);
    m[i].applyForce(PVector.mult(gravity, m[i].mass));
  }

}

void draw(){
  background(0);
  
  boolean pressed= false;
  if(mousePressed){
      for(int i=0; i < m.length; i++){ 
        m[i].applyForce(wind);
        pressed = true;
      }
  }
  
  for(int i=0; i < m.length; i++){
    m[i].update();
    m[i].checkEdges();
    m[i].display();
  }
  
  if(pressed){
    for(int i=0; i < m.length; i++){ 
        m[i].ignoreForce(wind);
      }
  }
} 