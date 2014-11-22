void setup(){
 size(500,500,P3D);
noStroke(); 
}
 
void quad(PVector v1,PVector v2,PVector v3,PVector v4){
  
  vertex(v1.x,v1.y,v1.z);
  vertex(v2.x,v2.y,v2.z);
  vertex(v3.x,v3.y,v3.z);
  vertex(v1.x,v1.y,v1.z);
  vertex(v3.x,v3.y,v3.z);
  vertex(v4.x,v4.y,v4.z);
  
}
 
 float ry=0; 
  
void draw(){
  background(100);
  lights();
  translate(width/2,height/2);
  beginCamera();
  camera(0,-100,300,0,0,0,0,1,0);
  //rotateZ(PI/3);
  endCamera();
  rotateY(ry);
  ry+=0.01;
  beginShape(TRIANGLES);
  
  PVector v1=new PVector(-20, 40, 40);
  PVector v2=new PVector(-20,-40, 40);
  PVector v3=new PVector( 20,-40, 40);
  PVector v4=new PVector( 20, 40, 40); 
  
  PVector v5=new PVector(-20, 40, -40);
  PVector v6=new PVector(-20,-40, -40);
  PVector v7=new PVector( 20,-40, -40);
  PVector v8=new PVector( 20, 40, -40);
  
  PVector v9 =new PVector(40, 40, 20);
  PVector v10=new PVector(40,-40, 20);
  PVector v11=new PVector(40,-40, -20);
  PVector v12=new PVector(40, 40, -20);
  
  PVector v13=new PVector( -40, 40, -20);
  PVector v14=new PVector( -40,-40, -20);
  PVector v15=new PVector( -40,-40,  20);
  PVector v16 =new PVector(-40, 40,  20);
  
  
  //PVector v5=new PVector(-50,-50,-50);
  //PVector v6=new PVector( 50,-50,-50);
  //PVector v7=new PVector( 50, 50,-50);
  //PVector v8=new PVector(-50, 50,-50);
  
  quad(v1,v2,v3,v4);
  quad(v5,v6,v7,v8);
  quad(v9,v10,v11,v12);
  quad(v13,v14,v15,v16);
  
  quad(v16,v15,v2,v1);
  quad(v3,v4,v9,v10);
  quad(v11,v12,v8,v7);
  quad(v5,v6,v14,v13);
  
  //quad(v1,v2,v6,v5);
  //quad(v2,v3,v7,v6);
  //quad(v3,v4,v8,v7);
  //quad(v1,v5,v8,v4);
   
  endShape();

  
}
  