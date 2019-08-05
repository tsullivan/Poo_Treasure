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

  Hero shorty = getHeroShorty();
  Hero robin = getHeroRobin();
  Hero batman = getHeroBatman();
  shorty.setNextHero(robin);
  shorty.embarkTo(config.shortyStartX, config.shortyStartY);
  robin.setNextHero(batman);
  robin.embarkTo(config.robinStartX, config.robinStartY);
  batman.setNextHero(shorty);
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
