int keyStat; // キーの状態を格納する変数
boolean key_flag = true;
Stage stage1;

// 一番最初に一回だけ呼ばれる
void setup() {
  size(960, 720);
  frameRate(60);
  rectMode(CENTER); // center mode
  stage1 = new Stage();
}


// 毎フレーム呼ばれるもの
void draw() {
  stage1.update();
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
