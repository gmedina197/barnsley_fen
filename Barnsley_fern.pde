// Daniel Shiffman //<>//
// Barnsley Fern
// https://youtu.be/JFugGF1URNo

float x = 0;
float y = 0;
int r = 0, g = 255, b = 0;
ArrayList<Integer> colors = new ArrayList<Integer>();

void setup() {
  size(600, 600);
  background(255);
}

float genericFunction(float a, float b, float c) {
  return a * x + b * y + c;
}

void greenToYellow() {
  for (int r=0; r<100; r++) 
    colors.add(color(r*255/100, 255, 0));
}

void yellowToRed() {
  for (int g=100; g>0; g--)
    colors.add(color(      255, g*255/100, 0));
}

void redToPurple() {
  for (int b=0; b<100; b++) 
    colors.add(color(      255, 0, b*255/100));
}

void purpleToBlue() {
  for (int r=100; r>0; r--) 
    colors.add(color(r*255/100, 0, 255));
}

void blueToCyan() {
  for (int g=0; g<100; g++)
    colors.add(color(        0, g*255/100, 255));
}

void cyanToGreen() {
  for (int b=100; b>0; b--)
    colors.add(color(        0, 255, b*255/100));
  colors.add(color(0, 255, 0));
}

void nextPoint() {
  float nextX;
  float nextY;

  float r = random(1);

  if (r < 0.01) {
    // 1
    nextX =  0;
    nextY = genericFunction(0, 0.16, 0);

  } else if (r < 0.86) {
    // 2
    nextX = genericFunction(0.85, 0.04, 0);
    nextY = genericFunction(-0.04, 0.85, 1.6);
  } else if (r < 0.93) {
    // 3
    nextX = genericFunction(0.20, -0.26, 0);
    nextY = genericFunction(0.23, 0.22, 1.6);
  } else {
    // 4
    nextX = genericFunction(-0.15, 0.28, 0);
    nextY = genericFunction(0.26, 0.24, 0.44);
  }
  x = nextX;
  y = nextY;
}

void rainbowGradient() {
  greenToYellow();
  yellowToRed();
  redToPurple();
  purpleToBlue();
  blueToCyan();
  cyanToGreen();
}

// −2.1820 < x < 2.6558 and 0 ≤ y < 9.9983
void drawPoint(color c) {
  stroke(c);
  strokeWeight(2);
  float px = map(x, -2.1820, 2.6558, 0, width);
  float py = map(y, 0, 9.9983, height, 0);
  point(px, py);
}

void draw() {
  rainbowGradient();
  //1000 elementos verde
  
  for (int i = 0; i < 550; i++) {
    drawPoint(color(0, 0, 0));
    nextPoint();
  }
  //noLoop();
}
