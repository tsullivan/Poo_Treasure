class HeroSet {
  private ArrayList<Hero> _heroes = new ArrayList<Hero>();

  int size() {
    return _heroes.size();
  }

  Hero get(int i) {
    return _heroes.get(i);
  }

  void add(Hero h) {
    _heroes.add(h);
  }

  void draw() {
    for (int i = 0; i < _heroes.size(); i++) {
      Hero hi = get(i);
      hi.draw();
    }
  }
}
