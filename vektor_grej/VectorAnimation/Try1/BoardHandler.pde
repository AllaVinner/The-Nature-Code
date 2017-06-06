class BoardHandler{
  
  ScreenBoard sB ;
  CartesianBoard cB;
  
  BoardHandler(){
    
    sB = new ScreenBoard();
    cB = new CartesianBoard();
    sB = convert(cB);
    
  }
  
  void display(){
    sB.display();
  }
  
  void update(){
    sB.update();

  }
  
  ScreenBoard convert(CartesianBoard cB){
    ScreenBoard tempSB = new ScreenBoard();
    tempSB.x.unit = cB.x.unit.copy();
    tempSB.y.unit = cB.y.unit.copy();   
    tempSB.x.unit.mult(tempSB.x.cellLength);
    tempSB.y.unit.mult(tempSB.y.cellLength);
    return tempSB;
  }
  
  void matrixMult(float[][] m){
    cB.matrixMult( m);
  }
  
}