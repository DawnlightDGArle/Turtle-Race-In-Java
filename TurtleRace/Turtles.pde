class turtle {
  int x, y;
  int yVelocity;
  int w, h;
  int type;
  PImage img;
  PImage alt;
  
  public turtle(int turtleX, int turtleY, int yv, int t) {
    x = turtleX;
    y = turtleY;
    yVelocity = yv;
    w = 30;
    h = 45;
    img = turtleImg;
    alt = turtleImgAlt;
    type = t;
    if (type == 0) {
      img = turtleImg;
    }
    else if (type == 1) {
      img = turtleImgAlt;
    }
  }
  
  boolean move() {
    y += yVelocity;
    
    if(y+h/2 <= 45) {
      return false;
    }
    else{
      return true;
    }
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
  
  public int getHeight() {
    return h;
  }
  
  public int getWidth() {
    return w;
  }
  
  void drawTurtle() {
    imageMode(CENTER);
    image(img, x, y);
  }
}
