class Button{
  String name;
  public boolean clicked,warp;
  //boolean hide;
  float x,y,w,h,r,xStep, yStep, wStep,hStep,endX,endY,endW,endH;
  float textSize,tStep;
  int endT;
  int opacity=0;
  Button(int bx, int by, int bw, int bh, float radius, String i, float t){
    clicked=false;
    x=bx;
    y=by;
    w=bw;
    h=bh;
    r=radius;
    textSize=t;
    warp=false;
    
    //hide=false;
    //drawButton();
    name=i;
  }
  Button(float sx, float sy,int bx, int by, int bw, int bh, float radius, 
  String i, float t){
    clicked=false;
     endX=bx;
      endY=by;
      endW=bw;
      endH=bh;
      endT=(int)t;
      x=sx;
      y=sy;
      h=20;
      w=20;
      textSize=1;
    xStep=abs(endX-sx)/numSteps;
    yStep= abs(endY-sy)/numSteps;
    wStep = abs(endW-w)/numSteps;
    hStep = abs(endH-h)/numSteps;
    tStep= abs(t-textSize)/numSteps;
    warp=true;
    //hide=false;
    //drawButton();
    name=i;
  }
  
  Button(float bx, float by, String i){
    clicked=false;
    x=bx;
    y=by;
    w=70;
    h=65;
    r=15;
    textSize=56;
    //hide=false;
    //drawButton();
    name=i;
    warp=false;
  }
  
  public void resetClicked(){
    clicked=false;
  }
  
  void drawButton(){ 
    //if(!hide){
    if(mouseInside() && mousePressed)
      clicked=true; 
      
    if(mouseInside()){
      fill(153,0,0,130);
    }
    else 
      fill(153,0,0);
      stroke(255);
      strokeWeight(5);
  rect(x, y, w, h, r);
  pushMatrix();
  translate(x,y);
  textSize(textSize);
  textAlign(CENTER,CENTER);
  fill(255);
  text(name,w/2,h/2-6);
  popMatrix();  
}
  
  //void hide(){
  //  //hide=true;
  //}
  //void show(){
  //  hide=false;
  //}
  
  float getWidth(){
    return w;
  }
  float getHeight(){
    return h;
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
  boolean mouseInside(){
    if(mouseX>x && mouseX<(x+w) && mouseY>y && mouseY<(y+h))
      return true;
    else
     return false;
  }
  
  void warpIn(){
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
stroke(255);
  strokeWeight(5);
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
   drawButton();
 } 
}

//void mouseClicked(){
//  if(mouseInside())
//    clicked=true;
//}
  
// void preview(){
//    float xVal=w/3;
//    float yVal=h/3;
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
//      x=(mouseX-w/2)/5*5;
//      y=(mouseY-h/2)/5*5;
//      //background(229,229,229);
//      //drawLines(xVal,yVal);
//      //image(img,x,y,w,h);
//      }
//    }
//    }
//    println(name + "," + x + "," + y + "," + w +","+h);
//  }
  
//  void move(float bx, float by){
//    x=bx;
//    y=by;
//  }
  
//  void drawLines(float xVal,float yVal){
//    stroke(0,0,255);
//    line(x,y+yVal,x+w,y+yVal);
//    line(x+xVal,y,x+xVal,y+h);
//    line(x,y+h-yVal,x+w,y+h-yVal);
//    line(x+w-xVal,y,x+w-xVal,y+h);
//  }
}

class BackButton extends Button{
  int x,y;
  BackButton(int bx,int by){
    super(bx,by,"Back");
    x=bx;
    y=by;
  }
  
  void drawButton(){
    
    if(mouseInside() && mousePressed)
      clicked=true; 
  
    if(mouseInside())
      fill(153,0,0,130);
    else
      fill(153,0,0);
      noStroke();
      triangle(x,y,x+40,y-40,x+40,y+40);
      rect(x+40,y-20,50,40);
      pushMatrix();
      translate(x,y);
      textSize(30);
      textAlign(CENTER,CENTER);
      fill(255);
      text(name,50,-5);
      popMatrix();  
  }
  
  boolean mouseInside(){
   if(mouseX>x && mouseX<(x+90) && mouseY>y-40 && mouseY<(y+40))
      return true;
    else 
      return false;
  }
  
  void fadeIn(){
 if(opacity<255){
   opacity+=fadeSpeed;
  fill(153,0,0,opacity);
  noStroke();
      triangle(x,y,x+40,y-40,x+40,y+40);
      rect(x+40,y-20,50,40);
      pushMatrix();
      translate(x,y);
      textSize(30);
      textAlign(CENTER,CENTER);
      fill(255);
      text(name,50,-5);
      popMatrix();  
 }
 else{
   drawButton();
 } 
}
}
