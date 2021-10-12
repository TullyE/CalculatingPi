int n = 2;
//n = anything --> first(n+1) digits of pi;
int collisions = 0;
double littleVel = 0;
double bigVel = -2;
double littleMass = 1;
double bigMass = Math.pow(100, n) * littleMass;
Box big;
Box small;
void setup()
{
  size(500, 500);

  big = new Box(250, 250, bigMass, bigVel, true);
  small = new Box(150, 250 + big.getSize() - 10, littleMass, littleVel, false);
}

void draw()
{
  System.out.println(collisions);
  background(255);
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
    //big.setX(100 + 11);
    //small.setX(101);
    small.bounce();
    collisions += 1;
  }
}
