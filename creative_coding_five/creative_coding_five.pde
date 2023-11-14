//yinqi huang


void setup() {
  size(700, 500, P3D); //p3d = 3d
  noStroke(); 
  sphereDetail(50); // The higher the number, the smoother the sphere.
}

void draw() {
  background(0); // Set background to black
  createSf(); // Add a starfield background
  setupL(); // Set up the lighting

  // draw the main sphere
  translate(width / 2, height / 2, 0); // Center the sphere 
  slowRs(); // slow rotation to the sphere
  drawSp(); // Draw the sphere
}


void createSf() {
  for (int i = 0; i < 150; i++) {
    stroke(255); // Set star color to white
    point(random(width), random(height)); // Randomly place stars
  }
}


void setupL() {
  ambientLight(100, 100, 100); // Soft overall light
  pointLight(250, 250, 250, width / 2, height / 2, 200); // Focused light source
}


void slowRs() {
  rotateY(frameCount * 0.005); // Slow rotation on the Y-axis
}


void drawSp() {
  shininess(50); // Make the sphere surface shiny
  fill(180 + sin(frameCount * 0.02) * 75, 180, 180); // Apply a dynamic color change
  sphere(160); // size of the sphere
}
