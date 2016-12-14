//fix this once you figure out the slowing down thingy

// declaring images
PImage person1N1;
PImage person2N1;
PImage person1Happy;
PImage person2Happy;
PImage person1Sad;
PImage person2Sad;
PImage bigHouse;
PImage house1;
PImage house2;

// declaring variables to animate the two people
float person1X;
float person2X;
float person1Y;
float person2Y;


// counters for animation
int counter = 0;
int personMove = 0;
PImage person1N;
PImage person2N;



void bus() {
  person1N1 = loadImage("PersonOrangeN.png");
  person1N1.resize(80, 128);
  imageMode(CENTER);
  person2N1 = loadImage("PersonBlueN.png");
  person2N1.resize(80, 128);
  imageMode(CENTER);
  person1Happy = loadImage("PersonOrange.png");
  person1Happy.resize(80, 128);
  imageMode(CENTER);
  person1Sad = loadImage("PersonOrangeSad.png");
  person1Sad.resize(80, 128);
  imageMode(CENTER);
  person2Happy = loadImage("PersonBlue.png");
  person2Happy.resize(80, 128);
  imageMode(CENTER);
  person2Sad = loadImage("PersonBlueSad.png");
  person2Sad.resize(80, 128);
  imageMode(CENTER);
  bigHouse = loadImage("GoodHouse.png");
  bigHouse.resize(300, 300);
  imageMode(CENTER);
  house1 = loadImage("Offer1.png");
  house1.resize(150, 150);
  imageMode(CENTER);
  house2 = loadImage("Offer2.png");
  house2.resize(150, 150);
  imageMode(CENTER);
  image(bigHouse, 700, 180);
  image(house1, 350, 640);
  image(house2, 1050, 640);



  if (counter <= 200 && counter >= 0) {
    person1X = 525;
    person1Y = 400;
    person2X = 875;
    person2Y = 400;

    person1N = person1N1;
    person2N = person2N1;
    image(person1N, person1X, person1Y);
    image(person2N, person2X, person2Y);
  } else if (counter <= 300 && counter >= 200 ) {
    personMove = -40;
    image(person1N, person1X, person1Y);
    image(person2N, person2X, person2Y);
    person1Y = person1Y + personMove;
    person2Y = person2Y + personMove;
  } else if (counter <= 500 && counter >= 300) {

    person1N = person1Happy;
    person2N = person2Happy;
    image(person1N1, person1X, person1Y);
    image(person2N1, person2X, person2Y);
    image(person1Happy, person1X, person1Y);
    image(person2Happy, person2X, person2Y);
    fill(0);
    textSize(50);
    fill(255, 85, 0);
    text("Profit: 70", 440, 400);
    fill(0, 255, 213);
    text("Profit: 70", 800, 400);
  } else if (counter <= 750 && counter >= 500) {

    personMove = 40;
    person1N = person1N1;
    person2N = person2N1;
    image(person1N, person1X, person1Y);
    image(person2N, person2X, person2Y);
    person1Y = person1Y + personMove;
  } else if (counter <= 900 && counter >= 750) {
    person1N = person1Happy;
    person2N = person2Sad;
    image(person1N, person1X, person1Y);
    image(person2N, person2X, person2Y);
    fill(0, 255, 213);
    text("Profit: 33", 800, 400);
    fill(255, 85, 0);
    text("profit: 85", 300, 768);
  } else if (counter <= 1150 && counter >= 900) {
    personMove = 40;
    person1N = person1N1;
    person2N = person2N1;
    image(person1N, person1X, person1Y);
    image(person2N, person2X, person2Y);
    person2Y = person2Y + personMove;
  } else   if (counter >= 1150 && counter <= 1400) {
    person1N = person1Sad;
    person2N = person2Sad;
    image(person1N, person1X, person1Y);
    image(person2N, person2X, person2Y);
    fill(0, 255, 213);
    text("Profit: 40", 900, 770);
    fill(255, 85, 0);
    text("profit: 40", 300, 770);
  } else if (counter >= 1300) {
    pageCounter++;
  }
  counter = counter + 25;
}