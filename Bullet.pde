class Bullet extends Floater
{
  public Bullet (Spaceship ship)
  {
    corners = 4;
    xCorners = new int[]{-8, 16, -8, -2};
    yCorners = new int[]{-8, 0, 8, 0};
    myColor = 200;
    myStroke = 200;
    myCenterX = ship.getX();
    myCenterY = ship.getY();
    myXspeed = ship.getXSp();
    myYspeed = ship.getYSp();
    myPointDirection = ship.getDir();
    
    this.accelerate(6.0);
  }
  public double getX()
  {
    return myCenterX;
  }
  public double getY()
  {
    return myCenterY;
  }
  public void move()
  {
    myCenterX += myXspeed;
    myCenterY += myYspeed;
  }
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    ellipse(0.0, 0.0, 20.0, 5.0);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
}
