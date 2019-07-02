Config config;
Info info;
Elephant elephant;
PoopSet poops;

void setup() {
  size(1000, 750);
  frameRate(30);

  config = new Config();
  info = new Info();
  elephant = new Elephant();
  poops = new PoopSet();
}

void draw() {
  background(126);

  elephant.draw();
  poops.draw();
  info.draw();
}

void keyPressed() {
  info.hide();

  if (keyCode == LEFT) {
    elephant.moveLeft();
  } else if (keyCode == RIGHT) {
    elephant.moveRight();
  } else if (keyCode == ENTER) {
    elephant.poop(poops);
  } else if (key == '?') { // toggle debug
    config.debug = !config.debug;
    println("Debug: " + config.debug);
  } else if (config.debug) { // test debug
    config.useDebugKey(keyCode);
  }
}


/*
 * Helpers
 */
boolean flash(int mTime) {
  return (mTime / 200) % 2 > 0;
}
