import java.util.Random;

Random generator;

void setup(){
  size(640,300);
  generator = new Random();
  background(255);
}

void draw(){
  float num = (float) generator.nextGaussian();
  float sd = 80;
  float mean = width/2;
  
  float x = sd * num + mean;
  
  noStroke();
  fill(0, 11);
  ellipse(x, height/2, 16,16);
  
}