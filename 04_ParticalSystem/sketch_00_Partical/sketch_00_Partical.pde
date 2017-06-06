ArrayList <Particle> ps;

void setup() {
  size(640,360);
  ps = new ArrayList<Particle>();
  float total = 10;
  for(int i=0; i < total; i++){
    ps.add(new Particle(random(width), random(height)));
  }

}
 
void draw() {
  
  background(255);
  
  for(Particle p : ps){
  p.run();
  }
}