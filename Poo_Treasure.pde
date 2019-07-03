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
