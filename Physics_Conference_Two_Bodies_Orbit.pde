float x,y,vx,vy,a,r,ax,ay,v,x2,y2,vx2,vy2,a2,r2,ax2,ay2,v2;
float KE,PE,ME,KE2,PE2,ME2,TKE,TPE,TME;
float dx,dy,dr,dth,drh,drhx,drhy,rhx,rhy,xp,yp,A;
float dx2,dy2,dr2,dth2,drh2,drhx2,drhy2,rhx2,rhy2,xp2,yp2;

void setup(){
  frameRate(600);
  x=width/2;
  y=height/2-100;
  x2=width/2;
  y2=height/2+100;
  vx=.3;
  vy=0;
  vx2=-.3;
  vy2=0;
  size(1280,730);
}
//make this object-oriented if it needs to be cleaner
void draw(){
  background(0);
  stroke(0,50,0);
  fill(0,100,0);
  if (keyPressed){
    if(x>0&&x<width&&y>0&&y<height){
      if(key=='w'){ //forward boost
        vx=vx+A*drhx;
        vy=vy+A*drhy;
        ellipse(x-(3*drhx),y-(3*drhy),20,20);
      }
      if(key=='a'){ //left boost
        vx=vx+A*drhy;
        vy=vy-A*drhx;
        ellipse(x-(3*drhy),y+(3*drhx),20,20);
      }
      if(key=='s'){ //backward boost
        if(v>0.01){
          vx=vx-A*drhx;
          vy=vy-A*drhy;
          ellipse(x+(3*drhx),y+(3*drhy),20,20);
        }
        if(v<=0.01){
          vx=0;
          vy=0;
          ax=0;
          ay=0;
          ellipse(x,y,24,24);
        }
      }
      if(key=='d'){ //right boost
        vx=vx-A*drhy;
        vy=vy+A*drhx;
        ellipse(x+(3*drhy),y-(3*drhx),20,20);
      }
    }
    if(x2>0&&x2<width&&y2>0&&y2<height){
      if(key=='i'){ //forward boost
        vx2=vx2+A*drhx2;
        vy2=vy2+A*drhy2;
        ellipse(x2-(3*drhx2),y2-(3*drhy2),20,20);
      }
      if(key=='j'){ //left boost
        vx2=vx2+A*drhy2;
        vy2=vy2-A*drhx2;
        ellipse(x2-(3*drhy2),y2+(3*drhx2),20,20);
      }
      if(key=='k'){ //backward boost
        if(v2>0.01){
          vx2=vx2-A*drhx2;
          vy2=vy2-A*drhy2;
          ellipse(x2+(3*drhx2),y2+(3*drhy2),20,20);
        }
        if(v2<=0.01){
          vx2=0;
          vy2=0;
          ax2=0;
          ay2=0;
          ellipse(x2,y2,24,24);
        }
      }
      if(key=='l'){ //right boost
        vx2=vx2-A*drhy2;
        vy2=vy2+A*drhx2;
        ellipse(x2+(3*drhy2),y2-(3*drhx2),20,20);
      }
    }
    if(key=='z'){
      frameRate(1);
    }
    if(key=='x'){
      frameRate(60);
    }
    if(key=='c'){
      frameRate(600);
    }
  }
  stroke(0,0,50);
  fill(0,0,255);
  ellipse(x2,y2,20,20);
  stroke(50,0,0);
  fill(255,0,0);
  ellipse(x,y,20,20);
  r=sqrt(((x-x2)*(x-x2))+((y-y2)*(y-y2)));
  r2=sqrt(((x2-x)*(x2-x))+((y2-y)*(y2-y)));
  A=.002;
  a=-100/(r*r);
  a2=-100/(r2*r2);
  ax=a*(x-x2)/r;
  ax2=a2*(x2-x)/r2;
  ay=a*(y-y2)/r;
  ay2=a2*(y2-y)/r2;
  vx=vx+ax;
  vx2=vx2+ax2;
  vy=vy+ay;
  vy2=vy2+ay2;
  x=x+vx;
  x2=x2+vx2;
  y=y+vy;
  y2=y2+vy2;
  xp=x-vx;
  yp=y-vy;
  dx=x-xp;
  dy=y-yp;
  xp2=x2-vx2;
  yp2=y2-vy2;
  dx2=x2-xp2;
  dy2=y2-yp2;
  v=sqrt(vx*vx+vy*vy);
  v2=sqrt(vx2*vx2+vy2*vy2);
  dr=sqrt(dx*dx+dy*dy);
  drhx=dx/dr; //cosTheta
  drhy=dy/dr; //sinTheta
  dr2=sqrt(dx2*dx2+dy2*dy2);
  drhx2=dx2/dr2; //cosTheta
  drhy2=dy2/dr2; //sinTheta
  KE=v*v/2.;
  PE=-100/(r);
  ME=KE+PE;
  KE2=v2*v2/2.;
  PE2=-100/(r2);
  ME2=KE2+PE2;//something's wrong with the energies
  TKE=KE+KE2;
  TPE=PE+PE2;
  TME=ME+ME2;
  fill(255,100,100);
  text("velocity="+str(v),40,40);
  text("acceleration="+str(a*-1),40,50);
  text("Kinetic Energy="+str(KE),40,60);
  text("Potential Energy="+str(PE),40,70);
  text("Mechanical Energy="+str(ME),40,80);
  fill(100,100,255);
  text("velocity="+str(v2),1000,40);
  text("acceleration="+str(a2*-1),1000,50);
  text("Kinetic Energy="+str(KE2),1000,60);
  text("Potential Energy="+str(PE2),1000,70);
  text("Mechanical Energy="+str(ME2),1000,80);
  fill(255,0,255);
  text("distance="+str(r),520,50);
  text("Kinetic Energy="+str(TKE),520,60);
  text("Potential Energy="+str(TPE),520,70);
  text("Mechanical Energy="+str(TME),520,80);
  text("Something's wrong with the energy levels.",520,40);
  fill(255,0,0);
  if(x>=width*1.5||x<=0-width/2){
    vx=-vx;
  }
  if(y>=height*1.5||y<=0-height/2){
    vy=-vy;
  }
  fill(0,0,255);
  if(x2>=width*1.5||x2<=0-width/2){
    vx2=-vx2;
  }
  if(y2>=height*1.5||y2<=0-height/2){
    vy2=-vy2;
  }
}