import java.util.Random;

Random generator;

void setup(){
  size(640, 400);
  background(0);
  generator = new Random();
}

void draw(){
  float numX = (float) generator.nextGaussian();
  float numY = (float) generator.nextGaussian();
  float sdX = 50;
  float sdY = 30;
  float meanX = width/2;
  float meanY = height/2;
  
  float x = numX*sdX + meanX;
  float y = numY*sdY + meanY;
  
  noStroke();
  fill(255, 11);
  ellipse(x, y, 20, 20);
}
  