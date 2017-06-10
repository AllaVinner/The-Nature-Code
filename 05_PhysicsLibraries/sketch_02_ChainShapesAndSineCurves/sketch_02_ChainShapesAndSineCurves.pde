/*
*********************************
*      ChainShape
      Static shape
*********************************
*/

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

Box2DProcessing box2d;
  Slope s;
 ArrayList<Box> boxes;
 
void setup(){
  size(1000,500);
  background(140,180, 230);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-20);
  
  s = new Slope();
  boxes = new ArrayList<Box>();
}

void draw(){
  background(140,180,230);
  box2d.step();
  if(mousePressed) boxes.add(new Box());  
  for(Box b : boxes) b.display();
  s.display();
}