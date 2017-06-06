class SpaceObject{
  
  PVector loc;
  float scal;
  color c;
  float weight;
  
  SpaceObject(){
    loc = new PVector(width/2, height/2);
    scal =60;
    c = color(200);
    weight =5;
  }
  
  void animation(Matrix M, float i, float n){
    println("Animation");
  }
  
  void matrixMult(Matrix M){
    println("MatrixMult");
  }
  
  void displayTemp(){
    println("DisplayTemp");
  }
  
  PVector vectorAnime(PVector v_, Matrix m_ , float i, float n){
    PVector temp = new PVector(0,0);
    temp =PVector.sub(M.multStat(v_), v_);  //to - from
     temp.mult(i/n); // (to-from) i/n
     temp.add(v_); //(to-from) i/n + from  
      return temp;
  }
  
  
  
    
  /**
  Takes in a vector and returns another vector which correspondes to the first ectors cordinates on the screen.
  scal 0   + loc.x
  0 -scal  + loc.y
  */
  PVector screen(PVector v_){
    PVector ret = new PVector(scal*v_.x+loc.x, -scal*v_.y+loc.y);
    return ret;
  }
  
  void setLoc(float x_, float y_){
    loc.x = x_;
    loc.y = y_;
  }
  
  void setLoc(PVector v_){
    loc = v_.copy();
  }
  
  void setScal(float scal_){
    scal = scal_;
  }
  
  void setColor(color c_){
    c = c_;
  }
  
  void setWeight(float weight_){
    weight = weight_;
  }
}