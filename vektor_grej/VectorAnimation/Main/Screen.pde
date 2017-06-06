class Screen{
  
  Axis xAxis;
  Axis yAxis;
  BubbleGrid bGrid;
  Circle c;
  VectorArrow vec;
  LineGrid lG;
  Dot dot;
  
  Matrix M;
  Matrix I;
  Matrix MaddI;
  Matrix U;
    ArrayList<SpaceObject> vectorSpace1;
  
  float index=0;
  float n = 100;
  int order =0;
  
  
  Screen(){
    
    vectorSpace1 = new ArrayList<SpaceObject>();
    xAxis = new Axis( -3, 0, 3,0);
      xAxis.loc.set(300, 150);
      xAxis.scal= 10;
      
    yAxis = new Axis( 0,-3, 0, 3);
      yAxis.loc.set(300, 150);
      yAxis.scal=10;
      
    dot = new Dot(3, -1);
      dot.loc.set(300,150);
      dot.scal = 10;
      
    vec = new VectorArrow(1, 0);
      vec.loc.set(600, 150);
      vec.scal = 100;
      vec.c = color(100, 0 ,100);

    bGrid = new BubbleGrid(10,10);
      bGrid.loc.set(450, 150);
      bGrid.setScal(10);
      bGrid.setWeight(2);
      
    c = new Circle(1, 100);
    
    lG = new LineGrid(7,7);
       lG.loc.set(150,150);
       lG.setScal(20);
    
     vectorSpace1.add(lG);
     vectorSpace1.add(xAxis);
     vectorSpace1.add(yAxis);
     vectorSpace1.add(dot);
     vectorSpace1.add(bGrid);
     vectorSpace1.add(vec);
     
    
    I = new Matrix( 1, 0,
                    0, 1);
   
   float angle = -PI/3;
   U = new Matrix( cos(angle), -sin(angle),
                   sin(angle), cos(angle));
                    
   M = new Matrix( 1, 0.7, 
                   0.2 , 1.3);
   M.mult(1);
   MaddI = M.matrixMult(I);
  }
  
  void display(){
      switch(order){
        case 0 :
            if(index < n){  
               animation(vectorSpace1, M, index, n);
               index++;
            }else{
              index =0;
              order ++;
            }
            break;
        case 1:
        for(SpaceObject sO : vectorSpace1){
          sO.matrixMult(M);
        }
        order ++;
        case 2:
            if(index < n){  
               animation(vectorSpace1, U, index, n);
               index++;
            }else{
              index =0;
              order ++;
            }
            break;
        case 3: 
          for(SpaceObject sO : vectorSpace1){
            sO.matrixMult(U);
          }
          order =0;
          break;
        case 4:
         if(index < n){  
               animation(vectorSpace1, MaddI, index, n);
               index++;
            }else{
              index =0;
            }
            break;  
      }
        
  }
  
  void animation(ArrayList<SpaceObject> sOList, Matrix M, float i, float n){
      for(SpaceObject sO : sOList){
        sO.animation(M, i, n);
      }
  }
  
}