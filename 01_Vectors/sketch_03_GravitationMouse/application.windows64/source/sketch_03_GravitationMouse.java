import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_03_GravitationMouse extends PApplet {

Mover blob;
PVector mouse;
PVector a;

public void setup(){
  background(100);
  
  blob = new Mover();
  mouse = new PVector(mouseX, mouseY);
  a = new PVector(0,0);
}

public void draw(){
//  background(100);
   mouse.x = mouseX;
   mouse.y = mouseY;
   blob.update();
   a = PVector.sub(mouse, blob.loc);
   a.div(a.mag()*a.mag());
   a.mult(1);
   
   blob.setAccel(a);
   
   stroke(255);
   fill(10);
   ellipse(blob.loc.x, blob.loc.y, 16,16);
}
class Mover{
  PVector loc;
  PVector vel;
  PVector accel;
  
  Mover(){
    loc = new PVector(width/2, height/2);
    vel = new PVector(0,0);
    accel = new PVector(0, 0);
  }
  
  public void update(){
    loc.add(vel);
    vel.add(accel);
    vel.limit(10);
  }
  
  public void display(){
    fill(255);
    rect(loc.x, loc.y, 16,16);
  }
  
  public void checkEdges(){
    if(! (0 < loc.x && loc.x < width)){
      vel.x *= -1;
    }
    if(! (0 < loc.y && loc.y < height)){
      vel.y *= -1;
    }
  }
  
  public void setAccel(PVector a){
    accel.x = a.x;
    accel.y = a.y;
  }
}
  public void settings() {  size(700,450); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_03_GravitationMouse" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
