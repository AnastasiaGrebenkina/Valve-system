import controlP5.*;
import processing.serial.*;
String Portname;

Serial serial;
int speed = 9600;

ControlP5 cp5;

void setup() {
  size(400,200);
  surface.setResizable(true);
  
  cp5 = new ControlP5(this);
  
  cp5.addScrollableList("comlist").close()
     .setPosition(150,35)
     .setSize(100, 100);
  cp5.addButton("refresh").linebreak()
                          .setSize(100,20);
  cp5.addButton("open").setPosition(10, 60);
  cp5.addButton("close").setPosition(100, 60).linebreak();
  
  cp5.addButton("LedOn").linebreak();
  cp5.addButton("LedOff").linebreak();

  
  //serial = new Serial(this, "COM9", speed);
}
void refresh() {
  String list[] = Serial.list();
  cp5.get(ScrollableList.class, "comlist").addItems(list);
}

void comlist(int n) {
  Portname = Serial.list()[n];
}

void open(){
  serial = new Serial(this, Portname, speed);
}

void closePort(){
  serial.stop();
}

void LedOn(){
  serial.write('n');
}

void LedOff() {
  serial.write('f');
}

void draw() {
}
