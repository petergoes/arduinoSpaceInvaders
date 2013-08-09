class Space
{
  int[][][] lights;
  int columns;
  int rows;
  Player player;
  
  Space ( int _columns, int _rows )
  {
    columns = _columns;
    rows    = _rows;
    lights  = new int[columns][rows][3];
    
    player = new Player();
    
    _initialize();
  }
  
  public void update()
  {
    // move Player
    
    _render();
  }
  
  public int[][][] lightsToRender()
  {
    return lights;
  }
  
  public void interactionLeft()
  {
    println("interact left");
    int playerX = player.getX();
    if ( playerX != 0 )
    {
      player.movePlayer( playerX - 1 );
    }
  }
  
  public void interactionRight()
  {
    int playerX = player.getX();
    if ( playerX < columns - 1 )
    {
      player.movePlayer( playerX + 1 );
    }
  }
  
  private void _initialize()
  {
    _resetLights();
  }
  
  private void _render()
  {
    _resetLights();
    
    // render player
    int playerX = player.getX();
    int[] playerC = player.getColorArray();
    lights[playerX][rows - 1][0] = playerC[0];
    lights[playerX][rows - 1][1] = playerC[1];
    lights[playerX][rows - 1][2] = playerC[2];
  }
  
  private void _resetLights()
  {
    for ( int x = 0; x < columns; x++ )
    {
      for ( int y = 0; y < rows; y++ )
      {
        int r = 0;
        int g = 0;
        int b = 0;
        
        lights[x][y][0] = r;
        lights[x][y][1] = g;
        lights[x][y][2] = b;
      }
    }
  }
}
