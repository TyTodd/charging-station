class Entry{
  String text ="";
   float x,y,w,h,r,xStep, yStep, wStep,hStep,endX,endY;
  float endW=560;
  float endH=56;
  int fill;
  boolean hide;
  String name;
  boolean warp;
  int opacity=0;
  Entry(float ex,float ey){
      x=ex;
      y=ey;
      hide=false;
      fill=0;
      warp=false;
      w=560;
      h=56;
  }
  
  Entry(int sx, int sy, int ex,int ey){
      endX=ex;
      endY=ey;
      x=sx;
      y=sy;
      h=20;
      w=20;
    xStep=abs(endX-sx)/numSteps;
    yStep= abs(endY-sy)/numSteps;
    wStep = abs(endW-w)/numSteps;
    hStep = abs(endH-h)/numSteps;
      hide=false;
      fill=0;
      warp=true;
  }
  
  void run(){
    //if(warp)
      //warp();
      fill(255);
      stroke(153,0,0);
      rect(x, y, w, h, 20);
      textSize(30);
      fill(fill);
      pushMatrix();
      translate(x,y);
      textAlign(CENTER,CENTER);
      text(text,270,30);
      popMatrix();
  }
  void clearAll(){
    text="";
  }
  
  void backspace(){
    if(text.length()>0)
    text=text.substring(0,text.length()-1);
  }
  
  void insert(String s){
    fill=0;
    if(text.length()>0 && Character.isLetter(text.charAt(0)))
      clearAll();
    if(text.length()<6){
    text+=s;
    }
  }
  
  void error(String e){
    text=e;
    fill=#ff0808;
  }
  
 //void prompt(boolean dropOff){
 //  if(dropOff)
 //      //message="Please enter your student number or a six digit pin";
       
 //   else
 //      //message="Welcome back! Please enter the pin you previously used with us";
    
 //}

  
  void hide(){
    hide=true;
  }
  void show(){
    hide=false;
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
  }
  
  void fadeIn(){
    if(opacity<255){
   opacity+=fadeSpeed;
   stroke(0);
  fill(153,0,0,opacity);
  rect(x, y, w, h, r);
  pushMatrix();
  translate(x,y);
  fill(255);
  popMatrix(); 
 }
 else{
   run();
 }
  }
  
  //void preview(){
  //  image(img,x,y,w,h);
  //  int xVal=w/3;
  //  int yVal=h/3;
  //  drawLines(xVal,yVal);
  //  if(mouseX>x-10 && mouseX<x+w+10 && mouseY>y-10 && mouseY<y+h+10 && mousePressed){
  //  if(keyPressed && keyCode==SHIFT){
  //  if(mouseX>x-10 && mouseX < x+xVal ){
  //      x=mouseX;
  //      w+=(pmouseX-mouseX);
  //      //background(229,229,229);
  //      //drawLines(xVal,yVal);
  //      //image(img,bx,by,bw,bh);
  //  }
    
  //  if(mouseX>(x+w-xVal) && mouseX<x+w+10){
  //      w-=(pmouseX-mouseX);
  //      //background(229,229,229);
  //      //drawLines(xVal,yVal);
  //      //image(img,bx,by,bw,bh);
  //    }
    
  //  if(mouseY>y-10 && mouseY < y+yVal){
  //      y=mouseY;
  //      h+=(pmouseY-mouseY);
  //      //background(229,229,229);
  //      //drawLines(xVal,yVal);
  //      //image(img,bx,by,bw,bh);
  //    }
    
  //  if(mouseY>(y+h-yVal) && mouseY<y+h+10){
  //      h-=(pmouseY-mouseY);
  //      //background(229,229,229);
  //      //drawLines(xVal,yVal);
  //      //image(img,bx,by,bw,bh);
  //  }
  //  }
  //  else{
    
  //  if(mouseX>x && mouseX<(x+w) && mouseY>y && mouseY<(y+h)
  //      && mousePressed){
  //    x=(mouseX-w/2)/10*10;
  //    y=(mouseY-h/2)/10*10;
  //    //background(229,229,229);
  //    //drawLines(xVal,yVal);
  //    //image(img,bx,by,bw,bh);
  //    }
  //  }
  //  }
  //  println(name + "," + x + "," + y + "," + w +","+h);
  //}
  //void drawLines(int xVal,int yVal){
  //  stroke(0,0,255);
  //  line(x,y+yVal,x+w,y+yVal);
  //  line(x+xVal,y,x+xVal,y+h);
  //  line(x,y+h-yVal,x+w,y+h-yVal);
  //  line(x+w-xVal,y,x+w-xVal,y+h);
  //}
}
