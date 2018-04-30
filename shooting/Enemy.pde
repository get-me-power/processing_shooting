class Enemy {
  int hp;
  int x, y;
  float speed;

  Enemy(int hp, int x, int y, float speed) {
    this.hp = hp;
    this.x = x;
    this.y = y;
    this.speed = speed;
  }

  boolean hit(ArrayList<Bullet> bulletList) {
    for (int i = bulletList.size() - 1; i >= 0; i--) {
      // bulletList.get(i);
      // bulletList.get(i).update(); 
      // bulletList.get(i).getX();
      // bulletList.get(i).getY();
      if (abs(bulletList.get(i).getX() - this.x) <= 30 && abs(bulletList.get(i).getY() - this.y) <= 30) {
        this.hp -= 10;
        bulletList.remove(i);
        if (this.hp <= 0) return true;
      }
      if (this.hp <= 0) {
        //this.remove();
        return true;
      }
    }
    return false;
  }

  void update() {
    triangle(x, y-7, x-10, y+7, x+10, y+7);
  }
}
