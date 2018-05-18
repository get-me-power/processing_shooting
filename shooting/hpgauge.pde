class Hpgauge {
  int hp;
  int x, y;


  public Hpgauge(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  public void update(int playerhp) {
    fill(255,0,0);//HPゲージの色の変更
    rect(900, 0, playerhp, 50-y);
  }
}
