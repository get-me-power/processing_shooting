class Stage {
  private ArrayList<Bullet> bulletList; // プライベート変数
  private ArrayList<Bullet> enemyBulletList;
  private ArrayList<Enemy> enemyList;
  Hpgauge hpgauge;
  Player player;
  
  public Stage(){
    this.initialize();
  }
    
  void initialize() {
    player = new Player(150, 300, 600, 2.5f); // インスタンス化:オブジェクトを生成する（実体化する）(今回はnew Player...）
    hpgauge = new Hpgauge(0, 0);//hpゲージの作成
    enemyList = new ArrayList<Enemy>();
    bulletList = new ArrayList<Bullet>();
    enemyBulletList = new ArrayList<Bullet>();
    for (int i = 0; i <= 10; i += 1) {// enemyを生成する
      enemyList.add(new Enemy(100, (int)random(900), (int)random(200), 2.5f)); // ランダム関数の導入
    }
  }

  // 毎フレーム呼ばれるもの
  void update() {
    background(255, 255, 0);

    player.update();
    hpgauge.update(player.hp);

    fill(0, 0, 255);
    text(frameCount, 900, 100); // フレームカウント

    if ((keyStat&0x20) != 0 && frameCount % 10 == 0)
      player.shoot(bulletList); // shoot関数の呼び出し


    // enemyList.sizeは敵の数
    for (int i = 0; i < enemyList.size(); i++) {

      if (frameCount % 50 == 0)
        enemyList.get(i).shoot_enemy(enemyBulletList);

      if ( enemyList.get(i).shootdown(bulletList) ) enemyList.remove(i); // 被弾して hp が 0 になった敵を消す
      else {
        enemyList.get(i).update();
      }
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

      if ( player.hit(enemyBulletList) == true ) {//自機の当たり判定を追加
        background(0, 0, 0);//ゲームオーバーなら真っ暗にする
        textSize(100);
        text("Game Over", 300, 300);
      }
    }
  }
}
