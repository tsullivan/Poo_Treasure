class Config {
  public boolean debug = false;

  int textSize = 32;
  int strokeWeight = 8;
  int textMargin = 10;
  color backGround = 126;
  float distanceAccelerator = 1.05;

  int infoTimeout = 7000;
  int infoFlashTime = 5550;

  color elephantFillColor = color(165, 157, 157);
  color elephantStrokeColor = color(98, 84, 84);
  float elephantScaleFactor = 1.0;
  int elephantXMargin = 110;
  int elephantYMin = 1;
  int elephantYMax = 420;
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
  int poopHitBuffer = 1;
  int poopExplodingTime = 5000;
  int poopExplodedTime = 7000;
  int poopThrottle = 428;  
  float poopSpeed = 1.35;
  color poopColor = color(131, 71, 5);

  int shortyWidth = 71;
  int shortyHeight = 126;
  float shortyScaleFactor = 0.8;
  int shortyXMargin = 50;
  int shortyYMargin = 280;
  int shortyYMin = 100;
  color shortyStrokeColor = color(44, 83, 98);

  int guyRate = 400;
  int guySpeed = 12;
  int guyStartX = -200;
  int guyEndX = 1200;
  int guyStartY = 520;

  int alexWidth = 133;
  int alexHeight = 120;
  float alexScaleFactor = 1.2;
  float alexCenterXOffset = 1.15;
  int alexR = 44;
  int alexG = 83;
  int alexB = 98;
  color alexStrokeColor = color(alexR, alexG, alexB);
}

void checkConfigDebug() {
  if (key == 'U') {
    config.alexCenterXOffset += 0.3;
  } else if (key == 'u') {
    config.alexCenterXOffset -= 0.3;
  }
  println("alexCenterXOffset: " + config.alexCenterXOffset);
}
