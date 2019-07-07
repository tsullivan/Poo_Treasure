class Config {
  public boolean debug = false;

  int textSize = 32;
  int strokeWeight = 8;
  int textMargin = 10;
  color backGround = 126;

  int infoTimeout = 7000;
  int infoFlashTime = 5550;

  color elephantFillColor = color(165, 157, 157);
  color elephantStrokeColor = color(98, 84, 84);
  float elephantScaleFactor = 1.0;
  int elephantMinX = 10;
  int elephantMaxX = 781;
  int elephantMinY = 1;
  int elephantMaxY = 450;
  int elephantSize = 225;
  int elephantSpeed = 1;
  float elephantMaxXSpeed = 11;
  float elephantMaxYSpeed = 15;
  int elephantAccelerationTimeout = 480;
  float elephantXAccelerator = 0.5;
  float elephantYAccelerator = 1;

  int poopStartOffsetY = 85;
  int poopStartOffsetX = 10;
  int poopStopY = 685;
  int poopSize = 32;
  int poopHitBufferX = -5;
  int poopHitBufferY = -24;
  int poopExplodingTime = 5000;
  int poopExplodedTime = 7000;
  int poopThrottle = 428;  
  float poopSpeed = 1.35;
  float poopYAccelerator = 0.2;
  color poopColor = color(131, 71, 5);

  int shortyWidth = 71;
  int shortyHeight = 126;
  float shortyScaleFactor = 0.8;
  int shortyXMargin = 50;
  int shortyYMargin = 280;
  int shortyYMin = 100;
  color shortyStrokeColor = color(44, 83, 98);

  int guyRate = 1800;
  int guySpeed = 1;
  float guyAcceleratorX = 1.05;
  float guyAcceleratorY = 1;
  float guyMaxSpeed = 19;
  int guyStartX = -200;
  int guyEndX = 1200;
  int guyStartY = 520;

  int retiredStartX = 1200;
  int retiredStartY = 0;

}

void checkConfigDebug() {
  if (key == 'U') {
    config.guyMaxSpeed += 0.2;
  } else if (key == 'u') {
    config.guyMaxSpeed -= 0.2;
  }
  println("guyMaxSpeed: " + config.guyMaxSpeed);
}
