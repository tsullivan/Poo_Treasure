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
    case ENTER:
      elephant.poop(poops);
      return;
    default:
      if (config.debug) { // test debug
        checkDebugs();
      } else if (key == '?') { // toggle debug
        config.debug = !config.debug;
        println("Debug: " + config.debug);
      }
    }
  }

  void checkDebugs() {
    if (keyCode == UP) {
      config.poopStartY += 1;
    } else if (keyCode == DOWN) {
      config.poopStartY -= 1;
    }
    println("poopStartY: " + config.poopStartY);
  }
}
