class Player{
  
  PVector position = new PVector();
  PVector pinchOrigin = new PVector(8 * width/10, height/2);
  PVector pinchPosition = new PVector();
  PVector relative = new PVector();
  boolean valid = true;
  float handSize = 50;
  float shootedTime = 0;
  
  
  Player(){
    
  }
  void update(){
    /*情報を更新*/
    position.x = mouseX;
    position.y = mouseY;
    if(mousePressed){
      pinchPosition = position.copy();
      relative = PVector.sub(pinchOrigin, pinchPosition);
      /*弾を発射*/
      float nowTime = millis();
      if((nowTime - shootedTime)/1000 > 1.0f){
        shoot();
        shootedTime = millis();
      }
    }
     if(position.x < width/2){
      valid = true;
    }else{
      valid = false;
    }
    
  }//update
 
  /*描画処理*/
  void render(){
    noStroke();
    fill(#ED9613, 100);
    rect(0.0f, 0.0f, width/2, height);
    if(valid == true){
      noStroke();
      fill(#F00C36);
      ellipse(position.x, position.y, handSize, handSize);
      if(mousePressed){
        stroke(1.0f);
        strokeWeight(3.0f);
        line(pinchOrigin.x, pinchOrigin.y, pinchPosition.x, pinchPosition.y);
        }
        fill(#5A4E21, 100);
        ellipse(pinchOrigin.x, pinchOrigin.y, handSize, handSize);
    }else{
      noStroke();
      fill(#F00C36, 100);
      ellipse(position.x, position.y, handSize, handSize);
    }
  }//render
  
  /*弾を発射*/
  void shoot(){
    if(valid == true){
         for(int i = 0; i < ballNo; i ++){
            if(!balls[i].exist){
              balls[i].create(pinchPosition.x, pinchPosition.y, relative);
              println("shooted`\n");
              break;
            }
         }
    }
  }//shoot
  
}