class Keyboard {
  void checkKey() {
    if (keyCode == LEFT) {
    } else if (keyCode == RIGHT) {
      elephant.moveRight();
    } else if (keyCode == ENTER) {
      elephant.poop(poops);
    }

    switch (keyCode) {
    case LEFT:
      elephant.moveLeft();
      return;
    case RIGHT:
      elephant.moveRight();
      return;
    case UP:
      elephant.moveUp();
      return;
    case DOWN:
      elephant.moveDown();
      return;
    case ENTER:
      elephant.poop(poops);
      return;
    }      

    if (key == '?') { // toggle debug
      config.debug = !config.debug;
      println("Debug: " + config.debug);
    }

    if (config.debug) {
      config.debugConfig();
    }
  }
}
