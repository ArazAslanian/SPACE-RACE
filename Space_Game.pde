
ArrayList stars1;
boolean fade1;
PImage Alien1;

PFont font;

void Game() {
  font = loadFont("VinerHandITC-40.vlw");
  
  background(0);

  Alien1 = loadImage("AlienAraz.png");
  Alien1.resize(400, 460);
  imageMode(CENTER);

  //creating the stars
  for (int s = 0; s <= 299; s++) {
    star1 star1Use = (star1) stars1.get(s);
    star1Use.display();
  }


  fill(random(117, 255), random(117, 255), random(117, 255));
  textFont(font, 40);
  text("SPACE RACE", 580, 160);
  textSize(30);
  text("Press the green button to start", 480, 688);



  image(Alien1, 700, 400);
}
class star1 {

  int xPos1, yPos1, starSize1;
  float fadeSpeed1;
  float brightness1;
  boolean fade1;



  star1() {
    fadeSpeed1 = random(8, 10); 
    starSize1 = int(random(2, 6));
    xPos1 = int(random(0, 1400));    //you can remove star size
    yPos1 = int(random(0, 800));    //you can remove star size

    brightness1 = random(10, 245);
    fade1 = true;
  } 
  void display() {

    if (brightness1 >= 245) {
      fade1 = false;
    }
    if (brightness1 <= 10) {
      fadeSpeed1 = random(10, 15);        // you can remove this
      starSize1 = int(random(2, 5));      // you can remove this
      fade1 = true;
      xPos1 = int(random(0, 1400));    // you can remove this
      yPos1 = int(random(0, 800));    // you can remove this
    }

    if (fade1 == true) {
      brightness1 += fadeSpeed1;
    }
    if (fade == false) {
      brightness1 -= fadeSpeed1;
    }


    fill(brightness1);
    ellipse(xPos1, yPos1, starSize1, starSize1);
  }
}