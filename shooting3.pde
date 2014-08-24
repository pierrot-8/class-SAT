Boss boss;
Ship ship;
PFont font;
boolean gameover;

void setup()
{
  size(550,900);
  //--vanish key--
  noCursor();
  
  //frameRate(30);
  //rectMode(CENTER);
  
  ship=new Ship();
  boss=new Boss(width/2,50,40);
  
  font=createFont("FFScale",50);
  textFont(font);
  
  gameover=false;
}

  //--myship class--
class Ship
{
  int hp,hp2;
  int sx,sy;
  
  Ship()
  {
    hp=255;
    hp2=255;
    sx=mouseX;
    sy=mouseY;
  }
  
  void hit()
   {
     hp--;
     hp2--;
     
     if(hp<=0)gameover=true;
   }
   

  void update(int x,int y)
  {
    sx=x;
    sy=y;
    //stroke(255,255,255);
    fill(255-hp,0,hp2);
    triangle(x,y-20,x-20,y+15,x+20,y+15);
    fill(255-hp,0,hp2);
    ellipse(x,y,20,60);
  
  //--laser--
  if(keyPressed)
  {
    if(key=='Z'||key=='z')
    {
    stroke(0,0,255);
    line(x+10,y-20,x+10,0);
    line(x-10,y-20,x-10,0);
    
    if(abs(sx-boss.box)<(boss.bow/2))boss.hit();
    }
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
    stroke(0,255,0);
    fill(150,0,150);
    ellipse(bx,by,br,br);
    
  //--area check-- 
    if(by>height || by<0 || bx>width || bx<0)
    {
      return false;
    }
    
  //--hit check--
     if(dist(bx,by,ship.sx,ship.sy)<br/2)ship.hit();
     
    return true;
  }
}

  //--boss class--
class Boss
{
  int hp,bow;
  float box, boy;
  ArrayList danmaku;
  
  Boss(float x,float y,int w)
  {
    box=x;
    boy=y;
    bow=w;
    hp=256;
    danmaku = new ArrayList();
  }
  
  void hit()
  {
    hp--;
    
    if(hp<=0)gameover=true;
  }
 
 void fire_360(float x,float y)
  {
    for(int i=0; i<360; i+=10)
    {
      float rad =radians(i);
      danmaku.add(new Bullet(x,y,15,cos(rad),sin(rad)));
    }
  }
  
  void update()
  {
    //--boss update--
    float dx;
    float dy;
    dx =150.0*cos(radians(frameCount*5));
    dy =40.0*sin(radians(frameCount*2));
    stroke(0,255,0);
    fill(256-hp,0,0);
    ellipse(box+dx,boy+dy,bow,20);
    
    //--fire--
    if(frameCount%60==0)fire_360(box+dx,boy);
    
    //--danmaku update--
    for(int i=danmaku.size()-1;i>=0;i--)
    {
      Bullet b=(Bullet)danmaku.get(i);
      if(b.update()==false)
         danmaku.remove(i);
    }
  }
}

void print_time()
{
  float ft=(float)millis()/1000;
  
  textAlign(RIGHT);
  text(nf(ft,1,2),width,40);
}
  
void draw()
{
  if(gameover)
  {
    textAlign(CENTER);
    if(ship.hp<=0)
    {
      fill(255,255,255);
      text("YOU LOSE",width/2,height/2);
    }
    else
    {
      fill(255*sin(frameCount),255,255*cos(frameCount));
      text("YOU WIN",width/2,height/2);
    }
  }
  else
  {
      background(0);
      
      ship.update(mouseX,mouseY);
      boss.update();
     
      fill(255,255,255);
      print_time();
    } 
 }
