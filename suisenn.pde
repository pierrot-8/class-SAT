
void Line1(float a, float b, float c, float d){
  
  //first function
  line(c,firstx*a+b,endx,endx*a+b);
  
  
  //mouse position
  float mx=mouseX-width/2;
  float my=mouseY-height/2;
  ellipse(mx,my,10,10);
  
  //suisenn
  line(mx,my,(mx+a*my-a*b)/(a*a+1),(a*mx+a*a*my-a*a*b)/(a*a+1)+b);
   
}

float katamuki=-1;
float sessen=0;
float firstx=-200;
float endx=200;


void setup(){
  size(400,400);
}

void draw(){
  background(255);
  translate(width/2,height/2);
  
  //base line
  //X
  line(-200,0,200,0);
  //Y
  line(0,-200,0,200);
  
  //?
  //line(-200,200,200,-200);
  Line1(katamuki,sessen,firstx,endx);
  
}
