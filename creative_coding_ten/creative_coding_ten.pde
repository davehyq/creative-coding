//yinqi huang
//animation

float t; // Time variable for animation
color currentColor; // Current color of the shape

void setup() {
  size(1000, 800);
  noFill();
  strokeWeight(2);
  currentColor = color(#F5A1A1);
}

void draw() {
  background(0); //black
  translate(width / 2, height / 2); //center

  // Update stroke color over time
  currentColor = lerpColor(color(#F5A1A1), color(#A1F5DA), (sin(t) + 1) / 2);
  stroke(currentColor);

  // Draw the superformula shape
  drawSuperShape();

  // Increment time
  t += 0.1;
}

void drawSuperShape() {
  beginShape();
  for (float i = 0; i <= 2 * PI; i += 0.01) {
    float d = superFormula(i, 3, 3, 6, 1, sin(t) * 0.5 + 0.5, cos(t) * 0.5 + 0.5);
    float x = d * cos(i) * 80; 
    float y = d * sin(i) * 80;
    vertex(x, y);
  }
  endShape(); //finish drawing the shape
}
// Function to calculate the radius based on the superformula
float superFormula(float theta, float a, float b, float m, float n1, float n2, float n3) {
  return pow(pow(abs(cos(m * theta / 4.0) / a), n2) + pow(abs(sin(m * theta / 4.0) / b), n3), -1.0 / n1);
}
