#include <Servo.h>
Servo arm;
Servo lift; 
int liftpos = 0;
int armpos = 0;
int aok = 90;
int arp = 80;
int up = 120;
int down = 45;

void setup() {
  arm.attach(3);
  lift.attach(9);
  lift.write(down);  
  arm.write(arp);
}

void loop() {
  for (liftpos = down; liftpos <= up; liftpos += 10) { lift.write(liftpos); delay(15); }
  delay(3000);
  lift.write(down);  
  delay(450);
  for (liftpos = down; liftpos <= up; liftpos += 10) { lift.write(liftpos); delay(15); }
  delay(3000);
  lift.write(down);  
  delay(450);
  for (liftpos = down; liftpos <= up; liftpos += 10) { lift.write(liftpos); delay(15); }
  delay(450);
  for (armpos = arp; armpos <= aok; armpos += 1) { arm.write(armpos); delay(150); }
  delay(3000);
  lift.write(down);  
  delay(450);
  for (liftpos = down; liftpos <= up; liftpos += 10) { lift.write(liftpos); delay(15); }
  delay(450);
    for (armpos = aok; armpos >= arp; armpos -= 1) { arm.write(armpos); delay(150); }
  delay(2100);
  lift.write(down);  
  delay(450);
  for (liftpos = down; liftpos <= up; liftpos += 10) { lift.write(liftpos); delay(15); }  
  delay (45000);
}
