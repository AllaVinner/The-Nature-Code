class BubbleGrid extends SpaceObject{
  
  /**
  BubbleGrid(float, float);
  BubbleGrid(float, float, boolean);
  animation(Matrix, float, float);
  matrixMult(Matrix);
  */
  Dot [] [] grid;
  BubbleGrid temp;
  
  BubbleGrid(int nX, int nY){
    super();
    grid = new Dot [nX] [nY];
    for(int i=0; i<grid.length; i++){
      for(int j=0; j < grid[0].length; j++){
        grid[i][j] = new Dot( i- grid.length/2, j -grid[0].length/2);
        grid[i][j].loc = loc;
        grid[i][j].scal = scal;
      }
    }
  }
  
   void animation(Matrix M, float index, float n){
    for(int i=0; i<grid.length; i++){
      for(int j=0; j < grid[0].length; j++){
         grid[i][j].animation( M, index, n);
      }
    }
 }
 
   void setScal(float newScal){
      scal = newScal;
      for(Dot[] dArray : grid){
        for(Dot d : dArray){
          d.scal = newScal;
        }
      }
    }
    
    void setWeight(float newWeight){
      weight = newWeight;
      for(Dot[] dArray : grid){
        for(Dot d : dArray){
          d.weight = newWeight;
        }
      }
    }
 
 void matrixMult(Matrix M){
    println("MatrixMult");
  }
  
}