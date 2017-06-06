

Mover m;
Oscillator osc;

void setup(){
  background(230);
  size(600, 700);
  
  
  m = new Mover( 20, height/2, 3, 20);
  osc = new Oscillator(m.loc.x, m.loc.y, PI/2, 50, 0, 15);
  m.vel.x = 2;
  m.vel.y =0.5;
}

void draw(){
 // background(230);
  
 osc.origo.x = m.loc.x;
 osc.origo.y = m.loc.y;
 m.update();
 osc.update();
 // m.display();
  osc.display();
}