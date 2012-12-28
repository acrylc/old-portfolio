/* --- Drawing a circle --- */
/*
size(500, 300); 
 background(255); 
 strokeWeight(5); 
 smooth();
 float radius = 100; 
 int centX = 250; 
 int centY = 150;
 stroke(0, 30);
 noFill(); 
 ellipse(centX, centY, radius*2, radius*2);
 stroke(20, 50, 70);
 float x, y;
 float lastx = -999;
 float lasty = -999;
 for (float ang = 0; ang <= 360; ang += 5) {
 float rad = radians(ang);
 x = centX + (radius * cos(rad)); 
 y = centY + (radius * sin(rad)); 
 point(x, y);
 }
 */

/* --- Drawing a spiral --- */
/*
size(500, 300);
 background(255);
 float radius = 10;
 float centerX = 250;
 float centerY = 150;
 float lastx = centerX+10;
 float lasty = centerY;

 for (float angle = 0; angle <360*4; angle+=5) {
 float rad = radians(angle);
 float x = centerX + radius*cos(rad);
 float y = centerY + radius*sin(rad); 
 radius += 0.5;
 line(x, y, lastx, lasty);
 lastx = x;
 lasty = y;
 }
 */

/* --- Drawing a spiral with noise --- */
/*
size(500, 300);
 background(255);
 strokeWeight(0.5);

 for (int i = 0;i<100;i++) {
 float radius = 10;
 float centerX = 250;
 float centerY = 150;
 float lastx = centerX+10;
 float lasty = centerY;
 float radiusNoise = random(10);
 stroke(random(80), random(70), random(100), 80);
 int startangle = int(random(360));
 int endangle = 1440 + int(random(1440));
 int anglestep = 5 + int(random(3));
 for (float angle = startangle; angle <= endangle; angle += anglestep) {
 radiusNoise += 0.05;
 float thisRadius = radius + (noise(radiusNoise)*200)-100;
 float rad = radians(angle);
 float x = centerX + thisRadius*cos(rad);
 float y = centerY + thisRadius*sin(rad); 
 radius += 0.5;
 line(x, y, lastx, lasty);
 lastx = x;
 lasty = y;
 }
 }
 */

/* --- Circle with custom noise --- */
/*
void setup () { 
 size(500, 300); 
 background(255); 
 strokeWeight(5); 
 smooth();
 float radius = 100; 
 int centX = 250; 
 int centY = 150;
 stroke(0, 30);
 noFill(); 
 ellipse(centX, centY, radius*2, radius*2);
 stroke(20, 50, 70); 
 strokeWeight(1);

 float x, y;
 float noiseval = random(10);
 float radVariance, thisRadius, rad; 
 beginShape();
 fill(20, 50, 70, 50); 
 for (float ang=0;ang<=360;ang+=1) {
 noiseval += 0.1;
 radVariance = 30 * customNoise2(noiseval);
 thisRadius = radius + radVariance; 
 rad = radians(ang);
 x = centX + (thisRadius * cos(rad)); 
 y = centY + (thisRadius * sin(rad));
 curveVertex(x, y);
 }
 endShape();
 }
 float customNoise(float value) { 
 float retValue = pow(sin(value), 3); 
 return retValue;
 }

 float customNoise2(float value) {
 int count = int((value % 12));
 float retValue = pow(sin(value), count); 
 return retValue;
 }
 */

/* --- Wave Clock --- */
float _angnoise, _radiusnoise; 
float _xnoise, _ynoise,_znoise;
float _angle = -PI/2;
float _radius;
float _strokeCol = 254; 
int _strokeChange = -1;
void setup() {
  size(1300, 700); 
  smooth(); 
  frameRate(30); 
  background(255); 
  noFill();
  _angnoise = random(10); 
  _radiusnoise = random(10); 
  _xnoise = random(10); 
  _ynoise = random(10);
	_znoise = random(10);

}
void draw() {
 // fill(255,4);
 // rect(0,0,1000,1000);
  _radiusnoise += 0.005;
  _radius = (noise(_radiusnoise) * 300) +1;
  _angnoise += 0.005;
  _angle += (noise(_angnoise) * 6) - 3; 
  if (_angle > 360) { 
	_angle -= 360;
  }
  if (_angle < 0) { 
	_angle += 360;
  }
  _xnoise += 0.01;
  _ynoise += 0.01;
  float centerX = width/6 + (noise(_xnoise) * 100) - 50; 
  float centerY = height/2.5 + (noise(_ynoise) * 100) - 50;
  float centerZ = width/6 + (noise(_ynoise) * 100) - 50;

  float rad = radians(_angle);
  float x1 = centerX + (_radius * cos(rad)); 
  float y1 = centerY + (_radius * sin(rad));
  float z1 = centerZ + (_radius * tan(rad));

  float opprad = rad + PI;
  float x2 = centerX + (_radius * cos(opprad)); 
  float y2 = centerY + (_radius * sin(opprad));
	float z2 = centerZ + (_radius * tan(opprad));

  float b = rad+PI/2;

  _strokeCol += _strokeChange;
  if (_strokeCol > 254) { 
	_strokeChange = -1;
  } 
  if (_strokeCol < 0) { 
	_strokeChange = 1;
  } 
  stroke(_strokeCol, 10, 150, 10);
  //fill(_strokeCol, 10, 150, 10);

  strokeWeight(1); 
  triangle(x1, x2,y1,y2,z1,z2);
}

