class VectorArrow extends SpaceObject{
  
  
  PVector v;
  PVector normal;
  PVector temp;
  PShape triangle;
  
  VectorArrow(float x, float y){
    super();
    weight=4;
    v = new PVector(x,y);
    normal = new PVector(-y, x);
    normal.normalize();
    normal.mult(1/3);
    
    triangle = createShape();
    triangle.beginShape();
    triangle.fill(c);
    triangle.noStroke();
    triangle.vertex(0, 0);
    triangle.vertex(-7*weight/4,15);
    triangle.vertex(7*weight/4,15);
    triangle.endShape(CLOSE);
    
    temp = new PVector(x,y);
  }  
  
  VectorArrow(float x, float y, boolean replica){
    super();
    v = new PVector(x,y);
  }
  
   void animation(Matrix M, float i, float n){
     temp =PVector.sub(M.multStat(v), v);  //to - from
     temp.mult(i/n); // (to-from) i/n
     temp.add(v); //(to-from) i/n + from
     stroke(c);
     strokeCap(SQUARE);
     strokeWeight(weight);
   temp = screen(temp);
 
   triangle.rotate(atan2(temp.y-loc.y, temp.x-loc.x)+PI/2) ;
   triangle.setFill(c);
   shape(triangle, temp.x, temp.y);
   triangle.rotate(-atan2(temp.y-loc.y, temp.x-loc.x)-PI/2);
  
   temp = PVector.sub(temp, PVector.sub(temp, loc).div(10));
   line(loc.x, loc.y, temp.x, temp.y);
   strokeCap(PROJECT);

   }
   
   void matrixMult(Matrix M){
    v = M.multStat(v);
  }

  
}