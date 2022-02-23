class StartPage{
  Button pickUp;
  Button dropOff;
  Label prompt;
  Button admin;
  ReturnHome returnHome;
  int opacity=0;
  boolean hide;  

  StartPage(){
    returnHome= new ReturnHome();
   dropOff =  new Button(width/2-100,140,200,100,30,"Drop Off",40);
    pickUp = new Button(width/2-100,260,200,100,30,"Pickup",40);
    prompt =  new Label(60,60,620,70,20,"Are you here for pickup or drop off?",35);
    admin = new Button(725,50,75,35,0,"Admin",15);
    show();
    hide=true;
  }  
  void run(){
    //if(!hide){
      if(opacity<255)
        opacity+=fadeSpeed;
        strokeWeight(0);
      fill(229,229,229,opacity);
      rect(0,0,800,480);
   returnHome.fadeIn();
   pickUp.fadeIn();
   dropOff.fadeIn();
   prompt.fadeIn(); 
   admin.fadeIn();
   action();
  //  }
  }
  
  void show(){
    hide=false;
  }
  
  void hide(){
    opacity=0;
      hide=true; 
 }
 
 void action(){
   if(dropOff.clicked){
     hide();
     mouseX=0;
     mouseY=0;
     delay(100);
     portPage.showDropOff();
     dropOff.resetClicked();
     
 }
 
 if(pickUp.clicked){
      hide();
     mouseX=0;
     mouseY=0;
     pickUp.resetClicked();
     delay(100);
     portPage.showPickUp();
     pickUp.resetClicked();
 }
 
 if(admin.clicked){
   hide();
   mouseX=0;
   mouseY=0;
   delay(100);
   pinPage.showAdmin();
   admin.resetClicked();
 }
 if(returnHome.clicked){
   mouseX=0;
   mouseY=0;
   delay(100);
   slideshow.show();
   hide();
   returnHome.resetClicked();
 }

}
}
