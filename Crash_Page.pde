// counters for the narrative part of the game
int counterPlanet = 0;

// annimation of the bomb made from ellipses
int rocketbombX = 1;
int rocketbombY = 1;


void crash() {
  background(0);
  noStroke();

  if (rec2) {
    IM2 = new SoundFile( this, "imb2.mp3");
    IM2.play();
    rec2 = false;
  }

  if (counterPlanet >= 170) {
    if (rec3) {
      IM3 = new SoundFile( this, "imb3.mp3");
      IM3.play();
      rec3 = false;
    }
    if (cons) {
      IM3.stop();
      if (rec4) {
        IM4 = new SoundFile( this, "imb4.mp3");
        IM4.play();
        rec4 = false;
      }
      ellipse(700, 80, 500, 500);
    }
  }
  if (counterPlanet >= 700) {
    IM4.stop();
    if (balance) {
      if (rec5) {
        IM5 = new SoundFile( this, "imb5.mp3");
        IM5.play();
        rec5 = false;
      }
      ellipse(700, 80, 800, 800);
    }
  }

  if (counterPlanet >= 1000) {
    IM5.stop();
    if (rec6) {
      IM6 = new SoundFile ( this, "img6.mp3");
      IM6.play();
      rec6 = false;
    }
  }



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


  fill(random(255), random(255), random(255));
  ellipse(700, 80, 200, 200);



  if (alien) {
    image(Alien, alienX, alienY);
    alienX = alienX + random(-6, 6);
    alienY = alienY + random(-6, 6);
  }
  imageMode(CENTER);
  image(rocketBackground, 700, 400);

  if (emergency) {
    for (int i = 0; i < 20; i++) {
      fill(random(240, 255), random(30, 108), 44);
      ellipse(500, 400, rocketbombX, rocketbombY);
      rocketbombX = rocketbombX + 20;
      rocketbombY = rocketbombY + 20;
    }
  }
  if (counterPlanet >= 1300) {
    IM6.stop();
    if (rec7) {
      IM7 = new SoundFile (this, "img7.mp3");
      IM7.play();
      rec7 = false;
    }
  }
  counterPlanet++;

  // for going to the next page
  if (counterPlanet >= 1700) {
    pageCounter++; 
    pageReset = true;
  }
}