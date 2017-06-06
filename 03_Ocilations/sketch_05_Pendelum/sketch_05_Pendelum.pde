
Oscillator pendelV;
Oscillator pendelH;


PVector sum;

void setup(){
background(800);
size(600,500);
                     // amp , begin,   per,   angle, sx, sy
pendelV = new Oscillator(100,  PI/2,  -2* PI,   0,    width/2, height/2);
pendelH = new Oscillator(100,    0,     PI,   PI/2,     width/2, height/2);
pendelH.loc.y = 300;

sum = new PVector(pendelH.loc.x+pendelV.loc.x,pendelH.loc.y+pendelV.loc.y);
}

void draw(){
  //background(100);
  
  pendelH.update();
  pendelH.display();
  pendelV.update();
  pendelV.display();
  
 sum.x= pendelH.loc.x + pendelV.loc.x +(pendelH.startX + pendelV.startX)/2;
 sum.y =pendelH.loc.y + pendelV.loc.y+ (pendelH.startY + pendelV.startY)/2;

  pushMatrix();
  //translate(width/2,height/2);
  fill(0,200,0);
  ellipse(sum.x, sum.y, 10,10);
  popMatrix();

}
  