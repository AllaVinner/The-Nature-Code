Surface s;
Mover m1;
Mover m2;
Mover m3;


void setup(){
 size(600, 600);
 
 s = new Surface(0, height/2, width-100, 200);
 m1 = new Mover(100, 288 , 3, 16);
  m2 = new Mover(100, 265 , 3, 30);
   m3 = new Mover(100, 288 , 3, 16);
 
}

void draw(){
background(250);

s.display();
m1.display();
m2.display();
m3.display();

if( s.isInside(m2)){
  println("NSIDE");
}

}
 