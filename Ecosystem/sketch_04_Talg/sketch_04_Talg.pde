WaterTalg go;

void setup(){
  size(300, 300);
  
  go = new WaterTalg();
}

void draw(){
  background(255);
  go.run();
 
}