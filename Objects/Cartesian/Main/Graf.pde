  class Graf{
    Cartesian c;
    PVector origo;
    
    PVector xAxis;
      float xStart;
      float xEnd;
    PVector yAxis;
      float yStart;
      float yEnd;
    
    float cellWidth=10;
    float cellHeight=10;
    
    Graf(){
      c = new Cartesian();
      origo = new PVector(width/2,height/2);
      xAxis = new PVector(c.xAxis.x, c.xAxis.y);
        xAxis.setMag(cellWidth);
      yAxis = new PVector(c.yAxis.x, c.yAxis.y);
        yAxis.setMag(cellWidth);
      
    }
    
    
  void display(){
    pushMatrix();
    translate(origo.x, origo.y);
    setStartEnd();
    stroke(150);
    line(PVector.mult(xAxis,xStart).x, PVector.mult(xAxis,xStart).y,PVector.mult(xAxis,xEnd).x, PVector.mult(xAxis,xEnd).y);
    popMatrix();
  }
  
  void setXStart(){
    PVector temp = xAxis.copy();
    float i =0;
    while(0<temp.x && temp.x < width && 0<temp.y && temp.y < height){
      temp = PVector.add(origo, PVector.mult(xAxis, i));
      i--;
    }
    xStart =i;
  }
   void setXEnd(){
    PVector temp = xAxis.copy();
    float i =0;
    while(0<temp.x && temp.x < width && 0<temp.y && temp.y < height){
      temp = PVector.add(origo, PVector.mult(xAxis, i));
      i++;
    }
    xEnd =i;
  }
   void setYStart(){
    PVector temp = yAxis.copy();
    float i =0;
    while(0<temp.x && temp.x < width && 0<temp.y && temp.y < height){
      temp = PVector.add(origo, PVector.mult(xAxis, i));
      i--;
    }
    yStart =i;
  }
   void setYEnd(){
    PVector temp = yAxis.copy();
    float i =0;
    while(0<temp.x && temp.x < width && 0<temp.y && temp.y < height){
      temp = PVector.add(origo, PVector.mult(xAxis, i));
      i++;
    }
    yEnd =i;
  }
  
  void setStartEnd(){
    setXStart();
    setYStart();
    setXEnd();
    setYEnd();
  }
 }