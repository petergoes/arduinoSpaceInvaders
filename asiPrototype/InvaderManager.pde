class InvaderManager
{
  color invaderColor;
  Invader[] invaders;
  
  InvaderManager( int columns, int rows )
  {
    invaderColor = #ff0000;
    invaders = new Invader[columns * rows];
    invaders[0] = new Invader(0, 0);
  }
  
  public void update()
  {
    println("second");
  }
  
  public Invader[] getInvadersArray()
  {
    return invaders;
  }
  
  public int[] getColorArray()
  {
    int[] colors = new int[3];
    colors[0] = (invaderColor >> 16) & 0xFF; // Red
    colors[1] = (invaderColor >> 8)  & 0xFF; // Green
    colors[2] =  invaderColor        & 0xFF; // Blue
    
    return colors; 
  }
}
