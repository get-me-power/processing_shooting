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


  void hit(ArrayList<Bullet> bulletList) {
    for (int i = bulletList.size() -1; i>=0; i--) {
      //bulletList.get(i);
      bulletList.get(i).update(); 
      bulletList.get(i).getX();
      bulletList.get(i).getY();
      for (int j=0; j<=10; j++) { 
        if (abs(bulletList.get(i).getX() - enemyList.get(j).x) <= 30 && abs(bulletList.get(i).getY() - enemyList.get(j).y) <= 30) {
          this.hp -= 10;
          bulletList.remove(i);
          if (this.hp == 0) {
            //this.remove();
            if (this.hp <= 0) {
            }
          }
        }
      }
    }
  }
  void update() {

    triangle( x, y-7, x -10, y+7, x+10, y+7);
  }
}
