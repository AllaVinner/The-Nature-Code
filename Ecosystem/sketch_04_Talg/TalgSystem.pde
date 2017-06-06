class TalgSystem{
  
  ArrayList<Talg> membran;
  PVector loc;
  
  
    TalgSystem(){
    membran = new ArrayList<Talg>();
    
    loc = new PVector(width/2, 0);
    float total = 10;
    for(int i =0; i < total; i++){
      membran.add( new Talg());
    }
  }
  
    void run(){
    for(int i= membran.size() -1; i >= 0; i--){
      membran.get(i).display();
    }
  }
  
  void addParticle(Talg t){
    membran.add(t);
  }  

  
  
}