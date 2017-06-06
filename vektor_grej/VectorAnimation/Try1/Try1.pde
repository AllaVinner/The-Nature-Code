BoardHandler bH;

float [][] matrix;
void setup(){
  size(400,400);
  background(0);
  
  bH = new BoardHandler();
  matrix = new float [2][2];
  matrix[0][0] = 1;
  matrix[1][0] = 0;
  matrix[0][1] = 1;
  matrix[1][1] = 1;
  
  bH.matrixMult( matrix);
  
}

void draw(){
 background(0);
 bH.display();
 bH.update();
}