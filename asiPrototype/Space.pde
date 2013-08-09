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
    
    initialize();
  }
  
  void initialize()
  {
    resetLights();
  }
  
  void update()
  {
    // move Player
    
    render();
  }
  
  void render()
  {
    // render player
    int playerX = player.getX();
    int[] playerC = player.getColorArray(); 
    lights[playerX][rows - 1][0] = playerC[0];
    lights[playerX][rows - 1][1] = playerC[1];
    lights[playerX][rows - 1][2] = playerC[2];
  }
  
  void resetLights()
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
  
  int[][][] lightsToRender()
  {
    return lights;
  }
}
