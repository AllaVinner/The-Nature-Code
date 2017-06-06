
ParticleSystem ps;
PVector gravity;

void setup(){
  background(0);
  size(400,400);
  
  gravity = new PVector(0, 0.002);
  ps = new ParticleSystem();
}

void draw(){
  background(0);
  ps.applyForce(gravity);
  ps.run();
}
  