import java.util.Map;
String filename = System.getProperty("user.dir") + File.separator + "drawgraph.raw";
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
boolean dynamics = false;
boolean repulsion = false;

int sel = -1;

float arrowposition=0.8;
float arrowangle=radians(20.0);
float arrowlen=10.0;
float auxangle;
float arrowx;
float arrowy;

int num ;
int numHigh;
Map<Integer,Integer> vertexColoring=new HashMap<Integer,Integer>();   
Map<String,Integer> edgeColoring=new HashMap<String,Integer>();
color[] colors;
boolean[][] adj;

float minx;
float maxx;
float miny;
float maxy;
float scale=1;
int canvasWidth = 600; //default canvas width
int canvasHeight = 600;//default canvas height
float centerX=canvasWidth/2;
float centerY=canvasHeight/2;
float cx=centerX;
float cy=centerY;
float deltascale=1.05;
float strokeweight=1.5;
float strokewextra=8;
float radius=6;
float mradius=16;
color bgcolor=#FFFFFF;
color helpcolor=#BBBBBB;
color fillcolor=#BBBBFF;
color fillhighcolor=#FF4444;
color circpencolor=#444444;
color linepencolor=#444444; 
color textcolor=#000000;
boolean help = false;
boolean labels = false;
boolean fit=false;
boolean move=false;
float mx0,my0;
String helpstring=" H - toggle this help message\n F - fit graph into window\n L - toggle labels on/off\n D - toggle dynamics on/off\n R - toggle repulsion on/off\n S - save & quit\n ESC - quit without saving";

void setup(){      
  surface.setSize(canvasWidth, canvasHeight);       
  importgraph();
  fill(fillcolor);
  strokeWeight(strokeweight);
  textAlign(CENTER,CENTER);
  textSize(10);    
}

void draw(){
    
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
      fitgraph(); //<>//
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

void dibuja(){
    color edgeColor;
//edges
    for(int i=0;i<num;i++){
      for( int j=i+1;j<num;j++){
        if (adj[i][j] || adj[j][i]){          
          
            if(adj[i][j] && adj[j][i]  && edgeColoring.get(i + "," + j)!=null){//edge color i<->j
              edgeColor = colors[edgeColoring.get(i + "," + j)];
            }else if (adj[i][j] && adj[j][i]  && edgeColoring.get(j + "," + i)!=null){//edge color i<->j              
              edgeColor = colors[edgeColoring.get(j + "," + i)];
            }else if (adj[i][j] && !adj[j][i] && edgeColoring.get(i + "," + j)!=null){//edge color i->j
              edgeColor = colors[edgeColoring.get(i + "," + j)];
            }else if (adj[j][i] && !adj[i][j] && edgeColoring.get(j + "," + i)!=null){//edge color j->i
              edgeColor = colors[edgeColoring.get(j + "," + i)];
            } else {
              edgeColor = linepencolor;
            }            
            stroke(edgeColor);
            strokeWeight(strokeweight);
            // i--j (no arrows)
            line(cx+x[i]/scale,cy+y[i]/scale,cx+x[j]/scale,cy+y[j]/scale);
          if (!adj[j][i]){ // i->j
             auxangle= atan2(y[j]-y[i],x[j]-x[i]);
             arrowx= cx+(arrowposition*x[j]+(1-arrowposition)*x[i])/scale;
             arrowy= cy+(arrowposition*y[j]+(1-arrowposition)*y[i])/scale;
             line(arrowx,arrowy,arrowx-arrowlen*cos(auxangle-arrowangle),arrowy-arrowlen*sin(auxangle-arrowangle));
             line(arrowx,arrowy,arrowx-arrowlen*cos(auxangle+arrowangle),arrowy-arrowlen*sin(auxangle+arrowangle));
          }else if (!adj[i][j]){ // j->i
             auxangle= atan2(y[i]-y[j],x[i]-x[j]);
             arrowx= cx+(arrowposition*x[i]+(1-arrowposition)*x[j])/scale;
             arrowy= cy+(arrowposition*y[i]+(1-arrowposition)*y[j])/scale;
             line(arrowx,arrowy,arrowx-arrowlen*cos(auxangle-arrowangle),arrowy-arrowlen*sin(auxangle-arrowangle));
             line(arrowx,arrowy,arrowx-arrowlen*cos(auxangle+arrowangle),arrowy-arrowlen*sin(auxangle+arrowangle));
          }
        }
      }
    }
//vertices
    stroke(circpencolor);
    for(int i=0;i<num;i++){
      if(adj[i][i]){
        noFill();
        ellipse(cx+x[i]/scale-radius,cy+y[i]/scale-radius,2.8284*radius,2.8284*radius); //2.8284 = 2*sqrt(2)
      }
      if(vertexColoring.get(i)!=null){
        fill(colors[vertexColoring.get(i)]);
      } else {
        fill(fillcolor);
      }
      ellipse(cx+x[i]/scale,cy+y[i]/scale,2*radius,2*radius);
//labels      
      if(labels){
        fill(textcolor); 
        text(str(i+1),cx+x[i]/scale,cy+y[i]/scale);
      }
    }
    fill(fillcolor);
}

void mousePressed(){
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

void mouseReleased(){
  sel=-1;
  move=false;
}

void mouseWheel(MouseEvent event) {
  float scale1;
  float e = event.getAmount();
  scale1=scale/pow(deltascale,e);
  cx=mouseX-(mouseX-cx)*(scale/scale1);
  cy=mouseY-(mouseY-cy)*(scale/scale1);
  scale=scale1;
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
      if(adj[i][j] || adj[j][i]){ //resorte
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
   String[] lines = loadStrings(filename);
   String[] parts, subparts;
   num=int(lines[0]);
   x=new float[num]; y=new float[num];
   fx=new float[num];fy=new float[num];
   vx=new float[num];vy=new float[num];
   adj=new boolean[num][num];     
      
   //build coordinates "x" and "y"
   for(int i=0;i<num;i++){     
     parts = split(lines[i+1]," ");
     x[i]=float(parts[0]);
     y[i]=float(parts[1]);
   }
   
   //build adjacency matrix
   for(int i=0;i<num;i++){
     for(int j=0;j<num;j++){
       adj[i][j]=(lines[i+num+1].charAt(j)=='1');
     }
   }   
   
   //colors
   if(lines.length>=2*num+3){     
     //build an array of the colors used for this graph
     parts = splitTokens(lines[2*num+1]," ");
     colors=new color[parts.length];
     for(int i=0; i<colors.length; i++){
       colors[i]=unhex("FF" + parts[i]);//#FF4444     
     }   
     
     //build an array for vertex coloring
     parts = splitTokens(lines[2*num+2]," ");     
     for(int i=0; i<parts.length; i++){
       subparts = split(parts[i],":");
       //put(vertexNumber, index of array of Colors)
       vertexColoring.put(int(subparts[0]), int(subparts[1]));
     }
   }
   
   //build an array for edge coloring
   if(lines.length>=2*num+4){     
     parts = splitTokens(lines[2*num+3]," ");
     for(int i=0; i<parts.length; i++){
       subparts = split(parts[i],":");
       //put(edge as string, index of array of Colors)
       edgeColoring.put(subparts[0], int(subparts[1]));
     }
   }   
}

void exportgraph(){  
    String[] parts = new String[2];
    char bits[] = new char[num];
    String[] lines;
    int index;
        
    if(vertexColoring.size()>0 && edgeColoring.size()>0){      
      lines = new String[2*num+4];    
    } else if(vertexColoring.size()>0 && edgeColoring.size()==0){
      lines = new String[2*num+3];
    } else {
       lines = new String[2*num+1];
    }
         
    lines[0]=str(num);
    //coordinates
     for(int i=0;i<num;i++){
       parts[0]=str(int(cx+x[i]/scale-centerX));
       parts[1]=str(int(cy+y[i]/scale-centerY));
       lines[i+1]=join(parts," ");       
     }
     //adjacency matrix
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
     
     //colors
     if(vertexColoring.size()>0){
       //build a codification for all colors used for this graph
       parts= new String[colors.length];
       for(int i=0; i<colors.length; i++){
         parts[i]=hex(colors[i],6);
       }
       lines[2*num+1]=join(parts," ");     
       
       //build a codification for vertex coloring
       parts= new String[vertexColoring.size()];
       index=0;
       for (Map.Entry<Integer, Integer> e : vertexColoring.entrySet()) {
         parts[index]=new String(e.getKey() + ":" + e.getValue());
         index=index+1;
       }
       lines[2*num+2]=join(parts," ");             
     }         
     
     //build a codification for edge coloring
     if(edgeColoring.size()>0){
       parts= new String[edgeColoring.size()];
       index=0;       
       for (Map.Entry<String, Integer> e : edgeColoring.entrySet()) {         
         parts[index]=new String(e.getKey() + ":" + e.getValue());         
         index=index+1;
       }
       lines[2*num+3]=join(parts," ");
     }      
     saveStrings(filename,lines);
}

void fitgraph(){
     float l,mx,my;
     if(num<=0){
     }else if(num==1){
       cx=centerX-x[0]/scale;
       cy=centerY-y[0]/scale;
     }else{ //<>//
       minx= 1000000; //<>//
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
       scale=l/(width*0.8);
       mx=minx+(maxx-minx)/2;
       my=miny+(maxy-miny)/2;
       cx=centerX-mx/scale;
       cy=centerY-my/scale;
     }
     fit=false;
}


void keyReleased(){
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
      case 's':
      case 'S':
        exportgraph();exit();
        break;
   } 
}
