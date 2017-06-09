/*
**********************************
* ITRODUCTION TO BOX2D
*
**********************************
*/

/*

1. World
    -  Manages the physics simulation.
    It knows everything about the overall coordinate space and also stores lists of every element in the world (see 2-4 below).
    
2. Body: 
    - Serves as the primary element in the Box2D world. 
   It has a location. It has a velocity.
   
3. Shape:
    - Keeps track of all the necessary collision geometry attached to a body.
    
4.   Fixture:
    - Attaches a shape to a body and sets properties such as density, friction, and restitution.
    
5. Joint:
    - Acts as a connection between two bodies (or between one body and the world itself).
*/

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

Box2DProcessing box2d;     // NOT AS IN THE BOOK!!!!




void setup() {
  size(500,500);
  background(50);
  box2d = new Box2DProcessing(this);     
  box2d.createWorld();      // Initializes a Box2D world with default settings
  box2d.setGravity(0,-10);
  
  Vec2 wCircle = new Vec2(-10,5);
  Vec2 pCircle = box2d.coordWorldToPixels(wCircle);
  
  ellipse(pCircle.x, pCircle.y, 15,15);
  
   BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(width/2,height/2));
 
      Body body = box2d.createBody(bd);
     
    PolygonShape ps = new PolygonShape();
    float w = box2d.scalarPixelsToWorld(150);
    float h = box2d.scalarPixelsToWorld(100);
    ps.setAsBox(w, h);
     
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    
    body.createFixture(fd);
  
}

/*
    *** Translation function in Box2D
    W --> P :       coordWorldToPixels(arg)
                      - arg == Vec2
                      - arg == float, float
    P --> W :       coordPixelsToWorld(arg)
                      - arg == Vec2
                      - arg == float, float
    Scale a dimension
                    scalarPixelsToWorld( float )
                    scalarWorldToPixels( float)
    ***************************
*/

/* ****************************************
    *** Building a body
    
     1. *Define a body*
        BodyDef bd = new BodyDef();
        
     2. *Configurate the body definition*
        // Many attributes of the body will be defined here. For example starting poito
        Vec2 center = box2d.coordPixlesToWorld(width/2, height/"
        bd.position.set(center);
        
        // Also define what body type the body will have
        // Dynamic (moving), Static (surface), Kinematic don't collide with static bosies, 
        
     3. Create the body
     
     Body body = box2d.createBody(bd);
     
     4. Set any special conditions for this instance. 
         body.setLinearVelocity(new Vec2(0,3));
     **************************************************************    
     */
     
/* **********************************************************
              CREATE SHAPE
              
  1. Define a shape
      PolygonShape ps = new PolygonShape();
      ps.setAsBox( coordPixelsToWorld(140),
                   coordPixelsToWorld(700));
      
  2. Create a fixture
    
    FixturDef fd = new FixturDef();
    fd.shape = ps;
    fd.friction(0.3);
    fd.restitution(0.7);
    fd.density(4);
  
  3. Attach the shape to the body with the fixture
  
  body.createFixture(fd);
 **************************************
 BodyDef bd = new BodyDef();
bd.position.set(box2d.coordPixelsToWorld(width/2,height/2));
 
Body body = box2d.createBody(bd);
 
PolygonShape ps = new PolygonShape();
float w = box2d.scalarPixelsToWorld(150);
float h = box2d.scalarPixelsToWorld(100);
ps.setAsBox(w, h);
 
FixtureDef fd = new FixtureDef();
fd.shape = ps;
fd.density = 1;
fd.friction = 0.3;
fd.restitution = 0.5;

body.createFixture(fd);
******************************************
*/ 
    
    