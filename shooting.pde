
void setup()
{
  size(550,900);
  //--vanish key--
  noCursor();
  //frameRate(30);
}

  //--myship function-- 
void ship(int x, int y)
{
  //--ship--
  stroke(255,0,0);
  noFill();
  triangle(x,y-20,x-20,y+15,x+20,y+15);
  fill(255,0,0);
  ellipse(x,y,20,50);
  
  //--laser--
  if(keyPressed)
  {
    if(key=='Z'||key=='z')
    {
    stroke(0,0,255);
    line(x+10,y-20,x+10,0);
    line(x-10,y-20,x-10,0);
    }
    }
  }
  
  //--bullet function--
  float bx=160;
  float by=0;
  float r=10;
  
  void bullet()
  {
    by+=7;
    stroke(255,0,0);
    ellipse(bx,by,r,r);
    
    if(by>=height)
    {
      by=0;
      bx=random(width);
    }
  }
  
void draw()
{
  background(0);
  ship(mouseX,mouseY);
  bullet();
  
}
