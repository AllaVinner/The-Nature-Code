class Boundary {
  
 float x,y;
 float w,h;
 
 Body b;
 
 Boundary(float x_, float y_, float w_, float h_){
    x=x_;
    y=y_;
    w=w_;
    h=h_;
    
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    bd.type = BodyType.STATIC;          // Sets the type of the body!!!
    b = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    ps.setAsBox(box2d.scalarPixelsToWorld(w/2),
                box2d.scalarPixelsToWorld(h/2));
    
    b.createFixture(ps,1);         //Density is 1    
 }
 
 void display(){
  fill(0);
  stroke(0);
  rectMode(CENTER);
  rect(x,y,w,h);
 }
  
  
}