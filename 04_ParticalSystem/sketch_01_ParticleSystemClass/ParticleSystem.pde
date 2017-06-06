class ParticleSystem{
    
    ArrayList <Particle> ps;
    
    ParticleSystem(){
      
      ps = new ArrayList<Particle>();
      float total = 10;
        for(int i=0; i < total; i++){
          ps.add(new Particle(random(width), random(height)));
        }
    }
    
    void run(){
       for(int i= ps.size()-1; i >=0; i--){
           ps.get(i).run();
         if(ps.get(i).isDead()){
           ps.remove(ps.get(i));
         }
        
       }
    }
  }