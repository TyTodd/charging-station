class PortPage{
  Label prompt, prompt2;
  Button back;
  ReturnHome returnHome;
  int centerX=300;
  int leftX = 20;
  int rightX = 420;
  int ySpace= 75;
  int yMarg = 120;
  boolean hideDropOff, hidePickUp;
  int opacity=0;
  
  PortPage(){
    returnHome=new ReturnHome();
    prompt = new Label(110,60,580,80,20,"No ports available :(",35); 
    prompt2 = new Label(110,60,580,80,20,"No ports are currently in use",35);
    for(Port port: ports){
      if(port.inUse)
         prompt2 = new Label(110,60,580,80,20,"Please select the port you previously used",30);
      if(!port.inUse)
        prompt = new Label(110,60,580,80,20,"Please select any port",35); 
    }
    hideDropOff=true;
    hidePickUp=true;
    back=new BackButton(10,100);
    
  }
  
  void hide(){
    opacity=0;
    hideDropOff();
    hidePickUp();
  }
  void showDropOff(){
     prompt = new Label(110,60,580,80,20,"No ports available :(",35); 
    prompt2 = new Label(110,60,580,80,20,"No ports are currently in use",35);
    for(Port port: ports){
      if(port.inUse)
         prompt2 = new Label(110,60,580,80,20,"Please select the port you previously used",30);
      if(!port.inUse)
        prompt = new Label(110,60,580,80,20,"Please select any port",35); 
    }
    
    hideDropOff=false;
    hidePickUp=true;
  }
  void hideDropOff(){
    hideDropOff=true;
  }
  void showPickUp(){
     prompt = new Label(110,60,580,80,20,"No ports available :(",35); 
    prompt2 = new Label(110,60,580,80,20,"No ports are currently in use",35);
    for(Port port: ports){
      if(port.inUse)
         prompt2 = new Label(110,60,580,80,20,"Please select the port you previously used",30);
      if(!port.inUse)
        prompt = new Label(110,60,580,80,20,"Please select any port",35); 
    }
    
    hidePickUp=false;
    hideDropOff=true;
  }
  void hidePickUp(){
    hidePickUp=true;
  }
  void runDropOff(){
    
    if(opacity<255)
        opacity+=fadeSpeed;
        strokeWeight(0);
      fill(229,229,229,opacity);
      rect(0,0,800,480);
      
    returnHome.fadeIn();
      prompt.fadeIn();
      back.fadeIn();
    for(int i =0; i<8;i++){
      if(!ports[i].inUse){
        ports[i].fadeIn();
        //ports[i].show();
      }     
  }
  if(back.clicked){
      startPage.show();
      hide();
      back.resetClicked();
    }
    
    if(returnHome.clicked){
    hide();
    delay(100);
    slideshow.show();
    returnHome.resetClicked();
    }
  }
  void runPickup(){
    
    if(opacity<255)
        opacity+=fadeSpeed;
        strokeWeight(0);
      fill(229,229,229,opacity);
      rect(0,0,800,480);
      
    returnHome.fadeIn();
      prompt2.fadeIn();
      back.fadeIn();
    for(int i =0; i<8;i++){
      if(ports[i].inUse){
        ports[i].fadeIn();
        //ports[i].show();
       }     
    }
    if(back.clicked){
      startPage.show();
      hide();
      back.resetClicked();
    }
    
    if(returnHome.clicked){
    hide();
    delay(100);
    slideshow.show();
    returnHome.resetClicked();
  }
  
  }
}
