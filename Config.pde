class Config {
  public boolean debug = false;

  int textSize = 32;
  int textMargin = 10;
  int moveMargin = 110;
  float distanceAccelerator = 1.05;


  int infoTimeout = 7000;
  int infoFlashTime = 5550;

  int elephantY = 240;
  int elephantSize = 140;
  int elephantSpeed = 1;
  int elephantSlownessInverter = 250000;
  int elephantMaxSpeed = 9;
  int elephantAccelerationTimeout = 110;
  float elephantAccelerator = 1.1;

  int poopStartY = elephantY + elephantSize;
  int poopStopY = 685;
  int poopSize = 32;
  int poopExplodingTime = 5000;
  int poopExplodedTime = 7000;
  int poopThrottle = 428;  
  float poopSpeed = 1.35;
  color poopColor = color(131, 71, 5);

  void useDebugKey(int keyKode) {
    if (keyKode == UP) {
      this.elephantSlownessInverter += 1000;
    } else {
      this.elephantSlownessInverter -= 1000;
    }
    println("elephantSlownessInverter: " + this.elephantSlownessInverter);
  }
}
