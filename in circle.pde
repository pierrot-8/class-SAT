float bx,by,br;
float sx,sy,sr;
float fx,fy,fr;
float ratio;

void setup(){
  size(500,500);
  //---b.circle first position---
  bx=width/2;
  by=height/2;
  br=200;
  
  //---s.circle first position---
  sx=width/2;
  sy=height/2;
  sr=50;
}

void draw(){
  background(255);
  
  //---big circle---
  ellipse(bx,by,br*2,br*2);
  //---small circle---
  ellipse(sx,sy,sr*2,sr*2);
  
  //float vx=0;
  //float vy=0;
  //vx=(mouseX-sx)*0.05;
  //vy=(mouseY-sy)*0.05;
  
  //---small circle position---
  sx=mouseX;//+=vx;
  sy=mouseY;//+=vy;
  
  //---proposition---  
  fx=mouseX-bx;
  fy=mouseY-by;
  fr=sqrt(fx*fx+fy*fy);
  
  if(fr+sr>=br)
  {
    ratio=(br-sr)/fr;    //---ratio---
    sx=bx+(fx*ratio);//+ratio;
    sy=by+(fy*ratio);//+ratio;
 
  }
}