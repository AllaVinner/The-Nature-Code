Animal[] foxes;
Animal[] rabbits;
Animal[] carrots;

PVector attraction;
PVector repoltion;

void setup(){
  size(700,400);
  background(0, 200, 0);
  
  attraction = new PVector(0,0);
  repoltion = new PVector(0,0);
  
  foxes = new Animal [2];
  rabbits = new Animal[1];
  carrots = new Animal[8];
  
  //Initialize
  for(int i=0; i<foxes.length; i++){
    foxes[i] = new Animal(random(10,15), "Fox");
  }
  for(int i=0; i<rabbits.length; i++){
    rabbits[i] = new Animal(random(5,10), "Rabbit");
  } 
  for(int i=0; i<carrots.length; i++){
    carrots[i] = new Animal(random(15,20), "Carrot");
  }
  
  
  // set prey and predators
  for(Animal f : foxes){
     for(Animal r : rabbits){  
       f.food.add(r);
       r.predator.add(f);
       for(Animal c : carrots){
         r.food.add(c);
         c.predator.add(r);
       }
     }
  }
  
  
}

void draw(){
  background(0, 200,100);
  
  for( Animal f : foxes){
    animalAttraction(f);
  }
  
  for( Animal r : rabbits){
   animalAttraction(r);
  }
  
  for( Animal c : carrots){
   animalAttraction(c);
  }
  
  
  
  for(Animal f : foxes){
    f.update();
    f.display();
  }
  
  for(Animal r : rabbits){
    r.update();
    r.display();
  }
  
  for(Animal c : carrots){
    c.display();
  }
}

void animalAttraction(Animal a){
    for(int i=0; i < a.food.size(); i++){
      attraction = a.attraction(a.food.get(i));
      a.applyForce(attraction);
  }
  
   for(int i=0; i < a.predator.size(); i++){
      repoltion = a.repoltion(a.predator.get(i));
      a.applyForce(repoltion);
    }
}