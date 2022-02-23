class Label{
  String name="you don messed up Aaron";
  boolean hide,warp;
  int textSize;
  private float x,y,w,h,r;
  float xStep, yStep, wStep,hStep,tStep,endX, endY, endW, endH;
  int opacity=0;
  int endT;
  
  Label(float bx, float by, float bw, float bh, float radius, String i,int t){
    x=bx;
    y=by;
    w=bw;
    h=bh;
    textSize=t;
    hide=false;
    drawLabel();
    name=i;
    r=radius;
    warp=false;
  }
  
  Label(String i,int t){
    x=0;
    y=2;
    textSize=t;
    w=798;
    h=100;
    r=15;
    hide=false;
    drawLabel();
    name=i;
    warp=false;
  }
  
  Label(float sx, float sy, float bx, float by, float bw, float bh, float radius, 
  String i,int t){
     endX=bx;
      endY=by;
      endW=bw;
      endH=bh;
      endT=t;
      x=sx;
      y=sy;
      h=20;
      w=20;
      textSize=1;
    xStep=abs(endX-sx)/numSteps;
    yStep= abs(endY-sy)/numSteps;
    wStep = abs(endW-w)/numSteps;
    hStep = abs(endH-h)/numSteps;
    tStep= abs(textSize-t)/numSteps;
    warp=true;
    hide=false;
    name=i;
    r=radius;
  }
  
  void drawLabel(){
    if(!hide){
      fill(153,0,0);
      rect(x, y, w, h, r);
      pushMatrix();
      translate(x,y);
      textSize(textSize);
      textAlign(CENTER,CENTER);
      fill(255);
      text(name,w/2,h/2-6);
      popMatrix();
    }
  }
  
  void hide(){
    hide=true;
  }
  
  void show(){
    hide=false;
  }
  
  void changeText(String t){
    name=t;
  }
  
  void warp(){
  if(abs(endX)>=abs(x)+5||abs(endX)<=abs(x)-5)
    x+=xStep;
  if(abs(endY)>=abs(y)+5||abs(endY)<=abs(y)-5)
    y+=yStep;
 if(abs(endW)>=abs(w)+5||abs(endW)<=abs(w)-5)
    w+=wStep;
  if(abs(endH)>=abs(h)+5||abs(endH)<=abs(h)-5)
    h+=hStep;
  if(endT!=(int)textSize)
    textSize+=tStep;
  }
  
  void fadeIn(){
    if(opacity<255){
   opacity+=fadeSpeed;
  fill(153,0,0,opacity);
  strokeWeight(5);
  stroke(255);
  rect(x, y, w, h, r);
  pushMatrix();
  translate(x,y);
  textSize(textSize);
  textAlign(CENTER,CENTER);
  fill(255);
  text(name,w/2,h/2-6);
  popMatrix(); 
 }
 else{
   drawLabel();
 }
  }
  
//  void preview(){
//    image(img,x,y,w,h);
//    int xVal=w/3;
//    int yVal=h/3;
//    drawLines(xVal,yVal);
//    if(mouseX>x-10 && mouseX<x+w+10 && mouseY>y-10 && mouseY<y+h+10 && mousePressed){
//    if(keyPressed && keyCode==SHIFT){
//    if(mouseX>x-10 && mouseX < x+xVal ){
//        x=mouseX;
//        w+=(pmouseX-mouseX);
//        //background(229,229,229);
//        //drawLines(xVal,yVal);
//        //image(img,x,y,w,h);
//    }
    
//    if(mouseX>(x+w-xVal) && mouseX<x+w+10){
//        w-=(pmouseX-mouseX);
//        //background(229,229,229);
//        //drawLines(xVal,yVal);
//        //image(img,x,y,w,h);
//      }
    
//    if(mouseY>y-10 && mouseY < y+yVal){
//        y=mouseY;
//        h+=(pmouseY-mouseY);
//        //background(229,229,229);
//        //drawLines(xVal,yVal);
//        //image(img,x,y,w,h);
//      }
    
//    if(mouseY>(y+h-yVal) && mouseY<y+h+10){
//        h-=(pmouseY-mouseY);
//        //background(229,229,229);
//        //drawLines(xVal,yVal);
//        //image(img,x,y,w,h);
//    }
//    }
//    else{
    
//    if(mouseX>x && mouseX<(x+w) && mouseY>y && mouseY<(y+h)
//        && mousePressed){
//      x=(mouseX-w/2)/10*10;
//      y=(mouseY-h/2)/10*10;
//      //background(229,229,229);
//      //drawLines(xVal,yVal);
//      //image(img,x,y,w,h);
//      }
//    }
//    }
//    println(name + "," + x + "," + y + "," + w +","+h);
//  }
  
//  void drawLines(int xVal,int yVal){
//    stroke(0,0,255);
//    line(x,y+yVal,x+w,y+yVal);
//    line(x+xVal,y,x+xVal,y+h);
//    line(x,y+h-yVal,x+w,y+h-yVal);
//    line(x+w-xVal,y,x+w-xVal,y+h);
//  }
}
