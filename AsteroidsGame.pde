Spaceship ship;
Star[] stars;
ArrayList <Asteroid> aList = new ArrayList <Asteroid>();
ArrayList <Bullet> bList = new ArrayList <Bullet>();
int lives = 3;
int bullets = 0;
int asteroids = 0;
boolean UPisPressed, DOWNisPressed, LEFTisPressed, RIGHTisPressed, SPACEisPressed, lost;

public void setup()
{
  size(1600, 1600);
  background(0);
  
  ship = new Spaceship();
  stars = new Star[(int)(Math.random()*20)+30];
  
  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star(Math.random()*width, Math.random()*height, (int)(Math.random()*5)+5);
  }
  for (int i = 0; i < (int)(Math.random()*10)+(width/100+height/100); i++)
  {
    aList.add(new Asteroid());
  }
}

public void draw()
{
  clear();
  if (lives <= 0)
  {
    lost = true;
    clear();
    background(255);
    lives = 3;
  }
  if (lost)
  {
    aList.clear();
    bList.clear();
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(64);
    text("YOU LOSE", width/2, height/2);
    textSize(32);
    text("you destroyed " + asteroids + " asteroids within 3 lives!", width/2, height/2+50);
  }
  if (bullets > 300)
  {
    aList.clear();
    bList.clear();
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(64);
    text("YOU LOSE", width/2, height/2);
    textSize(32);
    text("you destroyed " + asteroids + " asteroids within 300 bullets!", width/2, height/2+50);
  }
  for (Star s : stars)
  {
    s.show();
  }
  for (int i = bList.size()-1; i >= 0; i--)
  {
    bList.get(i).move();
    bList.get(i).show();
  }
  for (int i = aList.size()-1; i >= 0; i--)
  {
    aList.get(i).move();
    aList.get(i).show();
    if (dist((float)ship.getX(), (float)ship.getY(), (float)aList.get(i).getX(), (float)aList.get(i).getY()) < 20)
    {
      aList.remove(i);
      lives--;
    }
  }
  if (!lost && (bullets <= 300))
  {
    ship.move();
    ship.show();
    fill(255);
    textSize(30);
    textAlign(LEFT, CENTER);
    text("ship x: " + (int)ship.getX(), 5, 20);
    text("ship y: " + (int)ship.getY(), 5, 60);
    textAlign(CENTER, CENTER);
    text("lives: " + lives, width/2, 20);
    textAlign(RIGHT, CENTER);
    text("Bullets fired: " + bullets, width-5, 20);
    text("Asteroids destroyed: " + asteroids, width-5, 60);
  }
  for (int b = bList.size()-1; b >= 0; b--)
  {
    for (int a = aList.size()-1; a >= 0; a--)
    {
      if (dist((float)bList.get(b).getX(), (float)bList.get(b).getY(), (float)aList.get(a).getX(), (float)aList.get(a).getY()) < 20)
      {
        aList.remove(a);
        bList.remove(b);
        asteroids++;
        break;
      }
    }
  }
  if (UPisPressed)
  {
    ship.accelerate(0.25);
  }
  if (DOWNisPressed)
  {
    ship.accelerate(-0.25);
  }
  if (RIGHTisPressed)
  {
    ship.turn(5);
  }
  if (LEFTisPressed)
  {
    ship.turn(-5);
  }
  if (SPACEisPressed && !lost)
  {
    ship.shoot();
    bullets++;
    SPACEisPressed = false;
  }
}

public void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      UPisPressed = true;
    }
    if (keyCode == DOWN)
    {
      DOWNisPressed = true;
    }
    if (keyCode == RIGHT)
    {
      RIGHTisPressed = true;
    }
    if (keyCode == LEFT)
    {
      LEFTisPressed = true;
    }
  }
  if (key == 'h')
  {
    ship.setX(Math.random()*width);
    ship.setY(Math.random()*height);
    ship.setDir(Math.random()*360);
    ship.setXSp(0);
    ship.setYSp(0);
  }
  if (key == 'r')
  {
    if (aList.size() == 0)
    {
      for (int i = 0; i < (int)(Math.random()*10)+(width/100+height/100); i++)
      {
        aList.add(new Asteroid());
      }
      ship.setX(width/2);
      ship.setY(height/2);
      ship.setXSp(0);
      ship.setYSp(0);
      bullets = 0;
      asteroids = 0;
      lives = 3;
      lost = false;
    }
  }
  if (key == 'c')
  {
    if (aList.size() == 0)
    {
      for (int i = 0; i < (int)(Math.random()*10)+(width/100+height/100); i++)
      {
        aList.add(new Asteroid());
      }
      ship.setX(width/2);
      ship.setY(height/2);
      ship.setXSp(0);
      ship.setYSp(0);
    }
  }
  if (key == ' ')
  {
    SPACEisPressed = true;
  }
  if (key == 'p')
  {
    delay(1000);
  }
}
public void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      UPisPressed = false;
    }
    if (keyCode == DOWN)
    {
      DOWNisPressed = false;
    }
    if (keyCode == RIGHT)
    {
      RIGHTisPressed = false;
    }
    if (keyCode == LEFT)
    {
      LEFTisPressed = false;
    }
  }
  if (key == ' ')
  {
    SPACEisPressed = false;
  }
}
