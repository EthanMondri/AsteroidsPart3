class Star //note that this class does NOT extend Floater
{
  private int sz; //size
  private double myX, myY;
  private color cl;
  public   Star(double x_, double y_, int s)
  {
    myX = x_;
    myY = y_;
    sz = s;
    cl = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
  public void show()
  {
    noStroke();
    fill(cl);
    ellipse((float)myX, (float)myY, (float)sz, (float)sz);
  }
}
