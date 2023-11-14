//yinqi huang

int yx = 1; //y axis
int xx = 2; //x axis
color a1, a2, b1, b2;

void setup() {
  size(640, 450);
  //colors
  a1 = color(255);
  a2 = color(0);
  b1 = color(#CC6600);
  b2 = color(#047C2E);
  noLoop();
}

void draw() {
  //set up the funchtion gardient
  GD(0,0, width/2, 500, a1, a2, xx);
  GD(width/2, 0, width/2, 500, a2, a1, xx);
  GD(50, 90, 540, 80, b1, b2, yx);
  GD(50, 190, 540, 80, b2, b1, xx);
}

void GD(int x, int y, float q,float h, color b1, color b2, int ax) {
  noFill();
  if (ax == yx) { 
    for (int i = y; i <= y + h; i++) {
      float inter = map(i, y, y + h, 0, 1);
      color b = lerpColor(b1, b2, inter);
      stroke(b);
      line(x, i, x + q, i);
    }
  }  
 else if (ax == xx) {  
    for (int i = x; i <= x + q; i++) {
      float inter = map(i, x, x + q, 0, 1);
      color b = lerpColor(b1, b2, inter);
      stroke(b);
      line(i, y, i, y + h);
    }
  }
}
