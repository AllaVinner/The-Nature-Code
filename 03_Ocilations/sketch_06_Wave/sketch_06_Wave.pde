Oscillator [] wave;

void setup(){
  size(700, 500);
  background(900);
  
  wave = new Oscillator [100];
  
  for( int i=0; i < wave.length; i++){
    wave[i] = new Oscillator(100, i*PI/wave.length*3, PI/2, PI/3, i* width/wave.length + 50, height/2);
  }
}

void draw(){
  background(900);
  
  for(Oscillator w : wave){
    w.update();
    w.display();
  }
}