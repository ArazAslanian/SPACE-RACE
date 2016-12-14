ArrayList Fish;
PImage Fishy;
PImage Net;
int NumFish = 250;


// almost same code as stars page but uses images of fish rather than ellipses
void fishyFish() {
  Fishy = loadImage("TunaAraz.png");
  Fishy.resize(160, 96);
  Net = loadImage("FishNetP.png");
  imageMode(CORNER);
  Net.resize(1400, 800);
  for (int f = 0; f <= NumFish; f++) {
    Fish FishUse = (Fish) Fish.get(f);
    FishUse.displayFishy();
  }
  NumFish = NumFish - 5;
  delay(100);
  
  if (NumFish == -15) {
   pageCounter++;
   pageReset = true;
  }

  image(Net, 0, 0);
}
class Fish {
  int xPosF, yPosF;
  
   

  Fish() {

    
    xPosF = int(random(0, 1400));    //you can remove star size
    yPosF = int(random(0, 800)); 

    
  }
  void displayFishy() {
    image(Fishy, xPosF, yPosF);

  }
}