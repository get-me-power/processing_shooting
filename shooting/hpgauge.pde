class Hpgauge {
  int hp;
  int x, y;


  public Hpgauge(int x, int y) {
    this.x = x;
    this.y = y;
  }
  public void hitgauge() {
    x = player.hp;
  }
  public void update() {
    rect(900, 0, player.hp, 50-y);
  }
}
