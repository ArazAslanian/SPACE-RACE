ArrayList stars;
boolean fade;

PImage Alien;
PImage rocketBackground;

// position of the stars
float ndx;
float ndy;
float ndy1;
float ndx1;

// position of the alien
float alienX;
float alienY;

// position of the white planet
float xPlanet;


// becomes true when the player presses the start button


void first() {
 background(0);
 rocketBackground = loadImage("RocketFrameP.png");
 rocketBackground.resize(1400,800);
  Alien = loadImage("AlienAraz.png");
  Alien.resize(100, 96);
  imageMode(CENTER);

  //creating the stars
  for (int i = 0; i <= stars.size()-1; ++i) {
    star starUse = (star) stars.get(i);
    starUse.displays();
  }

  //you are at shooting star stage and alien
  if (shooting) {
   stroke(105, 105, 105);
  ndx = random(0, 1400);
  ndy = random(0, 800);
  ndx1 = ndx + random(50);
  ndy1 = ndy + random(50);
  for (int i = 1; i <= 1000; ++i) {
    fill(255);
    line(ndx, ndy, ndx1, ndy1);
  } 
  }

  
  
  if (alien) {
  image(Alien, alienX, alienY);
  alienX = alienX + random(-6,6);
  alienY = alienY + random(-6,6);
}

 
// the planet that can be moved
ellipse(xPlanet, 128, 200,200);


imageMode(CENTER);
image(rocketBackground,700,400);




}

// for creating stars
class star {

  int xPos, yPos, starSize;
  float fadeSpeed;
  float brightness;
  boolean fade;



  star() {
    fadeSpeed = random(4, 8); 
    starSize = int(random(2, 6));
    xPos = int(random(0, 1400));    //you can remove star size
    yPos = int(random(0, 800));    //you can remove star size

    brightness = random(10, 245);
    fade = true;
  } 
  void displays() {

    if (brightness >= 245) {
      fade = false;
    }
    if (brightness <= 10) {
      fadeSpeed = random(2, 5);        // you can remove this
      starSize = int(random(2, 5));      // you can remove this
      fade = true;
      xPos = int(random(0, 1400));    // you can remove this
      yPos = int(random(0, 800));    // you can remove this
    }

    if (fade == true) {
      brightness += fadeSpeed;
    }
    if (fade == false) {
      brightness -= fadeSpeed;
    }
    int speed = 1;
    if (faster) {
     speed = 10; 
     println("hi");
    }
   
    // animating the stars
    fill(255);
    ellipse(xPos, yPos, starSize, starSize);
    if (xPos >= width/2 && yPos >= height/2) { 
      xPos = xPos + speed;
      yPos = yPos + speed;
    }
    else if (xPos >= width/2 && yPos <= height/2) { 
      xPos = xPos + speed;
      yPos = yPos - speed;
    }
    else if (xPos <= width/2 && yPos <= height/2) { 
      xPos = xPos - speed;
      yPos = yPos - speed;
    }
    else if (xPos <= width/2 && yPos >= height/2) { 
      xPos = xPos - speed;
      yPos = yPos + speed;
    }
    
  }
}