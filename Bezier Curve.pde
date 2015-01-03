float x1=-200;
float y1=0;
float x3=200;
float y3=0;
float t=0;

void DrawCircle(){
  ellipse(x1,y1,10,10);
  ellipse(x3,y3,10,10);
}

void MoveCircle(float x1,float y1,float x3,float y3,float t){
float mx=mouseX-width/2;
float my=mouseY-height/2;
ellipse(mx,my,10,10);
float x=(1-t)*(1-t)*x1+2*(1-t)*t*mx+t*t*x3;
float y=(1-t)*(1-t)*y1+2*(1-t)*t*my+t*t*y3;
ellipse(x,y,10,10);
}  

void setup(){
  size(500,500);
}
void draw(){
  background(255);
  translate(width/2,height/2);
  
  t+=0.01f;
  if(t>=1){t=0;}
  
  
DrawCircle();
MoveCircle(x1,y1,x3,y3,t); 
  
 println(t);
}
  