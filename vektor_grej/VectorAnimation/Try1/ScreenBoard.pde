class ScreenBoard{
  
  PVector loc;
  ScreenAxis x;
  ScreenAxis y;
  
  ArrayList<ScreenDot> dotList;
  ScreenDot dot;
  
  ScreenBoard(){
   loc = new PVector(width/2, height/2);
   x = new ScreenAxis(new PVector(width/2, height/2), new PVector(100,0));
   y = new ScreenAxis(new PVector(width/2, height/2), new PVector(0,100));
   
   dotList = new ArrayList<ScreenDot>();
   
   for(float i=-2; i< 4; i += 0.5){
   dotList.add(new ScreenDot(new PVector(i*i,i)));
   }
  }
  
  void display(){
    stroke(255);
    x.display();
    y.display();
    
    stroke(100);
    Line tempLine = new Line();
    tempLine.start = x.start.copy();
    tempLine.end = x.end.copy();
    
    for(float f=0; f < 4; f++){
    tempLine.start.add( y.unit);
    tempLine.end.add(y.unit);
    tempLine.display();
    }
    
    tempLine.start = y.start.copy();
    tempLine.end = y.end.copy();
    for(float f=0; f < 4; f++){
    tempLine.start.add(x.unit);
    tempLine.end.add(x.unit);
    tempLine.display();
    }
    
    PVector temp;
    for(ScreenDot sD : dotList){
       temp = dotDisplayV(sD);
       ellipse(temp.x, temp.y, 5,5);
    }
  }
  
  void update(){
    x.update();
    y.update();
    
  }
  
  PVector dotDisplayV(ScreenDot sD){
    PVector temp = new PVector(0,0);
    temp.add( PVector.mult(x.unit, sD.loc.x));
    temp.add( PVector.mult(y.unit, sD.loc.y));
    temp.y *= -1;
    temp.add(loc);
    return temp;
  }
  
}