//yinqi huang

void setup() {
  size(640, 360, P3D); //3d
  noStroke();
}

void draw() {
  lights(); //lights effection
  background(0); //black background
  float Y = height/2.0; //Calculates and stores the vertical midpoint of the canvas.
  float f = mouseX/float(width) * PI/2; //Maps the horizontal mouse position to an angle between 0 and PI/2. The angle increases as the mouse moves to the right.
  float Z = Y / tan(f / 2.0); //Calculates a depth value Z for setting the perspective, based on the angle f.
  float as = float(width)/float(height); //Calculates the aspect ratio of the canvas 
  
  if (mousePressed) {//When the mouse is pressed, the aspect ratio is halved, making the viewing angle narrower.
    as = as / 2.0;
  }
  perspective(f, as, Z/10.0, Z*10.0);
  translate(width/2 + 30, height/2, 0);
  rotateX(-PI/6);
  rotateY(PI/3 + mouseY/float(height) * PI);
  box(45);
  translate(0, 0, -50);
  fill(#FAB1B1);
  sphere(20);
}
