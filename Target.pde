class Target{
  
  PVector position;
  int circleNo = 5;
  float[] radius = new float[circleNo];
  color[] col = new color[circleNo];
  
  Target(PVector position){
    this.position = position.copy();
    float radiusAdd = 50.0f;
    for(int i = 0; i < circleNo; i ++){
      radius[i] = 100 + i * radiusAdd;
      col[i] = color(random(255), random(255), random(255));
    }
  }//コンストラクタ
  
  void update(){
      
  }
  
  void render(){
    for(int i = circleNo - 1; i > -1; i --){
      stroke(1.0f);
      fill(col[i], 100);
      ellipse(position.x,position.y, radius[i], radius[i]);
      fill(0);
      textFont(font3);
      if(i == 0){
        text(i , position.x, position.y - radius[i]/4);
      }else{
        text(i , position.x, position.y - radius[i - 1]/2 - (radius[i]/2 - radius[i - 1]/2) / 2);
      }
    }
    /*得点の表示*/
    float sum = 0;
    float[][] point = checkBallsPoint();
    float[]  newPoint = new float[circleNo];
    for(int j = 0; j < circleNo; j ++){
      newPoint[j] = 0.0f;
      for(int i = 0; i < ballNo; i ++){
        sum += point[i][j];
        newPoint[j] += point[i][j];
      }
      fill(#0D3B79);
      textFont(font1);
      text("circleNo." + j + ": " + newPoint[j], 5 * width/7, (j + 1) * height/(circleNo + 5));
    }
    textFont(font2);
    text("Total Point: " + sum, 4 *width/7, (circleNo + 3) * height/(circleNo + 5));
  }
  
  public float[][] checkBallsPoint(){
    float[][] point = new float[ballNo][circleNo];
     for(int j = circleNo - 1; j > -1; j --){
      for(int i = 0; i < ballNo; i++){
        point[i][j] = 0.0f;//pointの初期化
        if((PVector.sub(balls[i].getPosition(), position)).mag() < radius[j]/2){
          if(j == circleNo-1){
            point[i][j] = (circleNo - j) * 100;
          }else{
             point[i][j + 1] = 0.0f;
             point[i][j] = (circleNo - j) * 100;
          }
        }
      }//for
    }//for
   
    return point;
  }//checkBallsPoint
  
  
  
}