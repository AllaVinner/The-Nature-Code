Mover ship;

void setup(){
  background(0);
  size(600,600);
  
  ship = new Mover(width/2, height/2, 30);
  
}

void draw(){
  background(0,0);
    
  if(keyPressed){
    if(key == 'a'){
        ship.aAccel = -0.002;
    } else if(key == 'd'){
      ship.aAccel = 0.002;
    }else if( key == 'w'){
      ship.push();
    }
  }
  ship.update();
  ship.display();
 
}