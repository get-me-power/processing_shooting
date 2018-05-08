int keyStat; // キーの状態を格納する変数
boolean key_flag = true;
private ArrayList<Bullet> bulletList; // プライベート変数
private ArrayList<Bullet> enemyBulletList;
private ArrayList<Enemy> enemyList;

Player player;
// Enemy enemy;

// 一番最初に一回だけ呼ばれる
void setup() {
  size(960, 720);
  frameRate(60);
  rectMode(CENTER); // center mode
  player = new Player(100, 200, 300, 2.5f); // インスタンス化:オブジェクトを生成する（実体化する）(今回はnew Player...）
  // enemy = new Enemy(0, 400, 200, 2.5f);
  enemyList = new ArrayList<Enemy>();
  bulletList = new ArrayList<Bullet>();
  enemyBulletList = new ArrayList<Bullet>();

  for (int i = 0; i <= 10; i += 1) {// enemyを生成する
    enemyList.add(new Enemy(100, (int)random(400), (int)random(200), 2.5f)); // ランダム関数の導入
  }
}

// 毎フレーム呼ばれるもの
void draw() {
  background(255, 255, 0);
  
  player.update();
 
  fill(0, 0, 255);
  text(frameCount, 900, 100); // フレームカウント

  if ((keyStat&0x20) != 0 && frameCount % 10 == 0)
    player.shoot(bulletList); // shoot関数の呼び出し
    

  // enemyList.sizeは敵の数
  for (int i = 0; i < enemyList.size(); i++) {

    if (frameCount % 50 == 0)
      enemyList.get(i).shoot_enemy(enemyBulletList);

    if ( enemyList.get(i).shootdown(bulletList) ) enemyList.remove(i); // 被弾して hp が 0 になった敵を消す
    else enemyList.get(i).update();
  }

  for (int i = bulletList.size() - 1; i >= 0; i--) {
    bulletList.get(i).update();

    int x = bulletList.get(i).getX(), 
      y = bulletList.get(i).getY();

    if (y > height || y < 0 || x > width || x < 0) bulletList.remove(i);
  }

  for (int i = enemyBulletList.size() - 1; i >= 0; i--) {

    enemyBulletList.get(i).update();
    int x = enemyBulletList.get(i).getX(), //バグ発生
      y = enemyBulletList.get(i).getY();

    if (y > height || y < 0 || x > width || x < 0) enemyBulletList.remove(i);
    
    if( player.hit(enemyBulletList) == true ){//自機の当たり判定を追加
     background(0,0,0);//ゲームオーバーなら真っ暗にする
    }
  }
}

void keyPressed() {
  if (!key_flag) return;
  if (key == CODED) {
    switch(keyCode) {
      // ビットセット
    case UP:
      keyStat|=0x1;
      break;
    case DOWN:
      keyStat|=0x2;
      break;
    case LEFT:
      keyStat|=0x4;
      break;
    case RIGHT:
      keyStat|=0x8;
      break;
    case SHIFT:
      keyStat|=0x10;
      break;
    }
  }
  switch(key) {
  case 'z':
  case 'Z':
    keyStat|=0x20;
    break;
  case 'x':
  case 'X':
    keyStat|=0x40;
    break;
  case's':
  case'S':
    keyStat|=0x80;
    break;
  case 'a':
  case 'A':
    keyStat|=0x100;
    break;
  }
}

void keyReleased() {
  if (key == CODED) {
    switch(keyCode) {
      // ビットクリア
    case UP:
      keyStat&=~0x1;
      break;
    case DOWN:
      keyStat&=~0x2;
      break;
    case LEFT:
      keyStat&=~0x4;
      break;
    case RIGHT:
      keyStat&=~0x8;
      break;
    case SHIFT:
      keyStat&=~0x10;
      break;
    }
  }

  switch(key) {
  case 'z':
  case 'Z':
    keyStat&=~0x20;
    break;
  case 'x':
  case 'X':
    keyStat&=~0x40;
    break;
  case's':
  case'S':
    keyStat&=~0x80;
    break;
  case'a':
  case'A':
    keyStat&=~0x100;
    break;
  }
}
