class CartesianAxis{
 
 PVector unit;
 CartesianAxis(PVector v){
   unit = v;
   unit.normalize();
 }
  
}