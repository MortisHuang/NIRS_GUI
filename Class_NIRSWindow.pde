boolean multiple=false;

public class NIRSWindow extends PApplet {
    float easing = 0.05;
    float easedVal_CH1_Oxy=0;
    float easedVal_CH2_Oxy=0;
    float easedVal_CH3_Oxy=0;
    float easedVal_CH4_Oxy=0;
    float easedVal_CH1_DeOxy=0;
    float easedVal_CH2_DeOxy=0;
    float easedVal_CH3_DeOxy=0;
    float easedVal_CH4_DeOxy=0;
    int x =0;
    int gain = 20;  
    
  public void settings() {
    fullScreen(second_window_monitor);  //控制要在哪個螢幕上顯示
  }
  
  public void draw() {
    
    float space = width/4;
    strokeWeight(2);
    stroke(100);
    line(0,height/2,width,height/2);
    stroke(255);
    strokeWeight(5);
    line(space,0,space,height);
    line(space*2,0,space*2,height);
    line(space*3,0,space*3,height);
    fill(0, 102, 153);
    textSize(20);
    text("CH1",space/2-30,20);
    text("CH2",space*1.5-30,20);
    text("CH3",space*2.5-30,20);
    text("CH4",space*3.5-30,20);
    
// Show Time duration
     fill(0);
     noStroke();
     rect(30, height-100, 230,100);
     fill(#9B9696);
     textSize(100);
     text(Timeduring,50,height-20); //測驗經過時間
     
// 顯示遊戲狀態
   if(currentGame==4){  //算數new
     if(Timeduring<modifyBaseTime && CloseEyeState == 1){
       fill(0);
       noStroke();
       rect(space*2+20, height-100, space-30,100);
       textSize(80);
       fill(255);
       text("Countdown",space*2+10,height-100);
       text((modifyBaseTime-Timeduring)+"s",space*2+20,height-20); 
       
       fill(0);
       noStroke();
       rect(space*3+30, height-100, space,100);
       textSize(80);
       fill(255);
       text("BaseLine",space*3+30,height-20);
     }
     if(Timeduring>=modifyBaseTime && (Timeduring-modifyBaseTime)<modifyTaskTime ){
       
       fill(0);
       noStroke();
       rect(space*3+30, height-100, space,100);
       textSize(80);
       fill(255);
       text("MathTask",space*3+30,height-20);      
     }
     if((Timeduring-modifyBaseTime)>=modifyTaskTime){

       fill(0);
       noStroke();
       rect(space*3+30, height-100, space,100);
       textSize(80);
       fill(255);
       text("Recover",space*3+30,height-20);
     }
   }
   
   if(currentGame==7){  //小腿束縛
    
     if(Timeduring < CuffBaseTime){
       fill(0);
       noStroke();
       rect(space*2+20, height-100, space-30,100);
       textSize(80);
       fill(255);
       text("Countdown",space*2+10,height-100);
       text((CuffBaseTime-Timeduring)+"s",space*2+20,height-20); 
       
       fill(0);
       noStroke();
       rect(space*3+30, height-100, space,100);
       textSize(80);
       fill(255);
       text("BaseLine",space*3+30,height-20);
     }
     if(Timeduring >= CuffBaseTime && Timeduring < (CuffTaskTime+CuffBaseTime)){
       fill(0);
       noStroke();
       rect(space*2+20, height-100, space-30,100);
       textSize(80);
       fill(255);
       text("Countdown",space*2+10,height-100);
       text((CuffTaskTime+CuffBaseTime-Timeduring)+"s",space*2+20,height-20); 
       
       fill(0);
       noStroke();
       rect(space*3+30, height-100, space,100);
       textSize(80);
       fill(255);
       text("CuffTask",space*3+30,height-20);
     }
     if(Timeduring >= (CuffTaskTime+CuffBaseTime) && Timeduring < (CuffRestTime+CuffTaskTime+CuffBaseTime)){
       fill(0);
       noStroke();
       rect(space*2+20, height-100, space-30,100);
       textSize(80);
       fill(255);
       text("Countdown",space*2+10,height-100);
       text((CuffRestTime+CuffTaskTime+CuffBaseTime-Timeduring)+"s",space*2+20,height-20); 
       
       fill(0);
       noStroke();
       rect(space*3+30, height-100, space,100);
       textSize(80);
       fill(255);
       text("Recover",space*3+30,height-20);
     }
   }
     
         
       
    
//CH1    
float targetVal_CH1_Oxy = CH1_Oxy;
easedVal_CH1_Oxy +=(targetVal_CH1_Oxy - easedVal_CH1_Oxy) * easing;
float targetVal_CH1_DeOxy = CH1_DeOxy;
easedVal_CH1_DeOxy +=(targetVal_CH1_DeOxy - easedVal_CH1_DeOxy) * easing;
fill(255,0,0);
noStroke();
ellipse(x, height/2-easedVal_CH1_Oxy*gain,5,5);
fill(0,0,255);
noStroke();
ellipse(x, height/2-easedVal_CH1_DeOxy*gain,5,5);
stroke(0);
line(x+1,0,x+1,height);

     
     
//CH2
float targetVal_CH2_Oxy = CH2_Oxy;
easedVal_CH2_Oxy +=(targetVal_CH2_Oxy - easedVal_CH2_Oxy) * easing;
float targetVal_CH2_DeOxy = CH2_DeOxy;
easedVal_CH2_DeOxy +=(targetVal_CH2_DeOxy - easedVal_CH2_DeOxy) * easing;
fill(255,0,0);
noStroke();
ellipse(x+space, height/2-easedVal_CH2_Oxy*gain,5,5);
fill(0,0,255);
noStroke();
ellipse(x+space, height/2-easedVal_CH2_DeOxy*gain,5,5);
stroke(0);
line(x+space+1,0,x+space+1,height);

//CH3
float targetVal_CH3_Oxy = CH3_Oxy;
easedVal_CH3_Oxy +=(targetVal_CH3_Oxy - easedVal_CH3_Oxy) * easing;
float targetVal_CH3_DeOxy = CH3_DeOxy;
easedVal_CH3_DeOxy +=(targetVal_CH3_DeOxy - easedVal_CH3_DeOxy) * easing;
fill(255,0,0);
noStroke();
ellipse(x+space*2, height/2-easedVal_CH3_Oxy*gain,5,5);
fill(0,0,255);
noStroke();
ellipse(x+space*2, height/2-easedVal_CH3_DeOxy*gain,5,5);
stroke(0);
line(x+space*2+1,0,x+space*2+1,height);

//CH4
float targetVal_CH4_Oxy = CH4_Oxy;
easedVal_CH4_Oxy +=(targetVal_CH4_Oxy - easedVal_CH4_Oxy) * easing;
float targetVal_CH4_DeOxy = CH4_DeOxy;
easedVal_CH4_DeOxy +=(targetVal_CH4_DeOxy - easedVal_CH4_DeOxy) * easing;
stroke(255,0,0);
line(x+space*3-1, height/2-easedVal_CH4_Oxy*gain-1,x+space*3, height/2-easedVal_CH4_Oxy*gain);
stroke(0,0,255);
line(x+space*3-1,height/2-easedVal_CH4_DeOxy*gain-1,x+space*3,height/2-easedVal_CH4_DeOxy*gain);
stroke(0);
line(x+space*3+1,0,x+space*3+1,height);
x++;
if(x>space){x=0;}
if(state==3){exit();}
if(CorrectionOver==1){exit(); CorrectionOver=0;}   //再進行校正的時候不需要血氧圖，因此使用exit()讓secondWindow關閉


}//finish draw
  
  public void exit()
{
  sa = null;
  dispose();
  sa = new NIRSWindow();
}
}
