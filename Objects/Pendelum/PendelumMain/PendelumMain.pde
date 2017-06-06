Pendelum bob;
Force gravity;
Force normal;
Mover m;
Arrow aNormal;
Arrow aGrav;
Arrow aVel;
Arrow aSum;

boolean addapt;

void setup(){
  size(600,500);
  background(200);
  //frameRate(10000000);
  
  bob = new Pendelum(width/2, 100, 100,PI/3);
  gravity = new Force(0.2, - PI/2);
  normal = new Force(0.2, PI/4 +PI/2);
  m = new Mover(400, height/2, 3, 16);
  aNormal = new Arrow(0,0,0,0);
  aGrav = new Arrow(0,0,0,0);
    aVel = new Arrow(0,0,0,0);
      aSum = new Arrow(0,0,0,0);
      
     addapt = true;
}

void draw(){
   background(200);
  
   normal.vForce.x = -1* bob.ball.loc.x;
   normal.vForce.y = -1* bob.ball.loc.y;
   

   aNormal.loc.x = bob.loc.x + bob.ball.loc.x;
   aNormal.loc.y = bob.loc.y + bob.ball.loc.y;
     aGrav.loc.x = bob.loc.x + bob.ball.loc.x;
   aGrav.loc.y = bob.loc.y + bob.ball.loc.y;
        aVel.loc.x = bob.loc.x + bob.ball.loc.x;
   aVel.loc.y = bob.loc.y + bob.ball.loc.y;
   
           aSum.loc.x = bob.loc.x + bob.ball.loc.x;
   aSum.loc.y = bob.loc.y + bob.ball.loc.y;
   
   bob.ball.applyForce(gravity.vForce);
   normal.setNormalForce(bob.ball );
   
   
   aNormal.arrow.x = normal.vForce.x;
   aNormal.arrow.y = normal.vForce.y;
   aNormal.arrow.mult(600);
   aNormal.display();
    aGrav.arrow.x = gravity.vForce.x;
   aGrav.arrow.y = gravity.vForce.y;
   aGrav.arrow.mult(600);
   aGrav.display();
    aVel.arrow.x = bob.ball.vel.x;
   aVel.arrow.y = bob.ball.vel.y;
   aVel.arrow.mult(20);
   aVel.display();
   
     aSum.arrow.x = normal.vForce.x +  gravity.vForce.x;
   aSum.arrow.y =  normal.vForce.y +  gravity.vForce.y;
   aSum.arrow.mult(1200);
   aSum.display();
   
  if(bob.distance > bob.radius-10000){
   bob.ball.applyForce(normal.vForce);
  }
     // println(bob.distance);
    //  println("DOT " + bob.ball.vel.dot(normal.vForce));
    println("Angle: " +degrees( PVector.angleBetween(normal.vForce, bob.ball.vel)));
    println("Distance" + bob.distance);
   bob.update();
   bob.display();

}