class NumButton extends Button{  //
  int num;
  NumButton(int x, int y,int n){
    super(x,y,""+n);
    num=n;
  }
  void drawButton(){
    super.drawButton();
    if(clicked){
      pinPage.insert(num);
      delay(100);
      super.resetClicked();  
  }
  }
  
}
