class HeroSet {
  private ArrayList<Hero> _heroes = new ArrayList<Hero>();
  
  HeroSet() {
    Hero shorty = new Shorty();
    Hero robin = new Robin();
    Hero batman = new Batman();
    
    shorty.moveTo(config.shortyStartX, config.shortyStartY);
    robin.moveTo(config.robinStartX, config.robinStartY);
    batman.moveTo(config.batmanStartX, config.batmanStartY);
    
    _heroes.add(shorty);
    _heroes.add(robin);
    _heroes.add(batman);
  }

  int size() {
    return _heroes.size();
  }
  
  Hero get(int i) {
    return _heroes.get(i);
  }

  void draw() {
    for (int i = 0; i < _heroes.size(); i++) {
      Hero hi = get(i);
      hi.draw();
    }
  }
}
