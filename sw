  #include <Servo.h>
int dly = 15;
int sdly = 9;
int pause = 300;
int pos = 0;
int posx = 0;
int posy = 0;
Servo lift; int up = 60; int down = 0;
Servo arm;
int rx = 65;
int lx = 81; // left most point for closing drop reward info
int hx = 83; //right most point
int sx = 1; // step increments on left/right

//dir lower makes it further from base, higher closer to base
Servo dir;
int ry = 90;
int ly = 108; //furthest point for shutting down drop reward
int hy = 109; // closest point
int sy = 1; // step increments close/far
void setup() {
}

void loop() {
  dir.attach(10); dir.write(90);
  lift.attach(9); lift.write(up);
  arm.attach(3); arm.write(lx);
  for (posy = ly; posy <= hy; posy += sy) {
    for (posx = lx; posx <= hx; posx += sx) {
      delay(dly); dir.write(posy); arm.write(posx); delay(pause); for (pos = up; pos >= down; pos -= 1) {
        lift.write(pos);
        delay(sdly);
      } delay(dly); lift.write(up);
    }
  }
  delay(dly); dir.write(ry); for (pos = lx; pos >= rx; pos -= 1) {
    arm.write(pos);
    delay(sdly * 3);
  } delay(pause); for (pos = up; pos >= down; pos -= 1) {
    lift.write(pos);
    delay(sdly);
  } delay(dly); lift.write(up); for (pos = rx; pos <= lx; pos += 1) {
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
  delay(30000);
  //delay(1800000);
}
