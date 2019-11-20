//與SecondWindow code 87%像，但不會出現第二視窗
    float easing = 0.05;
    float easedVal_CH1_Oxy=0;
    float easedVal_CH2_Oxy=0;
    float easedVal_CH3_Oxy=0;
    float easedVal_CH4_Oxy=0;
    float easedVal_CH1_DeOxy=0;
    float easedVal_CH2_DeOxy=0;
    float easedVal_CH3_DeOxy=0;
    float easedVal_CH4_DeOxy=0;
    //int x =0;
    int gain;  //原先20，但把韌體端的血氧3倍gain拔出後移到這裡，數值更動改到Inputmouse中 2017/10/03

  void ShowOxyLine() {
     
    if(debug){  saving(); }
    float space = width/4;
    strokeWeight(2);
    stroke(100);
    line(0,height/2,width,height/2);
    stroke(255);
    strokeWeight(5);
    line(space,0,space,height);
    line(space*2,0,space*2,height);
    line(space*3,0,space*3,height);
    //fill(0, 102, 153);
    //stroke(255,255,255);
    //textSize(20);
    //text("CH1",space/2-30,20);
    //text("CH2",space*1.5-30,20);
    //text("CH3",space*2.5-30,20);
    //text("CH4",space*3.5-30,20);

    
////Time
 //fill(0);
 //noStroke();
 //rect(30, height-100, 250,100);
 //fill(#9B9696);
 //textSize(100);
 //text(Timeduring,50,height-20); //測驗經過時間
 
 
//CH1    
float targetVal_CH1_Oxy = CH1_Oxy;
easedVal_CH1_Oxy +=(targetVal_CH1_Oxy - easedVal_CH1_Oxy) * easing;
float targetVal_CH1_DeOxy = CH1_DeOxy;
easedVal_CH1_DeOxy +=(targetVal_CH1_DeOxy - easedVal_CH1_DeOxy) * easing;
strokeWeight(1);
stroke(255,0,0);
line(x-1, height/2-easedVal_CH1_Oxy*gain-1,x, height/2-easedVal_CH1_Oxy*gain);
stroke(0,0,255);
line(x-1, height/2-easedVal_CH1_DeOxy*gain-1,x, height/2-easedVal_CH1_DeOxy*gain);
stroke(0);
line(x+1,0,x+1,height);

     
//CH2
float targetVal_CH2_Oxy = CH2_Oxy;
easedVal_CH2_Oxy +=(targetVal_CH2_Oxy - easedVal_CH2_Oxy) * easing;
float targetVal_CH2_DeOxy = CH2_DeOxy;
easedVal_CH2_DeOxy +=(targetVal_CH2_DeOxy - easedVal_CH2_DeOxy) * easing;
strokeWeight(1);
stroke(255,0,0);
line(x+space-1, height/2-easedVal_CH2_Oxy*gain-1,x+space, height/2-easedVal_CH2_Oxy*gain);
stroke(0,0,255);
line(x+space-1, height/2-easedVal_CH2_DeOxy*gain-1,x+space, height/2-easedVal_CH2_DeOxy*gain);
stroke(0);
line(x+space+1,0,x+space+1,height);


//CH3
float targetVal_CH3_Oxy = CH3_Oxy;
easedVal_CH3_Oxy +=(targetVal_CH3_Oxy - easedVal_CH3_Oxy) * easing;
float targetVal_CH3_DeOxy = CH3_DeOxy;
easedVal_CH3_DeOxy +=(targetVal_CH3_DeOxy - easedVal_CH3_DeOxy) * easing;
strokeWeight(1);
stroke(255,0,0);
line(x+space*2-1, height/2-easedVal_CH3_Oxy*gain-1,x+space*2, height/2-easedVal_CH3_Oxy*gain);
stroke(0,0,255);
line(x+space*2-1, height/2-easedVal_CH3_DeOxy*gain-1,x+space*2, height/2-easedVal_CH3_DeOxy*gain);
stroke(0);
line(x+space*2+1,0,x+space*2+1,height);


//CH4
float targetVal_CH4_Oxy = CH4_Oxy;
easedVal_CH4_Oxy +=(targetVal_CH4_Oxy - easedVal_CH4_Oxy) * easing;
float targetVal_CH4_DeOxy = CH4_DeOxy;
easedVal_CH4_DeOxy +=(targetVal_CH4_DeOxy - easedVal_CH4_DeOxy) * easing;
strokeWeight(1);
stroke(255,0,0);
line(x+space*3-1, height/2-easedVal_CH4_Oxy*gain-1,x+space*3, height/2-easedVal_CH4_Oxy*gain);
stroke(0,0,255);
line(x+space*3-1,height/2-easedVal_CH4_DeOxy*gain-1,x+space*3,height/2-easedVal_CH4_DeOxy*gain);
stroke(0);
line(x+space*3+1,0,x+space*3+1,height);


x++;
if(x>space){x=0;}
if(state==3){exit();}


    
}//finish 
  
  public void exit()
{
  sa = null;
  dispose();
  sa = new NIRSWindow();
}
//}  class NIRSWindow
