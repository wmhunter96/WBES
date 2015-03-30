import processing.serial.*;

Serial serial;

int posI[];
int pos[];

void setup() {
  size(400,400);
  background(255);
  
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 9600);
}

void draw() {
  while(serial.available() >= 2) {
    for (int i=0;i<2;i++) {
      pos[i] = serial.read();
    }
  
    line(posI[0], posI[1], pos[0],pos[1]);
    posI[0] = pos[0];
    posI[1] = pos[1];
  }
}

void keyPressed() {
  if(key == 's' || key == 'S') {
    save("Screenshot.png");
  }
}
