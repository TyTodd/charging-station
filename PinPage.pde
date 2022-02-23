class PinPage{
  Entry pin;
  Button enter, delete, clear;
  BackButton back;
  Label prompt, prompt2;
  NumPad numPad;
  NumButton[] buttons = new NumButton[9];
  NumButton b0;
  boolean hide;
  boolean dropoff;
  boolean admin;
  Port port;
  int opacity=0;
  ReturnHome returnHome;
  
  PinPage(){
    returnHome= new ReturnHome();
    pin = new Entry(120,100);
    enter = new Button(700,70,100,70,20, "Enter",20);
    back=new BackButton(10,110);
    prompt2= new Label (120,50,560,50,30,"Please use the pin you previously used.",30);
    prompt= new Label(120,60,560,40,30,"Please enter the 6 digit pin you would like to use.",20);
    clear = new Button(280,380,80,80,20, "Clear",20);
    numPad = new NumPad(width/4,height/4+50);
    hide=true;
    for(int i=0;i<9;i+=3){
      for(int j=1;j<=3;j++){
        buttons[i+j-1]=new NumButton(200+j*80,75+i*80/3,i+j);
      }
    }
     b0=new NumButton(360,75+9*80/3,0);
  }
  
  void run(){
    if(opacity<255)
        opacity+=fadeSpeed;
        strokeWeight(0);
      fill(229,229,229,opacity);
      rect(0,0,800,480);
      
    
    returnHome.fadeIn();
    if(dropoff)
      prompt.fadeIn();
     else
       prompt2.fadeIn();
      pin.run();
     enter.fadeIn();
     back.fadeIn();
     numPad.show();

    if(back.clicked && admin){
      startPage.show();
      hide();
      pin.clearAll();
      admin=false;
      back.resetClicked();
    }
    if(back.clicked && dropoff){
       portPage.showDropOff();
      hide();
      pin.clearAll();
       portPage.showDropOff();
       back.resetClicked();
    }
    else if(back.clicked && !dropoff){
      portPage.showPickUp();
      hide();
      pin.clearAll();
      back.resetClicked();
    }
    
    if(numPad.delete.clicked){
      pin.backspace();
      delay(100);
      numPad.delete.resetClicked();
    }
    
    if(numPad.clear.clicked){
      pin.clearAll();
      delay(100);
      numPad.clear.resetClicked();  
    }
    
    if(enter.clicked){
      enter(); 
      mouseX=0;
      mouseY=0;
      enter.resetClicked();
    }
    if(returnHome.clicked){
    hide();
    delay(100);
    slideshow.show();
    returnHome.resetClicked();
  }
    }
  
  void show(boolean d,Port p){
    port=p;
    hide=false;
    dropoff=d;
  }
  void showAdmin(){
    hide=false;
    admin=true;
  }
  
  
  void hide(){
    opacity=0;
     hide=true;
  }
  
  
  void insert(int n){
    pin.insert(""+n);
  }
  
  void enter(){
    if(pin.text.length()==6){
      if(admin){
        if(pin.text.equals(password)){
          adminPage.show();
          hide();
          pin.clearAll();  
      }
        else{
          pin.error("The admin pin you entered is not valid");
        }
      }
      else if(dropoff){
        port.lock(pin.text);
        confirmationPage.show(2,port);
        hide();
        pin.clearAll();
      }
       else if(port.unlock(pin.text)){
         confirmationPage.show(0,port);
         hide();
         pin.clearAll();
       }
       else{
         confirmationPage.show(1,port);
         hide();
         pin.clearAll();
       }
    }
    else{
      pin.error("Pin must be 6 numbers long");
    }
    enter.resetClicked();
  }
  
  void setPrompt(boolean state){
    dropoff=state;
  }
  
  
  
}
