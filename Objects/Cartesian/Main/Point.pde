class point{
  PVector loc;
  
  float r;
  float g;
  float b;
  
  point(float x_, float y_, float r_, float g_, float b_){
    loc = new PVector(x_, y_);
    r= r_;
    g=g_;
    b=b_;
  }
}