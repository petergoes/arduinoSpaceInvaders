class Space
{
  int[][][]      lights;
  int            columns;
  int            rows;
  int            prevSecond;
  Player         player;
  InvaderManager invaderManager;
  
  Space ( int _columns, int _rows )
  {
    columns = _columns;
    rows    = _rows;
    lights  = new int[columns][rows][3];
    
    player = new Player();
    invaderManager = new InvaderManager( columns, rows );
    
    _initialize();
  }
  
  public void update()
  {
    Boolean step = false;
    if ( prevSecond != second() )
    {
      step = true;
      prevSecond = second();
    }
    if ( step )
    {
      invaderManager.update();
    }
    
    _render();
  }
  
  public int[][][] lightsToRender()
  {
    return lights;
  }
  
  public void interactionLeft()
  {
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
    
    
    // render invaders
    Invader[] invaders = invaderManager.getInvadersArray();
    int[] invaderColor = invaderManager.getColorArray();
    int totalInvaders = invaders.length;
    for ( int i = 0; i < totalInvaders; i++ )
    {
      Invader invader = invaders[i];
      if ( invader != null )
      {
        lights[invader.x][invader.y][0] = invaderColor[0];
        lights[invader.x][invader.y][1] = invaderColor[1];
        lights[invader.x][invader.y][2] = invaderColor[2];
      }
    }
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
