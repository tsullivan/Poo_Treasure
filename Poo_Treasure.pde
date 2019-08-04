short PT_LEFT = 0x0;
short PT_RIGHT = 0x1;
short PT_UP = 0x2;
short PT_DOWN = 0x3;

Elephant elephant;
HeroSet heroes;
VillainSet villains;
PoopSet poops;

Config config = new Config();
Keyboard kbd = new Keyboard();
Info info = new Info();

void setup() {
  size(1000, 750);
  frameRate(16);

  elephant = new Elephant();
  poops = new PoopSet();
  villains = new VillainSet();
  heroes = new HeroSet();

  Hero shorty = new Shorty();
  Hero robin = new Robin();
  Hero batman = new Batman();
  shorty.setNextHero(robin);
  robin.setNextHero(batman);
  batman.setNextHero(shorty);
  

  shorty.embarkTo(config.shortyStartX, config.shortyStartY);
  robin.embarkTo(config.robinStartX, config.robinStartY);
  batman.embarkTo(config.batmanStartX, config.batmanStartY);

  heroes.add(shorty);
  heroes.add(robin);
  heroes.add(batman);

  elephant.setRider(shorty);
}

void draw() {
  background(config.backGround);
  poops.draw();
  info.draw();
  elephant.draw();
  heroes.draw();
  villains.draw();
}

void keyPressed() {
  info.hide();
  kbd.checkKey();
}

/*
 * Helpers
 */
boolean flash(int mTime) {
  return (mTime / 200) % 2 > 0;
}

PShape cleanShape(PShape svg, color stroke, float scaleFactor) {
  svg.disableStyle();
  noFill();
  strokeWeight(10 * scaleFactor);
  stroke(stroke); 
  return svg;
}

/*
 * Heroes
 */
class HeroSetup {
  int startX;
  int startY;
  int lWidth;
  int lHeight;
  float scaleFactor;

  HeroSetup(int tX, int tY, int tW, int tH, float sF) {
    startX = tX;
    startY = tY;
    lWidth = tW;
    lHeight = tH;
    scaleFactor = sF;
  }
}

class Shorty extends Hero {
  Shorty() {
    super(
      loadShape("Shorty-L.svg"), 
      loadShape("Shorty-R.svg"), 
      config.shortyWidth, 
      config.shortyHeight, 
      config.shortyScaleFactor, 
      config.shortyStrokeColor, 
      "shorty"
      );
  };
  HeroSetup getSetup() {
    return new HeroSetup(
      config.shortyStartX, 
      config.shortyStartY, 
      config.shortyWidth, 
      config.shortyHeight, 
      config.shortyScaleFactor
      );
  }
}

class Batman extends Hero {
  Batman() {
    super(
      loadShape("Batman.svg"), 
      loadShape("Batman.svg"), 
      config.batmanWidth, 
      config.batmanHeight, 
      config.batmanScaleFactor, 
      config.batmanStrokeColor, 
      "batman"
      );
  };
  HeroSetup getLB() {
    return new HeroSetup(
      config.batmanStartX, 
      config.batmanStartY, 
      config.batmanWidth, 
      config.batmanHeight, 
      config.batmanScaleFactor
      );
  }
}

class Robin extends Hero {
  Robin() {
    super(
      loadShape("Robin.svg"), 
      loadShape("Robin.svg"), 
      config.robinWidth, 
      config.robinHeight, 
      config.robinScaleFactor, 
      config.robinStrokeColor, 
      "robin"
      );
  };
  HeroSetup getLB() {
    return new HeroSetup(
      config.robinStartX, 
      config.robinStartY, 
      config.robinWidth, 
      config.robinHeight, 
      config.robinScaleFactor
      );
  }
}
