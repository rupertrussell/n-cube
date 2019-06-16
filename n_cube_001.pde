// see: https://en.wikipedia.org/wiki/6-cube
// n Points on a circle 
// by Rupert Russell
// 16 June 2019

int count = 0;
int scale  = 8;
float outerRadius = 200 * scale;
int es = 10 * scale; // small ellipse size
int numberOfPoints = 20;
float[] outerX = new float[numberOfPoints + 1];
float[] outerY = new float[numberOfPoints + 1];

void setup() {
  background(255); 
  size(3300, 3300);
  smooth(8);
  noLoop();
  strokeWeight(0.5 * scale);
}

void draw() {

  translate(width/2, height/2); 
  double step = 2 * PI/numberOfPoints; 
  double secondInnerStep = 2 * PI/numberOfPoints; 


  for (float theta=0; theta < 2 * PI; theta += step) {
    float x =  outerRadius * cos(theta);
    float y =  outerRadius * sin(theta); 
    fill(255, 0, 0);
    outerX[count] = x;
    outerY[count] = y;
    count = count + 1;
  }

  for (int firstCount = 0; firstCount < numberOfPoints; firstCount = firstCount + 1) {
    for (int secondCount = 0; secondCount < numberOfPoints; secondCount = secondCount + 1) {
      line(outerX[firstCount], outerY[firstCount], outerX[secondCount], outerY[secondCount] );
    }
  }

  fill(255, 0, 0);
  for (int count = 0; count < numberOfPoints; count = count + 1) {
    ellipse(outerX[count], outerY[count], es, es);
  }
  fill(255, 127, 0);
  ellipse(0, 0, es, es);

  save("20Points.png");
  exit();
}
