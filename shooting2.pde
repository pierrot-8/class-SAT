Boss boss;

void setup()
{
  size(550,900);
  //--vanish key--
  noCursor();
  //frameRate(30);
  //rectMode(CENTER);
  
  boss=new Boss(width/2,30);
}

  //--myship function-- 
void ship(int x, int y)
{
  //--ship--
  stroke(255,0,0);
  noFill();
  triangle(x,y-20,x-20,y+15,x+20,y+15);
  fill(255,0,0);
  ellipse(x,y,20,60);
  
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
  
  //--bullet class--
class Bullet
{
  float bx,by,br,vx,vy;
  Bullet(float x,float y,float r,float lvx,float lvy)
  {
    bx=x;
    by=y;
    br=r;
    vx=lvx;
    vy=lvy;
  }
  //--bullet clean--
  boolean update()
  {
    bx+=vx;
    by+=vy;
    stroke(255,0,0);
    ellipse(bx,by,10,br);
    
    if(by>height || by<0 || bx>width || bx<0)
    {
      return false;
    }
    return true;
  }
}

  //--boss class--
class Boss
{
  float bx, by;
  ArrayList barrage;
  
  Boss(float x,float y)
  {
    bx=x;
    by=y;
    barrage = new ArrayList();
  }
 
 void fire_360(float x,float y)
  {
    for(int i=0; i<360; i+=10)
    {
      float rad =radians(i);
      barrage.add(new Bullet(x,y,30,cos(rad),sin(rad)));
    }
  }
  
  void update()
  {
    //--boss update--
    float dx;
    dx =200.0*cos(radians(frameCount*2));
    stroke(0,255,0);
    fill(0,255,0);
    rect(bx+dx,by,50,20);
    
    //--fire--
    if(frameCount%60==0)fire_360(bx+dx,by);
    
    //--barrage update--
    for(int i=barrage.size()-1;i>=0;i--)
    {
      Bullet b=(Bullet)barrage.get(i);
      if(b.update()==false)
      barrage.remove(i);
    }
  }
}
  
void draw()
{
  background(0);
  ship(mouseX,mouseY);
  boss.update(); 
}
