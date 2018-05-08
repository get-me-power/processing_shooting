class Enemy {
  int hp;
  int x, y;
  float speed;
  float theta;

  Enemy(int hp, int x, int y, float speed) {
    this.hp = hp;
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.theta = random(2) * PI;
  }

  boolean shootdown(ArrayList<Bullet> bulletList) { //shootdownは撃墜
    for (int i = bulletList.size() - 1; i >= 0; i--) {

      if (abs(bulletList.get(i).getX() - this.x) <= 20 &&
        abs(bulletList.get(i).getY() - this.y) <= 20) {
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


  void shoot_enemy(ArrayList<Bullet> enemyBulletList) {
    enemyBulletList.add(new Bullet(10, x, y, -10f)); // プレイヤーの弾と逆向きにする
  }

  void update() {
    x += 5 * cos(this.theta); // 敵の移動
    y += 5 * sin(this.theta);
    if ( y > height || y < 0 ) {
      this.theta = 2*PI - this.theta;
    } else if ( x > width || x < 0 ) {
      this.theta = PI - this.theta;
    }
    triangle(x, y-7, x-10, y+7, x+10, y+7);
  }
}
