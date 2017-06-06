class Circle{
  
  float r;
  PVector [] list;
  
  Circle(float r_, int density){
    list = new PVector [density];
    r=r_;
    for(int i=0; i< list.length; i++){
      list[i] = new PVector( r*cos( TWO_PI / density*i), r*sin( TWO_PI / density *i));
    }
  }
}