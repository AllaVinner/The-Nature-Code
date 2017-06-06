void setup(){
  size(700, 400);
  background(255);
}

  float xOff =0;
  float yOff =0;
  
void draw(){

  loadPixels();
  float bright;
  for(int x =0; x < width; x++){
    yOff =0;
    for(int y=0; y < height; y++){
      bright = (float) map(noise(xOff,yOff), 0,1, 0, 255);
      pixels[x +y*width] = color(bright);
      yOff += 0.003;
    }
    xOff += 0.003;
   }
  updatePixels();
  
}