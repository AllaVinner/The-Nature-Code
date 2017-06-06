class Matrix{
  
  float [] [] m;
  
  private final float NONE = -404;
  
  PVector eigenVector0;
  PVector eigenVector1;
  
  float eigenValue0;
  float eigenValue1;
  
  Matrix(float aa, float ab, 
         float ba, float bb){
    m = new float[2][2];
    
    eigenValue0 = getEigenvalues()[0];
    eigenValue1 = getEigenvalues()[1];
    
    m[0][0] = aa;
    m[0][1] = ab;
    m[1][0] = ba;
    m[1][1] = bb;
  }
  
  
  /**
  Changes the vector itsself => v := Mv
  */
  void mult(PVector v){
    PVector temp = new PVector(v.x*m[0][0] + v.y*m[0][1], v.x*m[1][0] + v.y*m[1][1] );
    v.x = temp.x;
    v.y = temp.y;
  }
  
   /**
  Return u = Mv, and leaves v as its self.
  */
  PVector multStat(PVector v){
    PVector temp = new PVector(v.x*m[0][0] + v.y*m[0][1], v.x*m[1][0] + v.y*m[1][1] );
    return temp;
  }
  
  void mult(float scal){
    m[0][0] *= scal;
    m[0][1]*= scal;
    m[1][0]*= scal;
    m[1][1]*= scal;
  }
  
  /**
  Am
  */
  Matrix matrixMult(Matrix A){
    Matrix ret = new Matrix(A.m[0][0]*m[0][0]+A.m[0][1]*m[1][0], A.m[0][0]*m[1][0]+A.m[0][1]*m[1][1],
                            A.m[1][0]*m[0][0]+A.m[1][1]*m[1][0], A.m[1][0]*m[0][1]+A.m[1][1]*m[1][1]);
    return ret;
  }
  
  float [] getEigenvalues(){
    float [] temp = new float[2];
    temp[0] = NONE;
    temp[1] = NONE;
    
    if( (m[0][0] - m[1][1])*(m[0][0] - m[1][1]) >= -4*m[1][0]*m[0][1]){
      temp[0] = (m[0][0]+m[1][1])/2 + sqrt( pow((m[0][0]-m[1][1]),2) + 4 *m[1][0]*m[0][1])/2;
      temp[0] = (m[0][0]+m[1][1])/2 - sqrt( pow((m[0][0]-m[1][1]),2) + 4 *m[1][0]*m[0][1])/2;
    }
    return temp;
  }
  
  PVector [] getEigenvector(){
    PVector [] temp = new PVector [2];
    temp[0] = new PVector(NONE, NONE);
    temp[1] = new PVector(NONE, NONE);
    if(eigenValue0 != NONE){
      temp[0].x = - m[0][1];
      temp[0].y = m[0][0]-eigenValue1;
      temp[0].normalize();
    }
    if(eigenValue1 != NONE){
      temp[1].x = - m[0][1];
      temp[1].y = m[0][0]-eigenValue1;
      temp[1].normalize();
    }
    return temp;
  }
  
  
  
}