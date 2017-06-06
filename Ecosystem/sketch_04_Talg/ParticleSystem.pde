
class ParticleSystem{
  
  ArrayList<Particle> particles;
  PVector loc;
  
  
    ParticleSystem(){
    particles = new ArrayList<Particle>();
    
    loc = new PVector(width/2, 0);
    float total = 1000;
    for(int i =0; i < total; i++){
      particles.add( new Particle(random(0, width), random(0, height)));
    }
  }
  
    void run(){

    for(int i= particles.size() -1; i >= 0; i--){
      particles.get(i).run();
    }
  }
  
  void addParticle(Particle p){
    particles.add(p);
  }  

  
  
}