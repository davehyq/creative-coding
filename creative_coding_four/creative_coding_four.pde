//yinqi huang

void setup() {
  size(700, 500); 
  background(0); 
}

void draw() {
  background(0);
  // grid positions
  for (int x = 40; x <= width - 40; x += 40) {
    for (int y = 40; y <= height - 40; y += 40) {
      // Draw white squares
      noStroke();
      fill(255); // white dots
      rect(x - 1, y - 1, 3, 3);

      // Draw lines pointing towards the mouse position
      stroke(255, 100); // White lines with fixed opacity
      line(x, y, mouseX, mouseY);
    }
  }
}
