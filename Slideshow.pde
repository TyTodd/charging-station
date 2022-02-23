/*
class Slideshow{
  //Loadscreen variables
 int counter=0;
float stopAt=100;

File flashDrive;
int lastTime;
int opacity=0;

boolean fadeOut;
boolean hide;
  Slideshow(){
    hide=false;
    frameRate(60);
  size(800,480);
  flashDrive = new File(pathname);
  files= new ArrayList<String>();
  Collections.addAll(files,flashDrive.list());
  for(int i=0; i<files.size();i++){
    String file = files.get(i);
    if(!(file.endsWith("png")||
      file.endsWith("jpeg")||
      file.endsWith("jpg"))){
      files.remove(i);
      i--;
      }  
  }
  numImages=files.size();
  thread("loadImages");
  }
  
  void run(){
     if(counter<stopAt)
    loadScreen();
  else
    showImages();
    
    if(mousePressed){
      hide();
      delay(250);
      mouseX=0;
      mouseY=50;
      startPage.show();
    }
   
  }

void loadScreen(){ //shows the load screen while images load
  String text="";
  float percent= counter/stopAt;
  if(counter>=stopAt)
    percent=1;
    
    if(percent<.25 && percent>0)
      text="Loading Images...";
      else if(percent>.25 && percent<.50)
        text="Initiating self-destruct...";
      else if(percent>.50 && percent<.75)
        text="Uninitiating self-destruct...";
      else if(percent>.75 && percent<1)
        text="Starting Program...";
        
  fill(229,229,229);
  rect(0,0,width,height);
  stroke(155,0,0);
  strokeWeight(8);
  rect(width/2-117,height/2,200,100,20);
  fill(155,0,0);
  textSize(25);
  textAlign(CENTER);
  text(text,width/2,height/2-20);
  noStroke();
  arc(width/2+93,height/2+50,50,50,-PI/2,PI/2);
  fill(0,200,0);
  noStroke();
  rect(width/2-113,height/2+4,percent*192,92,16);
  counter++;
}
// shows current image on top of a black rectangle on top of the next 
//image. When images switch the current image and the rectangle reduce their opacity.

void showImages(){
 if(millis()-lastTime>=5000){
      if(curImage<numImages-1){
        curImage++;
        fadeOut=true;
      }
      else{
        curImage=0;
        fadeOut=true;
      }
     lastTime=millis();
   }

   if(fadeOut && opacity>0)
      opacity-=50;
   if(opacity<=0){
     fadeOut=false;
     curPic=nextPic;
     opacity=255;
     thread("loadNextImage");
   }
   
  
   background(0);
   noTint();
  fitImage(nextPic);
   fill(0,opacity);
   rect(0,0,width,height);
    tint(255,opacity);
   fitImage(curPic);
}

void fitImage(PImage image){ //resizes image to fil the screen and draws it
  int iHeight= image.height;
   int iWidth= image.width;
   float wToH= 1.0*iWidth/iHeight;
   float hToW =1.0*iHeight/iWidth;
   
   if(max(iHeight,iWidth)==iWidth){
     iWidth=width;
     iHeight=(int)(width*hToW);
     image.resize(iWidth,iHeight); 
     
   }
   else{
     iWidth=(int)(height*wToH);
     iHeight=height;
     image.resize(iWidth,iHeight);
   }
   image(image,width/2-iWidth/2,height/2-iHeight/2);
}

void show(){
  hide=false;
}

void hide(){
  hide=true;
}
}
*/

class Slideshow{
  //Loadscreen variables
 int counter=0;
float stopAt;
int loopsPerImage=100;

File flashDrive;
int lastTime;
int opacity=0;
 int nextImage;

boolean fadeOut;
boolean hide;

PGraphics ad;
String contact="the main office";
  Slideshow(){
    ad=createGraphics(width,height);
    hide=false;
    frameRate(60);
  size(800,480);
  flashDrive = new File(pathname);
  files= new ArrayList<String>();
  Collections.addAll(files,flashDrive.list());
  for(int i=0; i<files.size();i++){
    String file = files.get(i);
    if(!(file.endsWith("png")||
      file.endsWith("jpeg")||
      file.endsWith("jpg"))){
      files.remove(i);
      i--;
      }  
  }
  numImages=files.size();
  stopAt=files.size()*loopsPerImage;
  images =new PImage[numImages];
  curImage=0;
  nextImage=1;
  thread("loadImages2");
  ad=createGraphics(width,height);
  }
  
  void run(){
     if(images[numImages-1]==null)
    loadScreen();
  else
    showImages();
    
    if(mousePressed){
      hide();
      delay(250);
      mouseX=0;
      mouseY=50;
      startPage.show();
    }
   
  }

void loadScreen(){ //shows the load screen while images load
  String text="";
  float percent= counter/stopAt;
  if(counter>=stopAt)
    percent=1;
    
    if(percent<.25 && percent>0)
      text="Loading Images...";
      else if(percent>.25 && percent<.50)
        text="Initiating self-destruct...";
      else if(percent>.50 && percent<.75)
        text="Uninitiating self-destruct...";
      else if(percent>.75 && percent<1)
        text="Starting Program...";
        
  fill(229,229,229);
  rect(0,0,width,height);
  stroke(155,0,0);
  strokeWeight(8);
  rect(width/2-117,height/2,200,100,20);
  fill(155,0,0);
  textSize(25);
  textAlign(CENTER);
  text(text,width/2,height/2-20);
  noStroke();
  arc(width/2+93,height/2+50,50,50,-PI/2,PI/2);
  fill(0,200,0);
  noStroke();
  rect(width/2-113,height/2+4,percent*192,92,16);
  counter++;
}
/* shows current image on top of a black rectangle on top of the next 
image. When images switch the current image and the rectangle reduce their opacity.
*/
void showImages(){
  
  ad.beginDraw();
   ad.fill(155,0,0);
   ad.rect(width/2-200,height/2-100,400,200);
   ad.textAlign(CENTER);
   ad.text("Your ad here \n To get your ad on the charging station contact " +contact,width/2,height/2);
   ad.endDraw();
   
 if(millis()-lastTime>=5000){
      if(curImage<numImages-1){
        curImage++;
       opacity=0;
      }
      else if(curImage==numImages-1){
        curImage++;
        fadeOut=true;
      }
      else{
        curImage=0;
        opacity=0;
      }
     lastTime=millis();
   }

   if(opacity<255)
      opacity+=45;
   if(fadeOut && opacity>0)
      opacity--;
   
      
   //if(opacity<=0){
   //  fadeOut=false;
   //  curImage=nextImage;
   //   if(curImage<numImages-1)
   //  nextImage= curImage+1;
   //else
   //  nextImage=0;
   //  opacity=255;
   //}
   
   if(curImage<=numImages-1){
   //background(0);
   noTint();
  //fitImage(images[nextImage]);
   fill(0,opacity);
   rect(0,0,width,height);
    tint(255,opacity);
   fitImage(images[curImage]);
   }
   else
     drawBackground();
}

void fitImage(PImage image){ //resizes image to fil the screen and draws it
  int iHeight= image.height;
   int iWidth= image.width;
   float wToH= 1.0*iWidth/iHeight;
   float hToW =1.0*iHeight/iWidth;
   
   if(max(iHeight,iWidth)==iWidth){
     iWidth=width;
     iHeight=(int)(width*hToW);
     image.resize(iWidth,iHeight); 
     
   }
   else{
     iWidth=(int)(height*wToH);
     iHeight=height;
     image.resize(iWidth,iHeight);
   }
   image(image,width/2-iWidth/2,height/2-iHeight/2);
}

void show(){
  hide=false;
}

void hide(){
  hide=true;
}

void drawBackground(){
  ad.beginDraw();
   ad.background(129,129,129);
   ad.fill(255);
   ad.pushMatrix();
   ad.translate(width/2,height/2+50);
   ad.stroke(155,0,0);
   ad.rect(-200,-100,400,200);
   ad.textAlign(CENTER,BOTTOM);
   ad.fill(255);
   ad.textSize(20);
   ad.text("Your ad here!", 0,-200);
   ad.text("To get your ad on the State High Charging Station contact " +contact,0,150);
   ad.fill(0);
   ad.strokeWeight(5);
   //draw screen and arrow
   ad.stroke(0);
   ad.strokeWeight(0);
   ad.rect(-50,-158,100,50);
   ad.stroke(255);
   ad.strokeWeight(5);
   ad.line(0,-160,0,-200);
   ad.line(0,-160,20, -170);
   ad.line(0,-160,-20,-170);
   //Draw Lines that seperate ports
   ad.stroke(155,0,0);
   ad.line(0,-97,0,100);
   for(int i=1;i<=4;i++)
     ad.line(-200,-100+i*50,200,-100+i*50);
   
   ad.popMatrix();
   ad.endDraw();
   background(ad); 
}
}
