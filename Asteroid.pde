class Asteroid extends Floater
{
  private double rSpeed; //rotation speed
  public Asteroid()
  {
    corners = 10;
    xCorners = new int[] {-20, -14, 2  , 26 , 22 , 22 , 14 , 0  , -14, -20};
    yCorners = new int[] {-16, -24, -24, -12, -4 , 8  , 22 , 4  , 16 , 4  };
    myColor = 0;
    myStroke = 255;
    myCenterX = Math.random()*width;
    myCenterY = Math.random()*height;
    while ((myCenterX >= width/4 && myCenterX <= 3*width/4) && (myCenterY >= height/4 && myCenterY <= 3*height/4))
    {
      myCenterX = Math.random()*width;
      myCenterY = Math.random()*height;
    }
    myXspeed = Math.random()*5-2;
    myYspeed = Math.random()*5-2;
    myPointDirection = Math.random()*360;
    //rSpeed = Math.random()*50-25;
    rSpeed = 5;
  }
  public void move()
  {
    turn(rSpeed);
    super.move();
  }
  public double getX()
  {
    return myCenterX;
  }
  public double getY()
  {
    return myCenterY;
  }
}
