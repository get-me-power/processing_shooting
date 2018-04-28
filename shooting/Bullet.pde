class Bullet {
  int ap;
  int x,y;
  float speed;
  
  Bullet(int ap,int x, int y, float speed){
    this.ap = ap;
    this.x = x;
    this.y = y;
    this.speed = speed;
  }
  public int getX(){//弾の座標を習得
    return this.x;
  }
  public int getY(){//弾の座標を習得
    return this.y;
  }
  
  void update(){
    y-=speed;
    ellipse(x,y,10,10);
  }
}
  
  
