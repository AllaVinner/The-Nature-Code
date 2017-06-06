class Line{
  PVector start;
  PVector end;
  
  Line(){
    start = new PVector(0,0);
    end = new PVector(0,0);
  }
  
  void display(){
    line(start.x, start.y, end.x, end.y);
  }
  
}