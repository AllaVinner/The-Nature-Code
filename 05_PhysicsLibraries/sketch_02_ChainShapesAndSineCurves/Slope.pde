class Slope{
  
  Body body;
  Vec2 [] pixelVertices;
  Vec2 [] worldVertices;
  
  Slope(){
   
    
    BodyDef bd = new BodyDef();
    body = box2d.createBody(bd);        // By default STATIC, and no position is needed
    
    ChainShape chain = new ChainShape();
      int n = 80;
      float x =0;
      float y = 0;
      pixelVertices = new Vec2[n];
      worldVertices = new Vec2[n];
       
      for(int i=0; i<n; i++){
       x = i*width/(2*n);
       y = 100*sin(12 *x /width)+300; // 12 = 2*2pi
       pixelVertices[i] = new Vec2(x,y); 
      }

      
      for(int i=0; i< pixelVertices.length; i++){
        worldVertices[i] = box2d.coordPixelsToWorld(pixelVertices[i]);
      }

      chain.createChain(worldVertices, worldVertices.length);  // Creates the chain
      
      FixtureDef fd = new FixtureDef();

      fd.shape = chain;
      fd.density = 1;
      fd.friction = 0.3;
      fd.restitution = 0.5;
       
      body.createFixture(fd);
      
      body.createFixture(chain,1);
  }
  
   void display() {
    strokeWeight(1);
    stroke(0);
    noFill();
    
    beginShape();
    for (Vec2 v: pixelVertices) {
      vertex(v.x,v.y);
    }
    endShape();
  }
}