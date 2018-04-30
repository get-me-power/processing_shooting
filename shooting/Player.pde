//自機クラス
class Player {
  int hp;
  int x, y;
  float speed;

  public Player(int hp, int x, int y, float speed) {
    this.hp = hp;
    this.x = x;
    this.y = y;
    this.speed = speed;
  }

  public void move() {
    if ((keyStat&0x1)!=0) y -= speed;
    if ((keyStat&0x2)!=0) y += speed;
    if ((keyStat&0x4)!=0) x -= speed;
    if ((keyStat&0x8)!=0) x += speed;
  }
  
  public void shoot(ArrayList<Bullet> bulletList) {
    bulletList.add(new Bullet(10,x,y,10f));
  }

  public void update() {
    move();
    triangle( x, y-7, x -10, y+7, x+10, y+7);
  }
}
