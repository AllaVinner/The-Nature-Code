class NonLinAxis extends SpaceObject{
  
  /**
  Axis( float, float, float, float);
  Axis( float, float, float, float, boolean);
  display();
  dislayTemp();
  dislayTemp(PVector, float);
  animation(Matrix, float, float);
  matrixMult(M);
  */
  
  /* Fields */
    PVector parallell;
  PVector [] array;
  int density;
  PVector temp0;
  PVector temp1;

  
  
  /* Construction */
  NonLinAxis(PVector v_, float start, float end){
    super();
    parallell = v_.copy();
    parallell.normalize();
    density = 2;
    array = new PVector[density * (int) (end - start)]; 
    for(float i= start; i <= end; i+= 1/density){
      array[(int) (i -start)*density] = new PVector(i*parallell.x, i*parallell.y);
    }
    
    temp0 = new PVector(0,0);
    temp1 = new PVector(0,0);
  }
  
  /**
  Exist so the computer do not run out of memory
  */
  /*
    NonLinAxis(float startX, float startY, float endX, float endY, boolean replica){
     super();
      start = new PVector ( startX, startY);
      end = new PVector ( endX, endY);   
      if(replica){
        temp = new Axis(startX, startY,endX, endY, false);
      }
    } // end Axis
  */
  
 void display(){
   stroke(c);
   strokeWeight(weight);
   for(int i=1 ; i < array.length; i++){
     temp0 = array[i-1].copy();
     temp1 = array[i].copy();
     temp0 = screen(temp0);
     temp1 = screen(temp1);
     line(temp0.x, temp0.y, temp1.x, temp1.y);
   }
 } // end dispay
 
 void displayTemp(){ 

 } //end displayTemp
 
 void animation(Matrix M, float i_, float n){
    for(int i=1 ; i < array.length; i++){
      temp0 = vectorAnime( array[i], M, i, n);
     temp1 = vectorAnime( array[i-1], M, i, n);
     temp0 = screen(temp0);
     temp1 = screen(temp1);
     line(temp0.x, temp0.y, temp1.x, temp1.y);
   }
 }  // end animation
 
 /**
 Changes the value of start and end
 */
 void matrixMult(Matrix M){
   for(PVector v : array){
   v = M.multStat(v);
   }
 } // end matrixMult
 
}