ArrayList<Animal> animals;

void setup(){
  size(400, 400);
  animals = new ArrayList<Animal>();
  
  animals.add( new Cat());
  animals.add( new Dog());
    for(Animal a : animals){
    a.eat();
  }

}