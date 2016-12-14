PImage war1;
PImage war2;
PImage war3;
PImage war4;
float  counter1G = 3.92699081698;
float  counter2G = 6.28319;
float counter1R = 3.92699081698;
float counter2R = 6.28319;
float  circleSize = 110;
float  ScircleSize =1;

void war() {
  war1 = loadImage("War1.png");
  war2 = loadImage("War2.png");
  war3 = loadImage("war3.png");
  war4 = loadImage("war4.png");
  war1.resize(700,400);
  war2.resize(700,400);
  war3.resize(700,400);
  war4.resize(700,400);
  imageMode(CORNER);
  image(war1,0,0);
  image(war2, 700,0);
  image(war3,0,400);
  image(war4,700,400);
  
  
  
  //draws the bomb:
  stroke(255, 0, 0);
  strokeWeight(2);
  noFill();
  arc(1040, 640, 160, 160, counter1R, counter2R);
  stroke(105, 105, 105);
  noFill();
  strokeWeight(6);
  arc(1040, 640, 160, 160, counter1G, counter2G);

  //animates the bomb
  if (bomb) {
    delay(500);

    counter1G = counter1G + 0.3;
    counter2G = counter2G + 0.3;
    counter1R = counter1R + 0.25;
    counter2R = counter2R + 0.25;
  }


  // the body of the bomb
  fill(0);
  stroke(0);
  ellipse(1100, 720, 220, 220);

  // the bomb explodes:
  if (counter1G >= 6.6) {
    bomb = false;
    fill(255, 0, 0);
    noStroke();
    ellipse(1100, 720, circleSize, circleSize);
    for (int i = 0; i < 20; i++) {
      fill(random(240, 255), random(30, 108), 44);
      ellipse(500, 400, ScircleSize, ScircleSize);
      circleSize = circleSize + 20;
      ScircleSize = ScircleSize + 20;
    }
    
  }

if (circleSize >=  5800) {
pageCounter ++;
pageReset = true;

}

}