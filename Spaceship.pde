class Spaceship extends Floater  
{   
    public Spaceship()
    {
      corners = 4;
      xCorners = new int[]{-8, 16, -8, -2};
      yCorners = new int[]{-8, 0, 8, 0};
      myColor = 255;
      myStroke = 255;
      myCenterX = width/2;
      myCenterY = height/2;
      myXspeed = 0;
      myYspeed = 0;
      myPointDirection = 0;
    }
    public void shoot()
    {
      bList.add(new Bullet(this));
    }
    public double getX()
    {
      return myCenterX;
    }
    public double getY()
    {
      return myCenterY;
    }
    public double getDir()
    {
      return myPointDirection;
    }
    public double getXSp()
    {
      return myXspeed;
    }
    public double getYSp()
    {
      return myYspeed;
    }
    public void setX(double x_)
    {
      myCenterX = x_;
    }
    public void setY(double y_)
    {
      myCenterY = y_;
    }
    public void setDir(double dir_)
    {
      myPointDirection = dir_;
    }
    public void setXSp(double xsp_)
    {
      myXspeed = xsp_;
    }
    public void setYSp(double ysp_)
    {
      myYspeed = ysp_;
    }
}
