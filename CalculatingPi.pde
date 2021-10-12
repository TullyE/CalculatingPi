/**
 CalculatingPi.pde
 Main File for Calculating
 PI with collisions
 Tully Eva
 10/11/2021
 */

int n = 0, collisions;
double littleVel, bigVel, littleMass, bigMass;
CheckBox[] boxes = new CheckBox[]{new CheckBox(200, 400, 50, 0), new CheckBox(300, 400, 50, 1), new CheckBox(400, 400, 50, 2)};
Box big, small;

/**
 *set the size and reset all the variable values
 */
void setup()
{
  size(500, 500);
  reset();
}

/**
 *draw all the text
 *clear the previous boxes and perform
 *the calculations for the boxes
 */
void draw()
{
  background(255);
  fill(200);
  rect(0, 0, 100, height);
  rect(100, 300, width, 200);

  textSize(50);
  fill(0);
  rotate(radians(90));
  text("INFINITE MASS", 100, -25);
  rotate(radians(270));
  textSize(25);
  text("COLLISIONS = " + collisions, 300, 50);
  text("n = ", 150, 435);
  text("ELASTIC COLLISIONS", 200, 375);
  textSize(15);
  text("Total is equal to n+1 digits of PI (in this case " + (n + 1) + ")", 200, 70);

  for (CheckBox box1 : boxes)
  {
    box1.show();
  }
  small.show();
  big.show();
  big.move();
  small.move();

  if (small.collision(big.getX()))
  {
    double newBigVel = big.calcVel(small.getMass(), small.getVel());
    double newSmallVel = small.calcVel(big.getMass(), big.getVel());
    big.setVel(newBigVel);
    small.setVel(newSmallVel);
    collisions += 1;
  }
  if (small.getX() <= 100)
  {
    small.bounce();
    collisions += 1;
  }
}

/**
 *checks if the mouse clicked on a CheckBox or not
 */
void mousePressed()
{
  for (CheckBox box1 : boxes)
  {
    if (box1.hit(mouseX, mouseY))
    {
      for (CheckBox box2 : boxes)
      {
        if (box2 != box1)
        {
          box2.unCheck();
        }
      }
      n = box1.getN();
      reset();
    }
  }
}

/**
 *resets all the variables
 */
void reset()
{
  collisions = 0;
  littleVel = 0;
  bigVel = -2;
  littleMass = 1;
  bigMass = Math.pow(100, n) * littleMass;
  big = new Box(250, 250, bigMass, bigVel, true);
  small = new Box(150, 250 + big.getSize() - 10, littleMass, littleVel, false);
}
