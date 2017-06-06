class Cartesian{
  
  PVector origo;
  PVector xAxis;
  PVector yAxis;
  
  
  Cartesian(){
    xAxis = new PVector(1, 0);
    yAxis = new PVector(0, 1);
  
  }
  
  void setXAxis(PVector x){
    xAxis.x=x.x;
    yAxis.y=x.y;
  }
  
  void setXAxis(float angle){
   xAxis.x = cos(angle);
   yAxis.y = sin(angle);
  }
}