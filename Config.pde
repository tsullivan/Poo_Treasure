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
  int shortyYMin = 100;
  color shortyStrokeColor = color(44, 83, 98);
  int shortyStartX = 10; 
  int shortyStartY = 15;

  int batmanWidth = 71;
  int batmanHeight = 126;
  float batmanScaleFactor = 0.8;
  int batmanYMin = 100;
  color batmanStrokeColor = color(0);
  int batmanStartX = -100; 
  int batmanStartY = 250;

  int robinWidth = 71;
  int robinHeight = 126;
  float robinScaleFactor = 0.8;
  int robinYMin = 100;
  color robinStrokeColor = color(98, 59, 44);
  int robinStartX = -100; 
  int robinStartY = 320;



  int villainRate = 1800;
  int villainSpeed = 1;
  float villainAcceleratorX = 1.05;
  float villainAcceleratorY = 1;
  float villainMaxSpeed = 19;
  int villainStartX = -200;
  int villainEndX = 1200;
  int villainStartY = 520;

  int retiredStartX = 1200;
  int retiredStartY = 0;
}

void checkConfigDebug() {
  if (key == 'S') {
    config.shortyScaleFactor += 0.2;
  } else if (key == 's') {
    config.shortyScaleFactor -= 0.2;
  }
  println("shortyScaleFactor: " + config.shortyScaleFactor);

  if (key == 'B') {
    config.batmanScaleFactor += 0.2;
  } else if (key == 'b') {
    config.batmanScaleFactor -= 0.2;
  }
  println("batmanScaleFactor: " + config.batmanScaleFactor);

  if (key == 'R') {
    config.robinScaleFactor += 0.2;
  } else if (key == 'r') {
    config.robinScaleFactor -= 0.2;
  }
  println("robinScaleFactor: " + config.robinScaleFactor);
}
