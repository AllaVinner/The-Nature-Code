class Axis extends SpaceObject{
  
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
  
  PVector start;
  PVector end;
  Axis temp;
  
  /* Construction */
  Axis(float startX, float startY, float endX, float endY){
    super();
    start = new PVector ( startX, startY);
    end = new PVector ( endX, endY);
    
    temp = new Axis(startX, startY,endX, endY, false);
  }
  
  /**
  Exist so the computer do not run out of memory
  */
    Axis(float startX, float startY, float endX, float endY, boolean replica){
     super();
      start = new PVector ( startX, startY);
      end = new PVector ( endX, endY);   
      if(replica){
        temp = new Axis(startX, startY,endX, endY, false);
      }
    } // end Axis
  
 void display(){
   stroke(c);
   strokeWeight(weight);
   temp.start = screen(start);
   temp.end = screen(end);
   line(temp.start.x, temp.start.y, temp.end.x , temp.end.y);
 } // end dispay
 
 void displayTemp(){ 

 } //end displayTemp
 
 void animation(Matrix M, float i, float n){
   temp.start =PVector.sub(M.multStat(start), start);  //to - from
     temp.start.mult(i/n); // (to-from) i/n
     temp.start.add(start); //(to-from) i/n + from
   temp.end =PVector.sub(M.multStat(end), end);  //to - from
     temp.end.mult(i/n); // (to-from) i/n
     temp.end.add(end); //(to-from) i
   
   stroke(c);
    strokeWeight(weight);     
     temp.start = screen(temp.start);
     temp.end = screen(temp.end);
     line(temp.start.x, temp.start.y, temp.end.x , temp.end.y);
 }  // end animation
 
 /**
 Changes the value of start and end
 */
 void matrixMult(Matrix M){
   start = M.multStat(start);
   end = M.multStat(end);
 } // end matrixMult
 
}