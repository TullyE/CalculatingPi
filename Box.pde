/**
 Box.pde
 defines the Box class
 Tully Eva
 10/11/2021
 */

class Box
{
  private double mass;
  private double vel;
  private float x;
  private float y;
  private boolean bigger;
  private int size;

  /**
   *constructor for the Box class
   *@param x, y, mass, vel, bigger
   */
  Box(float x, float y, double mass, double vel, boolean bigger)
  {
    this.x = x;
    this.y = y;
    this.mass = mass;
    this.vel = vel;
    this.bigger = bigger;
    size = bigger ? 50 : 10;
  }

  /**
   *Shows the box object
   *and changes the color based on whether or not it's the bigger box
   */
  void show()
  {
    color c = bigger ? color(204, 255, 204) : color(102, 0, 102);
    fill(c);
    rect(x, y, this.size, this.size);
  }

  /**
   *increases the x value by
   *the current velocity
   */
  void move()
  {
    this.x += this.vel;
  }

  /**
   *makes the object go in reverse
   *with the exact same velocity
   */
  void bounce()
  {
    this.vel *= -1;
  }

  /**
   *sets the velocity
   *@param vel
   */
  void setVel(double vel)
  {
    this.vel = vel;
  }

  /**
   *set's the x value
   *@param x
   */
  void setX(float x)
  {
    this.x = x;
  }

  /**
   *returns the size of the box
   *@return size
   */
  int getSize()
  {
    return this.size;
  }

  /**
   *calculates the new velocity
   *based on whether or not it's the big or small box and what
   *it collided with
   *@param m, v
   *@return new velocity
   */
  double calcVel(double m, double v)
  {
    return bigger ? (((2 * m) / (this.mass + m)) * v) + (((this.mass - m) / (this.mass + m)) * this.vel) : (((this.mass - m) / (m + this.mass)  ) * this.vel) + (((2 * m)/(m + this.mass)) * v);
  }

  /**
   *returns the mass
   *@return mass
   */
  double getMass()
  {
    return this.mass;
  }

  /**
   *returns the velocity of the box
   *@return velocity
   */
  double getVel()
  {
    return this.vel;
  }

  /**
   *returns the x value of the current box
   *@return x
   */
  float getX()
  {
    return this.x;
  }

  /**
   *detects if the two boxes are have collided
   *@return collision
   */
  boolean collision(float x)
  {
    if (this.x + this.size >= x)
    {
      return true;
    }
    return false;
  }

  /**
   *returns if it's the bigger box or not
   */
  boolean bigger()
  {
    return this.bigger;
  }
}
