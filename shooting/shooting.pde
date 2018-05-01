int keyStat; // キーの状態を格納する変数
boolean key_flag = true;
private ArrayList<Bullet> bulletList; // プライベート変数
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
  for (int i = 0; i <= 10; i++) {
    enemyList.add(new Enemy(100, (int)random(400), (int)random(200), 2.5f)); // ランダム関数の導入
  }
}

// 毎フレーム呼ばれるもの
void draw() {
  background(255, 255, 0);
  player.update();
  // enemy.update();
  fill(0, 0, 255);
  text(frameCount, 900, 100); // フレームカウント
  if ((keyStat&0x20) != 0) {
    if (frameCount % 10 == 0) {
      player.shoot(bulletList);
    }
  }
  
  // enemy.hit(bulletList);
  for (int i = 0; i < enemyList.size(); i++) { // enemyを生成する
    if ( enemyList.get(i).hit(bulletList) ) enemyList.remove(i);
    else enemyList.get(i).update();
  }
  for (int i = bulletList.size() - 1; i >= 0; i--) {
    // bulletList.get(i);
    bulletList.get(i).update();
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
