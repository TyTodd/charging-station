import java.util.Collections;
//Insert name of Flashdrive in ""
String flashDriveName="CHARMEE FD";
String pathname= "/media/pi/" + flashDriveName+"/";
//Insert admin pasword in ""
String password = "531022";

String contact ="the main office";

StartPage startPage;
PortPage portPage;
PinPage pinPage;
ConfirmationPage confirmationPage;
Admin adminPage;
Slideshow slideshow;
String[] pins = new String[8];
Port[] ports = new Port[8];
int fadeSpeed =45;

PFont judson;
  int numSteps=50; //number of steps the war transistion takes to reach its size
  int centerX=300;
  int leftX = 40;
  int rightX = 400;
  int ySpace= 70;
  int yMarg = 170;
//Slideshow variables
  PImage curPic;
  PImage nextPic;
  int curImage=0;
  int numImages;
  ArrayList<String> files;
  PImage[] images;
  
void setup(){
  size(800,480);
  pins=loadStrings("pins.txt");
  startPage= new StartPage();
  pinPage = new PinPage();
  confirmationPage=new ConfirmationPage();
  adminPage= new Admin();
  slideshow= new Slideshow();
  judson= createFont("Judson-Regular.ttf",24);
  textFont(judson);
  
  for(int i=0; i<4; i++){
       ports[i]=new Port(leftX,yMarg+i*ySpace,i+1);
       if(pins[i].length()==6){
          ports[i].inUse=true;
          ports[i].pin=pins[i];
       }
    }
    for(int i=4; i<8; i++){
       ports[i]=new Port(rightX,yMarg+(i-4)*ySpace,i+1);
       if(pins[i].length()==6){
          ports[i].inUse=true;
          ports[i].pin=pins[i];
       }
}

portPage = new PortPage();
}

void draw(){
  //background(229,229,229);
  if(!startPage.hide)
    startPage.run();
  else if(!portPage.hideDropOff)
    portPage.runDropOff();
  else if(!portPage.hidePickUp)
    portPage.runPickup();
  else if(!pinPage.hide)
    pinPage.run();
  else if(!confirmationPage.hide)
    confirmationPage.run();
  else if(!adminPage.hide)
    adminPage.run();
  else if(!slideshow.hide)
    slideshow.run();
}

void printGrid(int w,int l){
for(int i = 0; i<w; i++){
  line(i*width/w, 0, i*width/w, height);
}

for(int i= 0;i<l;i++){
  line(0,i*height/l, width,i*height/l); 
}
}

void loadNextImage(){ //loads the next image on the flashdrive while current image is showing
  if(curImage<numImages-1){
        nextPic=loadImage(pathname+files.get(curImage+1));
        println("image "+files.get(curImage+1)+" loaded");
  }
        else{
        nextPic=loadImage(pathname+files.get(0));
        println("image "+files.get(0)+" loaded");
        }
}

void loadImages(){
   curPic=loadImage(pathname+files.get(0));
   nextPic=loadImage(pathname+files.get(1));
}

void loadImages2(){
  for(int i=0;i<files.size();i++)
    images[i]=loadImage(pathname+files.get(i));
}
