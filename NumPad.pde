class NumPad{
  NumButton[] buttons=new NumButton[9];
  NumButton b0;
  boolean hide;
  Button delete,clear;
  int vertGap=80/3-5;
  int horzGap=70;
  int x=200;
  int y= 40; 
  NumPad(int nx,int ny){
    x=nx;
    y=ny;
     delete =new Button(x+3*horzGap,y+ 9*vertGap,70,65,15,"Delete",19);
     clear =new Button(x+horzGap,y+ 9*vertGap,70,65,15,"Clear",19);
    for(int i=0;i<9;i+=3){
      for(int j=1;j<=3;j++){
       buttons[i+j-1]=new NumButton(x+j*horzGap,y+i*vertGap,i+j);
    }
   }
    b0=new NumButton(x+2*horzGap,y+9*vertGap,0);
    hide=true;
  }
  
 void show(){
   //if(!hide){

   for(NumButton b: buttons){
     b.drawButton();
 }
 b0.drawButton();
 delete.drawButton();
 clear.drawButton();
 }
  
  
}
