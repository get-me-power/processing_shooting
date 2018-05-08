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

  boolean hit(ArrayList<Bullet> enemyBulletList) {
    for ( int i = enemyBulletList.size() - 1; i >= 0; i--) {

      if (abs(enemyBulletList.get(i).getX() - this.x) <= 10 &&
        abs(enemyBulletList.get(i).getY() - this.y) <= 10) {
        this.hp -= 10;
        enemyBulletList.remove(i);
        
        if (this.hp <= 0) return true;
      }
      if (this.hp <= 0) {
        //this.remove();
        return true;
      }
    }
    return false;
  }

  public void move() {
    if ((keyStat&0x1) != 0) y -= speed;
    if ((keyStat&0x2) != 0) y += speed;
    if ((keyStat&0x4) != 0) x -= speed;
    if ((keyStat&0x8) != 0) x += speed;
  }

  public void shoot(ArrayList<Bullet> bulletList) {
    bulletList.add(new Bullet(10, x, y, 10f));
  }

  public void update() {
    move();
    triangle(x, y-7, x-10, y+7, x+10, y+7);
  }
}
