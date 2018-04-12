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
  
  void update(){
   
    y-=speed;
    ellipse(x,y,10,10);
    
  }
  
}
  
  
