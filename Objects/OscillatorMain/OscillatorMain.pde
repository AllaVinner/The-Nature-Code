Oscillator [] wave;
Oscillator o1;
Oscillator o2;

void setup(){
  size(700, 500);
  background(900);
  
  wave = new Oscillator [100];
  
  for( int i=0; i < wave.length; i++){
                             //   ordox                      ordoy    angle    amp    begin              perios
    wave[i] = new Oscillator(i* 200/wave.length + 50 , 300/2 ,       PI/2,    100 ,   2* PI*  i/wave.length,   5*PI);
  }
  
  o1 = new Oscillator(width-100, height -200, 0, 50, 0, PI);
  o2 = new Oscillator(200, height -100, PI/3, 150, 0, 2*PI);
}

void draw(){
  background(900);
  
  for(Oscillator w : wave){
    w.update();
    w.display();
  }
  
  o1.update();
  o1.display();
  o2.update();
  o2.display();
}