//yinqi huang

float boxRota = 0;  // rotation of the central box

void setup() {
  size(800, 500, P3D); //p3d make it 3d.
}

void draw() {
  background(0); //background black
  lights(); //add the light effection
  
  // adjust the angle of the camera base on the mouse position
  setCamera();
  drawBox(); //draw the boxes
  drawGrid(); //grid
  drawAx(); //box axes
  boxRota += PI/360; //Increase the rotation of the next frame
}

void setCamera() {
  float camY = map(mouseY, 0, height, -500, 500);
  float camZ = map(mouseX, 0, width, 300, -300);
  //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
  camera(20, camY, camZ, 3, 0, 1, 0, 1, 0);
}

void drawBox() {
  pushMatrix();
  rotateY(boxRota);
  fill(150, 100, 255, 150);  //transparent purple color
  box(80);
  popMatrix();
}

//draw the boxes around the center box
void drawGrid() {
  for(int i = -2; i <= 2; i++) {
    for(int j = -2; j <= 2; j++) {
      pushMatrix();
      translate(i * 100, j * 100);
      fill(100, 150, 255, 150);  // blue color
      box(30);
      popMatrix();
    }
  }
}

//lines that connect to the next bule boxes
void drawAx() {
  stroke(255);
  line(-100, 0, 0, 100, 0, 0);  // X-axis
  line(0, -100, 0, 0, 100, 0);  // Y-axis
  line(0, 0, -100, 0, 0, 100);  // Z-axis
}
