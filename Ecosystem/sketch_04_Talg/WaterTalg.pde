class WaterTalg{
  
  ParticleSystem water;
  TalgSystem membran; 
  
  WaterTalg(){
    
    water = new ParticleSystem();
    membran = new TalgSystem();
    
  }
  
  void run(){
  membran.run();
  water.run();
}
  
}