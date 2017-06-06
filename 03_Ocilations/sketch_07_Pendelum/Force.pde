class Force{
  
  PVector force;
  String type;
  
  Force(PVector force_, String type_){
    force = force_;
    type = type_;
    
    switch(type){
      case "Normal" :
      force.normalize();
      break;
    }
  }
  
  void setForce(PVector f){
    force = f;
    force.normalize();
  }
  
  // for normal forces
  PVector getForce(Pendelum obj){
    force = PVector.sub(new PVector(0,0),obj.ploc);
    force.normalize();
    println("Emmellan" + force.x + "    " + force.y);
    PVector temp = obj.accel.get();
    temp.mult(obj.mass);
    
    if(force.dot(temp) < 0){
      force.mult( PVector.dot(force , temp)).mult(-1);
              println("Efter" + force.x + "    " + force.y);
              println("DOT: " + PVector.dot(force, PVector.add(force, temp))); 
      return force;

    } else {
        println("Efter2" + force.x + "    " + force.y);
      return temp.mult(0);
      
  }
  }
  
}