class Animal{
  
  PVector loc;
  PVector vel;
  PVector accel;
  
  float mass;
  String spicie;
  
   ArrayList<Animal>  food;
   ArrayList<Animal>  predator;
  
  Animal(float mass_, String spicie_){
    
    loc = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    
    mass = mass_;
    spicie = spicie_;
    
    food = new ArrayList<Animal>();
    predator = new ArrayList<Animal>();
  }
  
   void display(){
    switch(spicie){
      case "Fox" :
        fill(250, 150, 150);
        noStroke();
        ellipse(loc.x, loc.y, mass,mass);
        break;
      case "Rabbit" :
        fill(100);
        noStroke();
        ellipse(loc.x, loc.y, mass,mass);
        break;
        case "Carrot" :
        fill(0,200, 200);
        noStroke();
        rect(loc.x, loc.y, mass,mass);
        break;
    }
    
  }
  
   void update(){
    loc.add(vel);
    vel.add(accel);
    vel.limit(2);
    loc.x= constrain(loc.x, 0, width);
    loc.y= constrain(loc.y, 0, height);
  }
  
    void checkEdges(){
    float c = 0.5;
    if(loc.x < 0){
      vel.x = c* Math.abs(vel.x);
    }
    if(width < loc.x){
      vel.x =-c* Math.abs(vel.x);
    } 
    if(loc.y < 0){
      vel.y = c*Math.abs(vel.y);
    }
    if(height < loc.y){
      vel.y = -c*Math.abs(vel.y);
    }
  }
  
  PVector attraction(Animal prey){
    PVector tempPrey = prey.loc.get();
    float c = 0.2;
    float distance = PVector.sub(tempPrey, loc).mag();
    distance = constrain(distance, 5, 25);
    PVector r = PVector.sub(tempPrey, loc).normalize();
    return r.mult(c*mass*prey.mass*c).div(distance);
  }
    
    PVector repoltion(Animal prey){
      PVector tempPrey = prey.loc.get();
      float c = 0.2;
      float distance = PVector.sub(tempPrey, loc).mag();
      distance = constrain(distance, 5, 25);
      PVector r = PVector.sub(tempPrey, loc).normalize();
    return r.mult(-1*c*mass*prey.mass*c).div(distance*distance);
  }
    
    
  
    void applyForce(PVector force){
      accel.add(PVector.div(force,mass));
    }
  
    void ignoreForce(PVector force){
      accel.sub(PVector.div(force,mass));
    }
    
} // ens off class