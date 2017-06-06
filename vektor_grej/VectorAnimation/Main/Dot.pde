class Dot extends SpaceObject{
  
  
  PVector v;
  PVector temp;
  
  Dot(float x, float y){
    super();
    v = new PVector(x,y);
    
    temp = new PVector(x, y);
  }  
  
  Dot(float x, float y, boolean replica){
    super();
    v = new PVector(x,y);
  }
  
   void animation(Matrix M, float i, float n){
     temp =PVector.sub(M.multStat(v), v);  //to - from
     temp.mult(i/n); // (to-from) i/n
     temp.add(v); //(to-from) i/n + from
     stroke(c);
     strokeWeight(weight);
     temp = screen(temp);
   ellipse(temp.x, temp.y, weight , weight);
   }
   
   void matrixMult(Matrix M){
    v = M.multStat(v);
  }

  
}