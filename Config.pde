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
  float elephantSpeed = 8;
  float elephantMaxXSpeed = 22;
  float elephantMaxYSpeed = 22;
  int elephantAccelerationTimeout = 480;
  float elephantXAccelerator = 0.5;
  float elephantYAccelerator = 1;
  float elephantEmbarkSpeed = 3.8;

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
  int shortyYMin = 100;
  int shortyStartX = 10; 
  int shortyStartY = 15;
  float shortyScaleFactor = 0.8;
  color shortyStrokeColor = color(44, 83, 98);

  int batmanWidth = 158;
  int batmanHeight = 179;
  int batmanYMin = 100;
  int batmanStartX = 10; 
  int batmanStartY = 180;
  float batmanScaleFactor = 0.8;
  color batmanStrokeColor = color(0);

  int robinWidth = 125;
  int robinHeight = 130;
  int robinYMin = 100;
  int robinStartX = 75; 
  int robinStartY = 95;
  float robinScaleFactor = 0.8;
  color robinStrokeColor = color(98, 59, 44);

  float heroEmbarkSpeed = 4.5;

  int villainRate = 1800;
  float villainSpeed = 1;
  float villainAcceleratorX = 1.05;
  float villainAcceleratorY = 1;
  float villainMaxSpeed = 19;
  int villainStartX = -200;
  int villainEndX = 1200;
  int villainStartY = 520;

  int villainTrophyBoxX = 860;
  int villainTrophyBoxY = 590;
}

void checkConfigDebug() {
  if (key == 'T') {
    config.villainTrophyBoxX += 1;
  } else if (key == 't') {
    config.villainTrophyBoxX -= 1;
  }
  println("villainTrophyBoxX: " + config.villainTrophyBoxX);

  if (key == 'Y') {
    config.villainTrophyBoxY += 1;
  } else if (key == 'y') {
    config.villainTrophyBoxY -= 1;
  }
  println("villainTrophyBoxY: " + config.villainTrophyBoxY);
}
