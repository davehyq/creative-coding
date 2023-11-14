//yinqi Huang

// Cellular Automaton Experiment (CAE)
CAE cae; //variables

void setup() {
  size(700, 500);
  int[] rs= {0,1,0,1,1,0,1,0};// Define the rule system for the automaton
  cae = new CAE(rs); // Initialize the CAE with the rules
  background(0); //black background
}

void draw() {
  cae.r();  //render the current state of the CAE
  cae.gen(); // Generate the next generation
  
  // Reset when it reaches the end of the canva
  if (cae.fin()) {  //fin
    background(0);
    cae.ran(); //randomaize 
    cae.rst();//reset the CAE
  }
}

void mousePressed() {
  background(0);
  cae.ran();
  cae.rst();
}

class CAE {
  int[] cel;// Array to store the state of each cell
  int geion; // Counter for the number of generations
  int scl;  // Size of each cell
  int[] rl;  //Rules for the automation's behavior
  //constructor
  CAE(int[] r) {
    rl = r; 
    scl = 1; //size of each cell is 1
    cel = new int[width/scl]; //cell states
    rst(); //reset
  }
  
void setrl(int[] r) { //rule of CAE
    rl = r;
  }

void ran() {  //randomize the rules for the automaton
    for (int i = 0; i < 8; i++) {
      rl[i] = int(random(2));
    }
  }
  
  //Reset the state
void rst() {
    for (int i = 0; i < cel.length; i++) {
      cel[i] = 0; //turn off all cells
    }
    cel[cel.length/2] = 1; //activate the middle cell
    geion = 0; // reset generation count
  }


void gen() {   // creating the new generation
    int[] nextgen = new int[cel.length]; // create an empty array
    for (int i = 1; i < cel.length-1; i++) {
      int left = cel[i-1]; // State of the left neighbor
      int cu = cel[i];  // Current state
      int right = cel[i+1]; // Right state
      
      nextgen[i] = executerl(left,cu,right); //determine the next state
    }
    // Copy the array into current value
    for (int i = 1; i < cel.length-1; i++) {
      cel[i] = nextgen[i];
    }
    geion++;
  }
  
  void r() {  // draw the cells 
    for (int i = 0; i < cel.length; i++) {
      if (cel[i] == 1) {
        fill(255); //color it white when cells is alive
      } else { 
        fill(0); //color it black when cells is dead
      }
      noStroke();
      rect(i*scl,geion*scl, scl,scl); //draw the cells
    }
  }

  int executerl (int a, int b, int c) { // Execute the rule based on the states of neighboring cells
    if (a == 1 && b == 1 && c == 1) { return rl[0]; }
    if (a == 1 && b == 1 && c == 0) { return rl[1]; }
    if (a == 1 && b == 0 && c == 1) { return rl[2]; }
    if (a == 1 && b == 0 && c == 0) { return rl[3]; }
    if (a == 0 && b == 1 && c == 1) { return rl[4]; }
    if (a == 0 && b == 1 && c == 0) { return rl[5]; }
    if (a == 0 && b == 0 && c == 1) { return rl[6]; }
    if (a == 0 && b == 0 && c == 0) { return rl[7]; }
    return 0;
  }
  
boolean fin() {  //check if the automaton has filled the canvas
    if (geion > height/scl) {
       return true;
    } else {
       return false;
    }
  }
}
