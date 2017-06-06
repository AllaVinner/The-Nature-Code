class Dog extends Animal{
  
  float speed;
  Dog(){
    super();
    speed = random(255);
  }
  
  void eat(){
    super.eat();
    println("Woofsy");
  }
  
  void bark(){
    println("WOOF!!");
  }
}