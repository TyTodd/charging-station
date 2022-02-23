class ConfirmationPage{
  boolean hide;
  Label sorry, unlocked, selection;
  Button okay,okay2;
  BackButton back;
  boolean previous;
  int state;
  Port port;
  int leftX = 100;
  int rightX = 400;
  int ySpace= 75;
  int yMarg = 90;
  int opacity =0;
  
  ConfirmationPage(){
    hide=true;
    sorry= new Label(110,10,580,80,20,"Sorry that is not the pin you previously used. \n For help please visit the main office.",25);
    unlocked=new Label(110,10,580,80,20,"Port unlocked!"+ "\n" +"Please retreive your phone and close the door.",25);
    back=new BackButton(10,50);
    okay=new Button(700,10,100,80,15,"OK",50);
    okay2=new Button(width/2-100,150,200,100,30,"OK",50);
    selection=new Label(110,10,580,80,20,"You have selected port . \n Please open the door and place your phone inside.",25);
    
    //for(int i=0; i<4; i++){
    //   mapPorts[i]=new Port(leftX,yMarg+i*ySpace,i+1);
    //   //ports[i].hide();
    //}
    //for(int i=4; i<8; i++){
    //   mapPorts[i]=new Port(rightX,yMarg+(i-4)*ySpace,i+1);
    //   //ports[i].hide();
    //}
  }
  
  void run(){
    if(!hide){
      if(opacity<255)
        opacity+=fadeSpeed;
        strokeWeight(0);
      fill(229,229,229,opacity);
      rect(0,0,800,480);
      
      switch(state){
        case 0:
          showUnlocked();
        break;
        case 1:
          showSorry();
        break;  
        case 2:
           selection.changeText("You have selected port "+port.num+". \n Please open the door and place your phone inside.");
           showSelection();
        break;
        default:
          showUnlocked();
        break;
      }
    }
    
    if(okay.clicked){
      hide();
      mouseX=0;
      mouseY=0;
      delay(100);
      slideshow.show();
      okay.resetClicked();
    }
    if(back.clicked){
      mouseX=0;
      mouseY=0;
        if(state==1){
          pinPage.show(false,port);
          hide();  
        }
        else if(state==2){
        pinPage.show(true,port);
        hide();
        }
      back.resetClicked();    
    }
    
    if(okay2.clicked){
      mouseX=0;
      mouseY=0;
      hide();
      delay(100);
      slideshow.show();
      okay2.resetClicked();  
    }
      
  }
  
  void showUnlocked(){
    unlocked.fadeIn(); 
    okay.fadeIn();
    for(Port p:ports){
      p.mapPort(port.num);
    }
  }
  
  void showSorry(){
    sorry.fadeIn();
    back.fadeIn();
    okay2.fadeIn();
  }
  
  void showSelection(){
    selection.fadeIn();
    back.fadeIn();
    okay.fadeIn();
    for(Port p:ports){
      p.mapPort(port.num);
    }
  }
  
  void hide(){
    opacity=0;
    hide=true;
  }
  
  void show(int n, Port p){
    port=p;
    hide=false;
    state=n;
  }
}
