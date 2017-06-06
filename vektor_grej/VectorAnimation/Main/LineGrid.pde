class LineGrid extends SpaceObject{
  
  /**
  LineGrid(int, int);
  LineGrid(int, int boolean);
  animation(Matrix, float, float);
  display();
  displayTemp();
  displayTemp(PVector, float);
  matrixMult(Matrix)
  */
  
  /* Fields */
  Axis [] xAxis;
  Axis [] yAxis;
  LineGrid temp;
  
  LineGrid(int nX, int nY){
    super();
    xAxis = new Axis [nX];
    yAxis = new Axis [nY];
    
    for(int i=0; i<xAxis.length; i++){
      xAxis[i] = new Axis(i-xAxis.length/2,xAxis.length/2, i-xAxis.length/2, -xAxis.length/2 );
        xAxis[i].loc = loc;
        xAxis[i].scal = scal;
    }
    for(int i=0; i<yAxis.length; i++){
      yAxis[i] = new Axis(yAxis.length/2, i-yAxis.length/2, -yAxis.length/2, i-yAxis.length/2);
      yAxis[i].loc = loc;
      yAxis[i].scal = scal;
    }
  }// end LineGrid

   void animation(Matrix M, float index, float n){
        for(Axis a : xAxis){
          a.animation(M, index,n);
        }
        for(Axis a : yAxis){
          a.animation(M, index,n);
        }
   }
   
   void displayTemp(){
      for(Axis a : xAxis){
          a.displayTemp();
        }
        for(Axis a : yAxis){
          a.displayTemp();
        }
    }
    
    void setScal(float newScal){
      scal = newScal;
      for(Axis a : xAxis){
        a.scal = newScal;
      }
      for(Axis a : yAxis){
        a.scal = newScal;
      }
    }

   
   void matrixMult(Matrix M){
        for(Axis a : xAxis){
          a.matrixMult(M);
        }
        for(Axis a : yAxis){
          a.matrixMult(M);
        }
   }
}// end class