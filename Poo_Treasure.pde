Elephant elephant;
PoopSet poops;

Config config = new Config();
Keyboard kbd = new Keyboard();
Info info = new Info();

void setup() {
  size(1000, 750);
  elephant = new Elephant();
  poops = new PoopSet();
}

void draw() {
  background(config.backGround);
  poops.draw();
  info.draw();
  elephant.draw();
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
