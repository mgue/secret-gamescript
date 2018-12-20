/* Sweep
 by BARRAGAN <http://barraganstudio.com>
 This example code is in the public domain.

 modified 8 Nov 2013
 by Scott Fitzgerald
 http://www.arduino.cc/en/Tutorial/Sweep
*/

#include <Servo.h>
Servo arm;
Servo lift; 
int pos = 0;
int aok = 90;
int arp = 45;
int up = 120;
int down = 15;
void setup() {
  arm.attach(10);
  lift.attach(9);
  arm.write(aok); // initial pen position
  lift.write(up); //(lifts pen)
}

void loop() {
  lift.write(up); //(lifts pen)
  delay(3000);
  lift.write(down); // (sets pen)
  delay(500);
  lift.write(up); //(lifts pen)
  delay(3000);
  lift.write(down); // (sets pen)
  delay(500);
  lift.write(up); //(lifts pen)
  delay(3000);
  lift.write(down); // (sets pen)
  delay(500);
  lift.write(up); //(lifts pen)
  delay(3000);
  arm.write(arp);
  delay(3000);
  lift.write(down); // (sets pen)
  delay(500);
  lift.write(up); //(lifts pen)
  delay(3000);
  arm.write(aok);
  delay(3000);
}
