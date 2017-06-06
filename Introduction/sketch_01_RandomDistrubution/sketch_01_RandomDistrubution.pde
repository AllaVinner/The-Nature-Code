// RadnomCounter

int [] randomCount;

void setup(){
  size(600,600);
  randomCount = new int [20];
}

void draw(){
  background(255);
  
  int index = int(random(randomCount.length));
  randomCount[index] ++;
  
  stroke(0);
  fill(175);
  
  int w = width / randomCount.length;
  
  for( int i=0; i < randomCount.length; i++){
    rect(i * w, height -randomCount[i], w-1, randomCount[i]);
  }
}