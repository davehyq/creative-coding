//yinqi huang 

ArrayList<Circle> circles = new ArrayList<Circle>(); //store Circle objects

void setup() {
  size(700, 500); //set up the canvas
  background(255); //white background
}

void draw() {
  background(255); //refresh the background
  
  // Iterate over the loop array in reverse order
  for (int i = circles.size()-1; i >= 0; i--) {
    Circle c = circles.get(i); // Get the current circle
    c.showing(); // Make the circle grow and fade
    c.display(); // Display the circle on the screen
    
    }
  }


class Circle {
  float x; // X-coordinate
  float y; // Y-coordinate
  float dia; // Diameter of the circle
  float q; // Transparency of the circle
  color col; //Color of the circle

  //create a new circle
  Circle(float x, float y) {
    this.x = x;
    this.y = y;
    this.dia = 10; //diameter    
    this.q = 255; // transpparency   
    this.col = color(random(255), random(255), random(255));  // Random color
  }
  
void showing() { // increase size and decrease transparency
    dia = dia + 0.5; // Increase the diameter
    q = q - 2; // decrease transparency
  }
  
void display() { //display the circle
    fill(col, q); //transparency color
    noStroke();      
    ellipse(x, y, dia, dia); //draw the circle
  }
}

void mousePressed() { //add a new circle at mouse position when pressed
  circles.add(new Circle(mouseX, mouseY));
}
