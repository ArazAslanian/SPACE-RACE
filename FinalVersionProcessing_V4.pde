
// to enable playing sounds and serial communication
import processing.sound.*;
import processing.serial.*;

// defining the recordings 
SoundFile IM1;
SoundFile IM2;
SoundFile IM3;
SoundFile IM4;
SoundFile IM5;
SoundFile IM6;
SoundFile IM7;
SoundFile IM8;
SoundFile IM9;
SoundFile IM10;
SoundFile IM11;
SoundFile Coldplay;


Serial myPort;



// for flipping pages
int pageCounter;
boolean pageReset;
boolean page = false;

// for the ellipse transitioning between pages
int pageX;
int pageY;

// for the game
boolean alien = false;
boolean faster = false;
boolean shooting = false;
boolean bomb = false;

// for the stars in the first two pages and the last page
boolean arrayFirst = true;
boolean arrayGame = true;
boolean arrayFish = true;
boolean arrayOver = true;

// to play the recording once in the loop
boolean rec1 = true;
boolean rec2 = true;
boolean rec3 = true;
boolean rec4 = true;
boolean rec5 = true;
boolean rec6 = true;
boolean rec7 = true;
boolean rec8 = true;
boolean rec9 = true;
boolean rec10 = true;
boolean rec11 = true;
boolean Cold = true;

// for the crash page
boolean cons = false;
boolean balance = false;
boolean emergency = false;

void setup() {
  size(1400, 800);
//  enabling serial communication
  String portName = "COM3";
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');

  Coldplay = new SoundFile(this, "Coldplay.mp3");

  pageCounter = 0;
  pageX = 1720;
  pageY = 1376;
}

void draw() {

  if (Cold) {
    Coldplay.play();
    Coldplay.amp(0.1);
    Cold = false;
  }
  
  // This code calls different functions into the loop depending on the desired page to be displayed
  // start page:
  if (pageCounter ==0) {
    background(0);
    if (arrayFirst) {
      //creating the stars for the start page
      stars1 = new ArrayList();
      for (int s = 1; s <= 300; ++s) {
        stars1.add(new star1());
        arrayFirst = false;
      }
    }
    Game();
  } 
  // exploration page
  else if (pageCounter == 1) {
    // the array game statement is used so that it only calls this array once and only when needed (so that the whole sketch is not slow)
    if (arrayGame) {
      //creating the stars on the exploration page 
      stars = new ArrayList();
      for (int i = 1; i <= 300; ++i) {
        stars.add(new star());
        arrayGame = false;
      }
    }
    if (rec1) {
      IM1 = new SoundFile(this, "imG1.mp3");
      IM1.play();
      rec1 = false;
    }
    first();
  } 
  // rocket crashing page
  else if (pageCounter == 2) {
    IM1.stop();
    crash();
  } 
  // overfishing page
  else if (pageCounter == 3) {
    background(64, 164, 223);
    if (arrayFish) {
      //creating the fish for the overfishing page
      Fish = new ArrayList();
      for (int f = 1; f <= 600; ++f) {
        Fish.add(new Fish());
        arrayFish = false;
      }
    }
    if (rec8) {
      IM8 = new SoundFile(this, "imb8.mp3");
      IM8.play();
      rec8 = false;
    }
    fishyFish();
  } 
  //game theory page
  else if (pageCounter == 4) {
    IM8.stop();
    if (rec9) {
      IM9 = new SoundFile(this, "img9.mp3");
      IM9.play();
      rec9 = false;
    }
    background(245, 245, 220); 
    bus();
  } 
  // war page
  else if (pageCounter == 5) {
    IM9.stop();
    if (rec10) {
      IM10 = new SoundFile(this, "imG10.mp3");
      IM10.play();
      rec10 = false;
    }
    bomb = true;
    background(255);
    war();
  } 
  //game over page
  else if (pageCounter == 6) {
    background(0);
    IM10.stop();
    if (rec11) {
      IM11 = new SoundFile(this, "imG11.mp3");
      IM11.play();
      rec11 = false;
    }
    if (arrayOver) {
      //creating the stars on the Space Game Over page
      stars2 = new ArrayList();
      for (int g = 1; g <= 300; ++g) {
        stars2.add(new star2());
        arrayOver = false;
      }
    }
    gameOver();
  } 
  // resetting variables to restart game
  else if (pageCounter == 7) {

    pageCounter = 0;
    alien = false;
    faster = false;
    shooting = false;
    bomb = false;
    emergency = false;
    NumFish = 250;
    //IM1.jump(0);
    //IM2.jump(0);
    //IM3.jump(0);
    //IM4.jump(0);
    //IM5.jump(0);
    //IM6.jump(0);
    //IM7.jump(0);
    //IM8.jump(0);
    //IM9.jump(0);
    //IM10.jump(0);
    //IM11.jump(0);
    IM1.stop();
    IM2.stop();
    IM3.stop();
    IM4.stop();
    IM5.stop();
    IM6.stop();
    IM7.stop();
    IM8.stop();
    IM9.stop();
    IM10.stop();
    IM8.stop();
    IM9.stop();
    IM11.stop();
    Coldplay.stop();

    IM1 = new SoundFile(this, "imG1.mp3");
    IM2 = new SoundFile( this, "imb2.mp3");
    IM3 = new SoundFile( this, "imb3.mp3");
    IM4 = new SoundFile( this, "imb4.mp3");
    IM5 = new SoundFile( this, "imb5.mp3");
    IM6 = new SoundFile ( this, "img6.mp3");
    IM7 = new SoundFile (this, "img7.mp3");
    IM8 = new SoundFile(this, "imb8.mp3");
    IM9 = new SoundFile(this, "img9.mp3");
    IM10 = new SoundFile(this, "imG10.mp3");  
    IM11 = new SoundFile(this, "imG11.mp3");
    Coldplay = new SoundFile(this, "Coldplay.mp3");

    rec1 = true;
    rec2 = true;
    rec3 = true;
    rec4 = true;
    rec5 = true;
    rec6 = true;
    rec7 = true;
    rec8 = true;
    rec9 = true;
    rec10 = true;
    rec11 = true;
    Cold = true;
    counter1G = 3.92699081698;
    counter2G = 6.28319;
    counter1R = 3.92699081698;
    counter2R = 6.28319;
    counter = 0;
    personMove = 0;
    counterPlanet = 0;
  }

  // animation for smooth transition between pages:
  if (pageReset) {
    pageX = 1720;
    pageY = 1720;
    pageReset = false;
    page = true;
  }
  if (page) {
    noStroke();
    fill(255);
    ellipse(700, 500, pageX, pageY);
    pageX = pageX - 300;
    pageY = pageY - 300;
  }
  if (pageX <=10 || pageY <= 10) {
    page = false;
  }
}

void mousePressed() {
  pageCounter = pageCounter +1;
  pageReset = true;
}

//void keyPressed() {
//  if (key == 'd') {
//    alien = true; 
//    alienX = random(0, 700);
//    alienY = random(85, 295);
//  }
//  if (key == 'f') {
//    faster = true;
//  }
//  if (key == 's') {
//    shooting = true;
//    crash = true;
//  }
//}

// serial communication
void serialEvent(Serial myPort) {
  String message = myPort.readString().trim();
  println(message);
  if (message.equals("GreenBut")) {
    pageCounter = pageCounter +1;
    pageReset = true;
    alien = false;
    shooting = false;
    //alien = true;
  } else if (message.equals("BlueBut")) {
    alien = true; 
    alienX = random(0, 700);
    alienY = random(85, 295);
  } else if (message.equals("YellowBut")) {
    shooting = true;
  } else if (message.equals("RedBut")) {
    pageCounter = 7;
    pageReset = true;
  } else if (message.equals("speed1")) {
    faster = true;
  } else if (message.equals("speed0")) {
    faster = false;
  } else if (message.equals("conservative")) {
    cons = true;
    balance = false;
  } else if (message.equals("balanced")) {
    cons = false;
    if (counterPlanet >= 500) {
      balance = true;
    }
  } else if (message.equals("emergency")) {
    if (counterPlanet >= 1100) {
      emergency = true;
    }
  }
  xPlanet = float(message);
}