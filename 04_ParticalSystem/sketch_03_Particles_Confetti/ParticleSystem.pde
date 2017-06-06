class ParticleSystem{
  
  ArrayList<Particle> particles;
  
  PVector loc;
  
  ParticleSystem(){
    particles = new ArrayList<Particle>();
    
    loc = new PVector(width/2, height/2);
    
    float total = 30;
    
    for(int i=0; i < total; i++){
      particles.add( new Confetti(loc.x, loc.y));
    }  
    
  }
  
  void run(){
    for(int i= particles.size() -1; i >= 0; i--){
      particles.get(i).update();
      particles.get(i).display();
      
      if(particles.get(i).isDead()){
        particles.remove(i);
        float r = random(1);
          if( r < (float) 1/2){             // Viktig konstig grej
            particles.add( new Confetti(loc.x, loc.y));
          }else{
            particles.add( new Particle(loc.x, loc.y));
          }
      }
    }
  }
  
  void addParticle(Particle p){
    particles.add(p);
  }
  
  void applyForce(PVector v){
    for(Particle p : particles){
      p.applyForce(v);
    }
  }
  
  
}