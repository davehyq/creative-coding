//yinqi huang

float a;  // store the current angle of rotation
float o = PI/25.0; //Offset angle between each box
int n = 12; // Number of boxes

void setup() { 
  size(700, 500, P3D); //3D
  noStroke();
 
} 
 

void draw() {
  lights();
  background(#F0DFBD);
  translate(width/2, height/2); //move to the center 
  //loop to create each box
  for(int i = 0; i < n; i++) {
    float g = map(i, 0, n-1, 255, 0); // Gradually decrease the fill color from white to black
    pushMatrix();
    fill(g); 
    
    //rotation transformations to the current box
    rotateY(a + o*i); //rotate around the Y-axis 
    rotateX(a/2 + o*i); //rotate around the X-axis  
    box(220); //how big the size of the whole thing
    popMatrix();
  }
  
  a = a + 0.003; // Control the speed of spinning
} 
