class Config {
  public boolean debug = false;

  int textSize = 32;
  int textMargin = 10;
  color backGround = 126;
  float distanceAccelerator = 1.05;

  int infoTimeout = 7000;
  int infoFlashTime = 5550;

  color elephantFillColor = color(165, 157, 157);
  color elephantStrokeColor = color(98, 84, 84);
  float elephantStrokeWeight = 10;
  int elephantXMargin = 110;
  int elephantYMin = 140;
  int elephantYMax = 370;
  int elephantSize = 225;
  int elephantSpeed = 1;
  int elephantSlownessInverter = 250000;
  int elephantMaxSpeed = 9;
  int elephantAccelerationTimeout = 110;
  float elephantAccelerator = 1.1;

  int poopYStartOffset = 85;
  int poopXStartOffset = 10;
  int poopYDistance = 685;
  int poopSize = 32;
  int poopExplodingTime = 5000;
  int poopExplodedTime = 7000;
  int poopThrottle = 428;  
  float poopSpeed = 1.35;
  color poopColor = color(131, 71, 5);

  void debugConfig() {
    if (key == 'u') {
      config.elephantSize = config.elephantSize - 1;
    }
    if (key == 'd') {
      config.elephantSize = config.elephantSize + 1;
    }
  }
}
