float[] x;
float[] y;
float[] vx;
float[] vy;
float[] fx;
float[] fy;
float deltat=0.05;
float len=50;
float k=5;
float rep=20;
float atte=0.2;

int sel = -1;

int num ;
boolean[][] adj;

float scale=1;
float deltascale=0.01;
float strokeweight=1.5;
float radius=12;
color fillcolor=#990099;
color circpencolor=#FFFFFF;
color linepencolor=#999999; 

void setup(){
  size(640, 480);
  strokeWeight(strokeweight);
  importgraph();
  background(255);
  fill(255,0,0);
  triangle(0,0,20,0,0,20);
  fill(fillcolor);
  stroke(linepencolor);
  for(int i=0;i<num;i++){
    for( int j=i+1;j<num;j++){
      if (adj[i][j]){ 
        line(x[i]/scale,y[i]/scale,x[j]/scale,y[j]/scale);
      }
    }
  }
  stroke(circpencolor);
  for(int i=0;i<num;i++){
      ellipse(x[i]/scale,y[i]/scale,radius,radius);
  }
}

void draw(){
     background(255);
     fill(255,0,0);
     triangle(0,0,20,0,0,20);
     fill(fillcolor);
     if(sel>=0){
       x[sel]=mouseX*scale;
       y[sel]=mouseY*scale;
     }
    fuerzas();
    posiciones(); 
    stroke(linepencolor);
    for(int i=0;i<num;i++){
      for( int j=i+1;j<num;j++){
        if (adj[i][j]){ 
           line(x[i]/scale,y[i]/scale,x[j]/scale,y[j]/scale);
        }
      }
    }
    stroke(circpencolor);
    for(int i=0;i<num;i++){
      ellipse(x[i]/scale,y[i]/scale,radius,radius);
    }
}

void mousePressed(){
  //sel=2;
  for(int i =0;i<num;i++){
    if( sq(mouseX-x[i]/scale) + sq(mouseY-y[i]/scale) <= 100)
      sel=i;
  }
  if(mouseX+mouseY<=20){
     exportgraph();
     exit();
  }
}

void mouseReleased(){
  sel=-1;
}

void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  scale=scale+e*deltascale;
}

void fuerzas(){
  float ffx,ffy,d,f,xp,yp;
  int i,j;
  for(i=0;i<num;i++){
    ffx=0;ffy=0;
    for(j=0;j<num;j++){
      if(i==j)continue;
      d=sqrt(sq(x[i]-x[j])+sq(y[i]-y[j]));
      if(d==0){
        d=1;//demasiado cerca
        xp=(i<j)?0.7071:(-0.7071);
        yp=(i<j)?0.7071:(-0.7071);
      }else{//proyecciones
        xp=(x[j]-x[i])/d;
        yp=(y[j]-y[i])/d;
      }
      if(adj[i][j]){ //resorte
        f=k*(d-len);
        ffx=ffx+f*xp;
        ffy=ffy+f*yp;
      }else{ //repulsion
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

void posiciones(){
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

void importgraph(){
   //String[] lines = loadStrings("/home/map/Yags/test.gph");
   String[] lines = loadStrings("http://xamanek.izt.uam.mx/map/drawgraph/test.gph");
   String[] parts;
   num=int(lines[0]);
   x=new float[num]; y=new float[num];
   fx=new float[num];fy=new float[num];
   vx=new float[num];vy=new float[num];
   adj=new boolean[num][num];
   for(int i=0;i<num;i++){
     parts = split(lines[i+1]," ");
     x[i]=float(parts[0]);
     y[i]=float(parts[1]);
     
   }
   for(int i=0;i<num;i++){
     for(int j=0;j<num;j++){
       adj[i][j]=(lines[i+num+1].charAt(j)=='1');
     }
   }
}

void exportgraph(){
    String[] lines = new String[2*num+1];
    String[] parts = new String[2];
    char bits[] = new char[num];
    lines[0]=str(num);
   for(int i=0;i<num;i++){
     parts[0]=str(int(x[i]));
     parts[1]=str(int(y[i]));
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
   saveStrings("/home/map/Yags/test.gph",lines);
}

