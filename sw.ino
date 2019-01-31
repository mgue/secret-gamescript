#include <Servo.h>
int dly = 15;
int sdly = 9;
int pause = 1000;
int pos = 0;
int posx = 60;
int posy = 112;
int s = 1;
Servo lift; int up = 60; int down = 0;

//dir lower makes it further from base, higher closer to base
Servo dir;
int ry = 95;
int ly = 104; //furthest point for shutting down drop reward
int hy = 104; // closest point
int sy = 1; // step increments close/far

//arm lower is left, higher is right 
Servo arm;
int rx = 65;
int lx = 76; // left most point for closing drop reward info
int hx = 76; //right most point
int sx = 1; // step increments on left/right

void setup() {
  dir.attach(10); dir.write(posy);delay(pause);dir.detach(); //init
  lift.attach(9); lift.write(up);delay(pause);lift.detach(); //init
  arm.attach(3); arm.write(posx);delay(pause);arm.detach(); //init  
}

void loop() {
  for (posy = ly; posy <= hy; posy += sy) {
    dir.attach(10);delay(pause);dir.write(posy);delay(pause);dir.detach(); //closeness of close button
    for (posx = lx; posx <= hx; posx += sx) { 
      arm.attach(3);delay(pause); arm.write(posx); delay(pause);arm.detach(); //left-right rundown
      lift.attach(9);
      for (pos = up; pos >= down; pos -= s) {
        lift.write(pos);
        delay(sdly);
      } 
      delay(dly);
      lift.write(up);
      delay(pause);
      lift.detach();
    }
  }
  //dir.attach(10);arm.attach(3);
  dir.write(ry); delay(pause);
  for (pos = hx; pos >= rx; pos -= sx) {
    arm.write(pos);
    delay(sdly);
  } delay(pause); for (pos = up; pos >= down; pos -= s) {
    lift.write(pos);
    delay(sdly);
  } delay(dly); lift.write(up); for (pos = rx; pos <= lx; pos += sx) {
    arm.write(pos);
    delay(sdly * 3);
  }
  delay(450);
  arm.write(lx);
  dir.write(ly);
  lift.write(90);
  dir.detach();
  lift.detach();
  arm.detach();
  delay(60000);
  //delay(1800000);
}
