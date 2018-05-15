class Hpgauge {
  int hp;
  int x, y;


  public Hpgauge(int hp, int x, int y) {
    this.hp = hp;
    this.x = x;
    this.y = y;
  }

  public void update() {
    rect(600,300,150-x,150-y);
  }
}
