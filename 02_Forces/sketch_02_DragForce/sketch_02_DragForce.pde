Mover[] stim;
Liquid water;

PVector gravity;
PVector drag;

void setup(){
  size(700,300);
  
  gravity = new PVector(0, 0.05);
  water = new Liquid(0, 2*height/3, width, height, 2);
  
  stim = new Mover[6];
  
  for(int i=0; i< stim.length; i++){
    stim[i] = new Mover(i*width/stim.length+30, 0, i+1);
  }
  

}

void draw(){
  background(40);
  water.display();
 
 if(mousePressed){
   reset();
 }
   
 for(int i=0; i < stim.length; i++){
  if(water.inside(stim[i].loc)){
    stim[i].applyForce(water.getDragForce(stim[i].vel));
  }
  stim[i].applyForce(PVector.mult(gravity, stim[i].mass));
  stim[i].update();
  stim[i].checkEdges();
  stim[i].display(); 
 }
  
}

PVector getFriction(PVector vel){
  float N = 3;
  float my = 0.2;
  PVector copVel = vel.get();
  copVel.normalize();
  return copVel.mult(-1*N*my);
}

void reset(){
  for( int i=0; i < stim.length; i++){
    stim[i].loc.x= i*width/stim.length+30;
    stim[i].loc.y =0;
    stim[i].vel.x=0;
    stim[i].vel.y=0;
  }
}
  