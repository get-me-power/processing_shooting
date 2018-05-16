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
    fill(255,0,0);
    rect(900, 0, player.hp, 50-y);
  }
}
