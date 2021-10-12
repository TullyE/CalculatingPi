class Box
{
  private double mass;
  private double vel;
  private float x;
  private float y;
  private boolean bigger;
  private int size;
  Box(float x, float y, double mass, double vel, boolean bigger)
  {
    this.x = x;
    this.y = y;
    this.mass = mass;
    this.vel = vel;
    this.bigger = bigger;
    size = bigger ? 50 : 10;
  }

  double calcVel(double m, double v)
  {
    return bigger ? (((2 * m) / (this.mass + m)) * v) + (((this.mass - m) / (this.mass + m)) * this.vel) : (((this.mass - m) / (m + this.mass)  ) * this.vel) + (((2 * m)/(m + this.mass)) * v);
  }

  void show()
  {
    fill(0, 255, 0);
    rect(x, y, this.size, this.size);
  }

  void move()
  {
    this.x += this.vel;
  }

  void bounce()
  {
    this.vel *= -1;
  }
  
  void setVel(double vel)
  {
    this.vel = vel;
  }
  
  void setX(float x)
  {
    this.x = x;
  }
  boolean collision(float x)
  {
    if(this.x + this.size >= x) 
    {
      return true;
    }
    return false;
  }

  int getSize()
  {
    return this.size;
  }
  
  double getMass()
  {
    return this.mass;
  }

  double getVel()
  {
    return this.vel;
  }

  float getX()
  {
    return this.x;
  }

  float getY()
  {
    return this.y;
  }

  boolean bigger()
  {
    return this.bigger;
  }

}
