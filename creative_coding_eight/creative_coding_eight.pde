//yinqi huang
//Fractal Tree Sketch

float t; // to store the branch angle

void setup() {
  size(700, 500);
}

void draw() {
  background(0);
  frameRate(40); //40 frames per second
  stroke(#3E5F02); //tree csolor green
  
  // Calculate the angle for the branches based on mouse position
  // The angle changes dynamically as you move the mouse
  float x = (mouseX / (float) width) * 120f; //angle based on the mouse
  t = radians(x); //convert thes angle from degrees to radians
  translate(width/2,height);//bottom
  line(0,0,0,-160); //main trunk of the tree
  translate(0,-160); //move to the top of the trunk
  b(120); //branch

}

void b(float h) {
  h *= 0.66; //Each branch is 2/3 the size of its parent branch
  
  if (h > 2) { //if the branch length is more than 2 pixels
    pushMatrix(); // Save the current state
    rotate(t); // Rotate
    line(0, 0, 0, -h); // branch
    translate(0, -h); //move to the end of the branch
    b(h);       // 
    popMatrix();     
    // Repeat , draw left branch
    pushMatrix();
    rotate(-t); //opposite direction
    line(0, 0, 0, -h);
    translate(0, -h);
    b(h);
    popMatrix();
  }
}
