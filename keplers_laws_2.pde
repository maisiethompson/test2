Planet p;
Moon m;

void setup()
{
  size(600,600);
  p = new Planet();
  m = new Moon();
}

void draw()
{
  background(#7C2B0B);
  PVector force = p.attract(m);
  m.applyForce(force);
  m.update();
  p.display();
  m.display();
}

class Planet
{
  float mass;
  float G;
  PVector location;
  
  Planet()
  {
    mass = 50;
    G = 10;
    location = new PVector (width/2, height/2);
  }
  
  PVector attract(Moon m)
  {
    PVector force = PVector.sub(location, m.location); //find distance and direction between two objects
    float d = force.mag(); //find distance
   // d = constrain(d, 20,20); //keeps orbit from being too large
    force.normalize(); //find direction
    float strength = (G * mass * m.mass)/(d * d); //force equation
    force.mult(strength); //combine strength and direction
    return force;
  }
  
  void display()
  {
    fill(#6F605A, 200);
    noStroke();
    ellipse(location.x, location.y, mass*2, mass*2);
  }
}

class Moon
{
  float mass;
  PVector location;
  PVector velocity;
  
  Moon()
  {
    mass = 20;
    location = new PVector (width*(2/3), height/3);
    velocity =  new PVector (0,5);
  }
  
  void update()
  {
    location.add(velocity);
  }
  
  void applyForce(PVector force)
  {
    velocity.add(force);
  }
  
  void display()
  {
    fill(#164D6A, 200);
    noStroke();
    ellipse(location.x, location.y, mass*2, mass*2);
  }
}