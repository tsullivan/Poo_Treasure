Elephant elephant;
Shorty shorty;
GuySet guys;
PoopSet poops;

Config config = new Config();
Keyboard kbd = new Keyboard();
Info info = new Info();

void setup() {
  size(1000, 750);
  frameRate(16);
  elephant = new Elephant();
  poops = new PoopSet();
  shorty = new Shorty();
}

void draw() {
  background(config.backGround);
  poops.draw();
  info.draw();
  elephant.draw();
  shorty.draw();
  guys.draw();

  /*
   * Debug
   */
  if (config.debug) {
    strokeWeight(1);
    line(0, config.elephantYMin, width, config.elephantYMin);
    line(0, config.elephantYMax, width, config.elephantYMax);
  }
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
