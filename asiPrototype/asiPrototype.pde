// prototype variables
int screenWidth  = 480;
int screenHeight = 800;
int lightMargin  = 20;
int cellWidth;
int cellHeight;
int lightWidth;
int lightHeight;

// asi variables
int columns      = 4;
int rows         = 6;

void setup()
{
  size(screenWidth, screenHeight);
  
  cellWidth   = screenWidth / columns;
  cellHeight  = cellWidth;
  
  lightWidth  = cellWidth - lightMargin;
  lightHeight = cellHeight - lightMargin;
  
  background(0);
}

void draw()
{
  clear();
  
  render();
}

void render()
{
  // Draw lights
  for ( int x = 0; x < columns; x++ )
  {
    for ( int y = 0; y < rows; y++ )
    {
      pushMatrix();
      
      translate(cellWidth * x, cellHeight * y);
      fill(64);
      rect( (lightMargin * .5), (lightMargin * .5), lightWidth, lightHeight);
      
      popMatrix();
    }
  }
}
