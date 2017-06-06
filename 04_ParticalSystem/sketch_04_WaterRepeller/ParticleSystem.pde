class ParticleSystem{
  
  ArrayList<Particle> particles;
  Force gravity;
  Repeller repeller;
  Force repellForce;
  
  PVector loc;
  
  ParticleSystem(){
    particles = new ArrayList<Particle>();
    
    loc = new PVector(width/2, 0);
    gravity = new Force(0.02 , - PI/2);
    repeller = new Repeller(width/2, height -200);
    repellForce = new Force(0,0);
  }
  
  void run(){
    
  particles.add( new Particle(random(loc.x-50, loc.x+50), loc.y));
    for(int i= particles.size() -1; i >= 0; i--){
      particles.get(i).applyForce(gravity);
      
      repellForce.vForce = repeller.repell(particles.get(i));
      particles.get(i).applyForce(repellForce);
      
      particles.get(i).update();
      particles.get(i).display();
     
      
      if(particles.get(i).isDead()){
            particles.remove(i);
            particles.add( new Particle(loc.x, loc.y));
      }
    }
    repeller.display();
 
  }
  
  void addParticle(Particle p){
    particles.add(p);
  }  
  
    ParticleSystem(int p){
    particles = new ArrayList<Particle>();
    
    loc = new PVector(width/2, 0);
    float total = 2;
    for(int i =0; i < total; i++){
      particles.add( new Particle(random(loc.x-50, loc.x+50), loc.y));
    }
  }
  
    void runStatic(){

    for(int i= particles.size() -1; i >= 0; i--){
      particles.get(i).update();
      particles.get(i).display();
      
      if(particles.get(i).isDead()){
        particles.remove(i);
            particles.add( new Particle(loc.x, loc.y));
      }
    }
  }
  
  
}