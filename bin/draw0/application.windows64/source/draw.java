import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class draw extends PApplet {

String filename = "drawgraph.raw";

float[] x;
float[] y;
float[] vx;
float[] vy;
float[] fx;
float[] fy;
float deltat=0.05f;
float len=50;
float k=5;
float rep=20;
float atte=0.2f;
boolean dynamics = false;
boolean repulsion = true;

int sel = -1;

int num ;
boolean[][] adj;

float minx;
float maxx;
float miny;
float maxy;
float scale=1;
float cx=300;
float cy=300;
float deltascale=1.05f;
float strokeweight=1.5f;
float strokewextra=8;
float radius=12;
float mradius=32;
int bgcolor=0xffFFFFFF;
int helpcolor=0xffBBBBBB;
int fillcolor=0xffBBBBFF;
//color fillcolor=#FFFF00;
//color circpencolor=#999999;
int circpencolor=0xff444444;
int linepencolor=0xff444444; 
int textcolor=0xff000000;
boolean help = false;
boolean labels = false;
boolean fit=false;
boolean move=false;
float mx0,my0;
String helpstring=" h - toggle this help message\n f - fit graph into window\n l - toggle labels on/off\n d - toggle dynamics on/off\n r - toggle repulsion on/off\n s - save & quit\n q - quit without saving";

public void setup(){
  size(600, 600);
  importgraph();
  fill(fillcolor);
  strokeWeight(strokeweight);
  textAlign(CENTER,CENTER);
  textSize(10);
}

public void draw(){
     background(255);
     //rotate(PI/12);
     //translate(200,200);
     if(sel>=0){
       x[sel]=(mouseX-cx)*scale;
       y[sel]=(mouseY-cy)*scale;
     }
     if(move){
       cx=cx+(mouseX-mx0);mx0=mouseX;
       cy=cy+(mouseY-my0);my0=mouseY;
     }
     if(fit){
      fitgraph();
    }
    if(dynamics){
       fuerzas();
       posiciones();
    } 
    dibuja();
    if(help){
      fill(helpcolor,200);
        rect(0,0,252,191);
      fill(textcolor);
      textAlign(LEFT,TOP);
      textSize(16);
        text(helpstring,10,10);
      fill(fillcolor);
      textAlign(CENTER,CENTER);
      textSize(10);
    }
}

public void dibuja(){
//edges
    for(int i=0;i<num;i++){
      for( int j=i+1;j<num;j++){
        if (adj[i][j]){
           //stroke(bgcolor);strokeWeight(strokewextra); 
           //line(cx+x[i]/scale,cy+y[i]/scale,cx+x[j]/scale,cy+y[j]/scale);
           stroke(linepencolor);strokeWeight(strokeweight);
           line(cx+x[i]/scale,cy+y[i]/scale,cx+x[j]/scale,cy+y[j]/scale);
        }
      }
    }
//vertices
    stroke(circpencolor);
    for(int i=0;i<num;i++){
      ellipse(cx+x[i]/scale,cy+y[i]/scale,radius,radius);
//labels      
      if(labels){
        fill(textcolor); 
        text(str(i+1),cx+x[i]/scale,cy+y[i]/scale);
        fill(fillcolor);
      }
    }
}

public void mousePressed(){
  for(int i =0;i<num;i++){
    if( sq(mouseX-cx-x[i]/scale) + sq(mouseY-cy-y[i]/scale) <= 100)
      sel=i;
  }
  if(sel<0){
    move=true;
    mx0=mouseX;
    my0=mouseY;
  }
}

public void mouseReleased(){
  sel=-1;
  move=false;
}

public void mouseWheel(MouseEvent event) {
  float scale1;
  float e = event.getAmount();
  scale1=scale/pow(deltascale,e);
  cx=mouseX-(mouseX-cx)*(scale/scale1);
  cy=mouseY-(mouseY-cy)*(scale/scale1);
  scale=scale1;
}

public void fuerzas(){
  float ffx,ffy,d,f,xp,yp;
  int i,j;
  for(i=0;i<num;i++){
    ffx=0;ffy=0;
    for(j=0;j<num;j++){
      if(i==j)continue;
      d=sqrt(sq(x[i]-x[j])+sq(y[i]-y[j]));
      if(d==0){
        d=1;//demasiado cerca
        xp=(i<j)?0.7071f:(-0.7071f);
        yp=(i<j)?0.7071f:(-0.7071f);
      }else{//proyecciones
        xp=(x[j]-x[i])/d;
        yp=(y[j]-y[i])/d;
      }
      if(adj[i][j]){ //resorte
        f=k*(d-len);
        ffx=ffx+f*xp;
        ffy=ffy+f*yp;
      }
      if(repulsion){ //repulsion
        ffx=ffx-rep*xp;
        ffy=ffy-rep*yp;
      }
      //resistencia
      ffx=ffx-atte*vx[i];
      ffy=ffy-atte*vy[i];
    }
    fx[i]=ffx;
    fy[i]=ffy;
  }
}

public void posiciones(){
  float ffx,ffy,l,t;
  int i,j;
  for(i=0;i<num;i++){
    if (i!=sel){
      vx[i]=vx[i]+fx[i]*deltat;
      vy[i]=vy[i]+fy[i]*deltat;
      x[i]=x[i]+vx[i]*deltat;
      y[i]=y[i]+vy[i]*deltat;
    }
  } 
}

public void importgraph(){
   String[] lines = loadStrings(filename);
   String[] parts;
   num=PApplet.parseInt(lines[0]);
   x=new float[num]; y=new float[num];
   fx=new float[num];fy=new float[num];
   vx=new float[num];vy=new float[num];
   adj=new boolean[num][num];
   for(int i=0;i<num;i++){
     parts = split(lines[i+1]," ");
     x[i]=PApplet.parseFloat(parts[0]);
     y[i]=PApplet.parseFloat(parts[1]);
   }
   for(int i=0;i<num;i++){
     for(int j=0;j<num;j++){
       adj[i][j]=(lines[i+num+1].charAt(j)=='1');
     }
   }
}

public void exportgraph(){
    String[] lines = new String[2*num+1];
    String[] parts = new String[2];
    char bits[] = new char[num];
    lines[0]=str(num);
   for(int i=0;i<num;i++){
     parts[0]=str(PApplet.parseInt(cx+x[i]/scale-300));
     parts[1]=str(PApplet.parseInt(cy+y[i]/scale-300));
     lines[i+1]=join(parts," ");       
   }
   for(int i=0;i<num;i++){
     for(int j=0;j<num;j++){
       if(adj[i][j]){
         bits[j]='1';
       }else{
         bits[j]='0';
       }
     }
     lines[i+num+1]=new String(bits);
   } 
   saveStrings(filename,lines);
}

public void fitgraph(){
     float l,mx,my;
     if(num<=0){
     }else if(num==1){
       cx=300-x[0]/scale;
       cy=300-y[0]/scale;
     }else{
       minx= 1000000;
       maxx=-1000000;
       miny= 1000000;
       maxy=-1000000;
       for(int i=0;i<num;i++){
         minx=min(x[i],minx);
         miny=min(y[i],miny);
         maxx=max(x[i],maxx);
         maxy=max(y[i],maxy);
       }
       l=max(maxy-miny,maxx-minx);
       scale=l/(600*0.8f);
       mx=minx+(maxx-minx)/2;
       my=miny+(maxy-miny)/2;
       cx=300-mx/scale;
       cy=300-my/scale;
     }
     fit=false;
}


public void keyReleased(){
   switch(key){
      case 'd':
      case 'D':
        dynamics=!dynamics;
         break;
      case 'l':
      case 'L':
        labels=!labels;
        radius=mradius-radius;
        break;
      case 'f':
      case 'F':
        fit=true;
        break;
      case 'r':
      case 'R':
        repulsion=!repulsion;
        break;
      case 'h':
      case 'H':
        help=!help;
        break;
      case 'q':
      case 'Q':
        exit();
        break;
      case 's':
      case 'S':
        exportgraph();exit();
        break;
   } 
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "draw" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
