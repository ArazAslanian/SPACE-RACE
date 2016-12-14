ArrayList stars2;
boolean fade2;
PImage Alien2;



void gameOver() {
  background(0);

  Alien2 = loadImage("AlienAraz.png");
  Alien2.resize(400, 460);
  imageMode(CENTER);

  //creating the stars
  for (int g = 0; g <= 299; g++) {
    star2 star2Use = (star2) stars2.get(g);
    star2Use.display();
  }

  fill(random(117, 255), random(117, 255), random(117, 255));
  textSize(50);
  text("GAME OVER", 580, 160);
  textSize(40);
  text("Press the green button to start again", 400,688);



  image(Alien2, 700, 400);

}
class star2 {

  int xPos2, yPos2, starSize2;
  float fadeSpeed2;
  float brightness2;
  boolean fade2;



  star2() {
    fadeSpeed2 = random(8, 10); 
    starSize2 = int(random(2, 6));
    xPos2 = int(random(0, 1400));    //you can remove star size
    yPos2 = int(random(0, 800));    //you can remove star size

    brightness2 = random(10, 245);
    fade2 = true;
  } 
  void display() {
  
    if (brightness2 >= 245) {
      fade2 = false;
    }
    if (brightness2 <= 10) {
      fadeSpeed2 = random(10, 15);        // you can remove this
      starSize2 = int(random(2, 5));      // you can remove this
      fade2 = true;
      xPos2 = int(random(0, 1400));    // you can remove this
      yPos2 = int(random(0, 800));    // you can remove this
    }

    if (fade2 == true) {
      brightness2 += fadeSpeed2;
    }
    if (fade == false) {
      brightness2 -= fadeSpeed2;
    }
    
    
    fill(brightness2);
    ellipse(xPos2, yPos2, starSize2, starSize2);

  }
}