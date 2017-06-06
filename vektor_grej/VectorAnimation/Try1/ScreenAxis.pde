class ScreenAxis{
  
  PVector unit;
  PVector loc;
  
  PVector start;
  PVector end;
  
  float cellLength=50;
  
  ScreenAxis(PVector loc_, PVector unit_){
    unit = unit_;
      unit.normalize();
      unit.mult(cellLength);
    loc = loc_;
    
    start = new PVector(0,0);
    end = new PVector(0,0);
    setStartEnd();
  }
  
  void display(){
  stroke(255);
  line(start.x, start.y, end.x, end.y);
  }
  
  void update(){
    setStartEnd();
    unit.normalize();
    unit.mult(cellLength);
  }
  
  void setStartEnd(){
    setStart();
    setEnd();
  }
  
  void setStart(){
   PVector temp = loc.copy();
   PVector scal = unit.copy();
   scal.y = -1*scal.y;
   while(0 <=temp.x && temp.x <= width && 0<=temp.y && temp.y <= height){
      temp.add(scal);
    }
    start = temp;
  }
  
   void setEnd(){
   PVector temp = loc.copy();
   PVector scal = unit.copy();
   scal.y = -1*scal.y;
   while(0 <=temp.x && temp.x <= width && 0<=temp.y && temp.y <= height){
      temp.sub(scal);
    }
    end = temp;
  }
  
  ScreenAxis Copy(){
    ScreenAxis temp = new ScreenAxis(new PVector(0,0), new PVector(0,0));
    temp.loc = PVector.mult(loc,1);
    temp.unit = PVector.mult(unit,1);
    temp.start = PVector.mult(start,1);
    temp.end = PVector.mult(end,1);
    temp.cellLength = cellLength;
    return temp;
  }
}