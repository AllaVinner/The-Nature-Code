class CartesianBoard{
  
  CartesianAxis x;
  CartesianAxis y;
  
  
  CartesianBoard(){
    x= new CartesianAxis(new PVector(0.5,-0.5));
    y = new CartesianAxis(new PVector(0,2));
    
  }
  
  void matrixMult(float[][] m){
    // funkar ej
     float[] [] temp = new float[2][2];
     temp[0][0] = m[0][0]*x.unit.x +m[0][1]*x.unit.y;
     temp[0][1] = m[0][0]*y.unit.x +m[0][1]*y.unit.y;
     temp[1][0] = m[1][0]*x.unit.x +m[1][1]*x.unit.y;
     temp[1][1] = m[1][0]*y.unit.x +m[1][1]*y.unit.y; 
     
    x.unit.x = temp[0][0];
    x.unit.y = temp[1][0];
    y.unit.x = temp[0][1];
    y.unit.y = temp[1][1];    
  }
  
  
}