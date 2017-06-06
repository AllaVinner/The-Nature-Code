ParticleSystem ps;


void setup(){
  size(400, 500);
  background(0);
  
  ps = new ParticleSystem();
}

void draw(){
  background(0);
  ps.run();
}