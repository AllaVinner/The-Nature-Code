Mover m1;
Mover m2;
Mover m3;

Mover[] m4;
  PVector gravity;

void setup(){
  size(600,600);
  background(80);
  
  m1 = new Mover(100,100, 4, 20);
  m2 = new Mover(100,150, 4, 15);
    m2.accel.x = 0.0002;
  m3 = new Mover(100,200, 4, 20);
    m3.aAccel = 0.02;

  m4 = new Mover[2];
  for(int i=0; i < m4.length;  i++){
    m4[i] =  new Mover(-1*i*(200-width)+100,250, 4, 20);
  }
 
  
}

void draw(){
  background(80);
  
  m1.update();
  m1.display();
    
  m2.accel.x = 0.02;
  m2.update();
    if(m2.loc.x > width -20){
      m2.reset();
    }
  m2.display();
  
  m3.aAccel = 0.002;
  m3.update();
    if(m3.aVel > 5){
      m3.reset();
    }
  m3.display();
  
  gravity = m4[1].attract(m4[0]);
  m4[0].applyForce(gravity);
  gravity = m4[0].attract(m4[1]);
  m4[1].applyForce(gravity);
  m4[0].update();
  m4[1].update();
  m4[0].display();
  m4[1].display();
}