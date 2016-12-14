const int buttonGreen = 12;
const int buttonRed = 11;
const int buttonBlue = 9;
const int buttonYellow = 10;
const int smallPlanet = A2;
const int speedPin = A0;
const int fuelPin = 7;
const int pinEmer = 4;


int sensorVal;
int planetVal;

boolean Green = true;
boolean Red = true;
boolean Yellow = true;
boolean Blue = true;

boolean emerg = true;


boolean fSpeed = false;
boolean fSpeed0 = false;

boolean fuelC = true;
boolean fuelB = true;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(buttonGreen, INPUT_PULLUP);
  pinMode(buttonRed, INPUT_PULLUP);
  pinMode(buttonYellow, INPUT_PULLUP);
  pinMode(buttonBlue, INPUT_PULLUP);
  pinMode(fuelPin, INPUT_PULLUP);
  pinMode(pinEmer, INPUT_PULLUP);

}

void loop() {
  // put your main code here, to run repeatedly:
  sensorVal = analogRead(speedPin);
 Serial.println(sensorVal);
//  // delay(1000);
//  if (sensorVal <= 0) {
//    fSpeed0 = true;
//  }

  planetVal = analogRead(smallPlanet);
  //
  //Serial.print(planetVal);
  //delay(1000);
  //
//

  if (planetVal <= 60) {
    fSpeed = true;

  if (fSpeed) {
    Serial.println("speed1");
    fSpeed = false;
  }
  }
  

  if (planetVal >= 60) {
    fSpeed0 = true;
if (fSpeed0) {
   Serial.println("speed0");
    fSpeed0 = false;

  }
  
  }

  
  if (digitalRead(fuelPin) == HIGH) {
    fuelB = true;
    if (fuelC) {
    fuelC = false;
    Serial.println("balanced");
    }
  }
  if (digitalRead(fuelPin) == LOW) {
    fuelC = true;
    if (fuelB) {
      fuelB = false;
      Serial.println("conservative");
    }
  }
   if (digitalRead(pinEmer) == LOW) {

    if (emerg == true) {
      emerg = false;
      Serial.println("emergency");
    }


  } else {
    emerg = true;
  }
  
  if (digitalRead(buttonGreen) == LOW) {

    if (Green == true) {
      Green = false;
      Serial.println("GreenBut");
    }


  } else {
    Green = true;
  }
  if (digitalRead(buttonBlue) == LOW) {

    if (Blue == true) {
      Blue = false;
      Serial.println("BlueBut");
    }


  } else {
    Blue = true;
  }
  if (digitalRead(buttonYellow) == LOW) {

    if (Yellow == true) {
      Yellow = false;
      Serial.println("YellowBut");
    }


  } else {
    Yellow = true;
  }
  if (digitalRead(buttonRed) == LOW) {

    if (Red == true) {
      Red = false;
      Serial.println("RedBut");
    }


  } else {
    Red = true;
  }

  //  if (digitalRead(buttonBlue) == LOW) {
  //    if (Blue = true) {
  //      Blue = false;
  //      Serial.println("BlueBut");
  //    }
  //  }
  //
  //  }
  //  if (digitalRead(buttonRed) == LOW) {
  //    Red = true;
  //  }
  //  if (Red) {
  //  Serial.println("RedBut");
  //    Red = false;
  //  }
  //  if (digitalRead(buttonYellow) == LOW) {
  //    Yellow = true;
  //  }
  //  if (Yellow) {
  //  Serial.println("YellowBut");
  //    Yellow = false;
  //  }
}
