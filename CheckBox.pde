/**
 CheckBox.pde
 defines the CheckBox class
 Tully Eva
 10/11/2021
 */

class CheckBox
{
  private int x;
  private int y;
  private int size;
  private int nVal;
  private boolean checked;

  /**
   *constructor for the Box class
   *@param x, y, size, nVal
   */
  CheckBox(int x, int y, int size, int nVal)
  {
    this.nVal = nVal;
    this.x = x;
    this.y = y;
    this.size = size;
    this.checked = this.nVal == 0 ? true : false;
  }

  /**
   *shows the checkbox and whether or not it's selected or not
   */
  void show()
  {
    color c = this.checked ? color(0, 157, 254) : color(190, 230, 255);
    fill(c);
    stroke(0);
    rect(this.x, this.y, this.size, this.size);
    fill(0);
    textSize(50);
    text(nVal, this.x + 10, this.y + this.size - 10 );
  }

  /**
   *unselects the box
   */
  void unCheck()
  {
    checked = false;
  }

  /**
   *returns the n value stored in the
   *check box
   *@return n
   */
  int getN()
  {
    return this.nVal;
  }

  /**
   *returns whether or not the mouse clicked on the box
   *@param x, y
   *@return true/false
   */
  boolean hit(int x, int y)
  {
    if ((x > this.x && x < this.x + this.size) && (y > this.y && y < this.y + this.size))
    {
      checked = true;
      return true;
    }
    return false;
  }
}
