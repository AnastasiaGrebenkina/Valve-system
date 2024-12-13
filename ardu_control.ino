void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(13,1);

}

void loop() {
  if (Serial.available()) {
    char c = Serial.read();
    switch(c) {
      case 'n':
        digitalWrite(13,1);
        break;
      case 'f':
        digitalWrite(13,0);
        break;
    }
  }
  // put your main code here, to run repeatedly:

}
