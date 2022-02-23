class Admin{
  Label prompt;
  Button back;
  boolean hide;
  
  Admin(){
    back=new Button(0,0,101,86,11,"Back",11);
    hide=true;
  
  }
  
  void run(){
    if(!hide){
       fill(229,229,229);
      rect(0,0,800,480);
    back.drawButton();
    for(Port p: ports){
      p.adminMode();
    }
    
    if(back.clicked){
      hide();
      delay(100);
      mouseX=0;
      mouseY=0;
      startPage.show();
      pinPage.admin=false;
      println("correct");
      back.resetClicked();
    }
    }
  }
  
  void show(){
    hide=false;
  }
  
  void hide(){
    hide=true;
  }
  
  
}
