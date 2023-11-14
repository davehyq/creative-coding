//yinqi huang

float dis; //distance

void setup() {
  size(799, 500); 
  noStroke();
  dis = dist(0, 0, width, height); //  distance from the top-left corner to the bottom-right corner
}

void draw() {
  background(#9D7C05);
  //Loop through a grid on the canvas
  for(int i = 0; i <= width; i = i + 20) { // Horizontal grid lines
    for(int x = 0; x <= height; x = x + 20) { // Vertical grid lines
      float s = dist(mouseX, mouseY, i, x); //distance from the mouse to the current grid point
      s = s/dis * 130; // Map the distance to a value for ellipse size
      ellipse(i, x, s, s);
    }
  }
}
