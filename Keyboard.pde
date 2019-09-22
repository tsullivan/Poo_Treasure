class Keyboard {
  void checkKey() {
    if (key == ' ') {
      elephant.poop(poops);
      return;
    }

    if (key == 's' || key == 'S') {
      Hero next = elephant.getRider().getNextHero(); 
      elephant.setRider(next);
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
    }

    if (config.debug) {
      checkConfigDebug();
    }
  }
}
