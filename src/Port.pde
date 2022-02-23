class Port extends Button{
  int num;
  boolean inUse;
  String pin;
  boolean  fadeUp=true;
  int fade;
  Port(int x, int y, int n){
    super(x,y,360,70,0,""+n,20);
    num=n;
    inUse=false;
  }

  void drawButton(){
    strokeWeight(5);
    stroke(255);
    super.drawButton();
    if(super.clicked){
      pinPage.show(!inUse,this);
      pinPage.pin.clearAll();
      pinPage.setPrompt(!inUse);
      mouseX=0;
      mouseY=0;
       portPage.hide();
      super.resetClicked();
    }
    strokeWeight(1);
    stroke(255);
  }
  
  void mapPort(int n){
    if(num==n){
      //println(millis()%500);
      if(fadeUp)
        fade++; 
       else
         fade--;
       if(fade>=255)
         fadeUp=false;
       if(fade<=90)
         fadeUp=true;
       fill(153,0,0,fade);
     }
    else
      fill(153,0,0);
 
    rect(super.x, super.y, 360, 60);
    pushMatrix();
    translate(x,y);
    textSize(textSize);
    textAlign(CENTER,CENTER);
    fill(255);
    text(name,w/2,h/2-6);
    popMatrix();  
   
  }
  
  void adminMode(){
    super.drawButton();
    if(super.clicked){
      unlock(pin);
      inUse=false;
      mouseX=0;
      mouseY=0;
      adminPage.hide();
      delay(100);
      startPage.show();
      pinPage.admin=false;
      super.resetClicked();
    }
  }
      
  
  void lock(String p){
    pin=p;
    inUse=true;
    println("locked");
    pins[num-1]=pin;
    saveStrings("pins.txt",pins);
  }
  
  boolean unlock(String p){
    if(pin!=null && p.equals(pin)){
    println("unlocked");
    inUse=false;
    pins[num-1]="0";
    saveStrings("pins.txt",pins);
    return true;
    }
    else
      return false;
    }
    
}
