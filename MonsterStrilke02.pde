/**
 * Circle Collision with Swapping Velocities
 * by Ira Greenberg. 
 * 
 * Based on Keith Peter's Solution in
 * Foundation Actionscript Animation: Making Things Move!
 */
int  ballNo = 100;
Player player;
Ball[] balls =  new Ball[ballNo];
Target target;

PFont  font1;
PFont font2;
PFont font3;

void setup() {
  size(displayWidth, displayHeight);
  player = new Player();
  for(int i = 0; i  < ballNo; i ++){
    balls[i] = new Ball(0.0f, 0.0f, random(50.0f));
  }
  target = new Target(new PVector(4* width/6, height/2));
  
  font1 = loadFont("DialogInput-30.vlw");
  font2 = loadFont("DialogInput-48.vlw");
  font3 = loadFont("DialogInput-12.vlw");
  
}

void draw() {
  background(255);
  player.update();
  player.render();
  target.render();
  for (Ball b : balls) {
    b.update();
    b.display();
    b.checkBoundaryCollision();
  }
  for(int i = 0; i < ballNo; i ++){
    for(int j = 0; j < ballNo; j ++){
      if(i == j){
        continue;
      }
      else{
        balls[i].checkCollision(balls[j]);
      }
    }//for()
  }//for()
}//draw