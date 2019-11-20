int CuffstartTime_milli;
int CuffBaseTime = 60;    //60
int CuffTaskTime = 90;    //90
int CuffRestTime =  90;    //90
int CuffTime_milli;


void CalfCuffTask(){


  CuffTime_milli=millis();
  Timeduring = floor((CuffTime_milli-CuffstartTime_milli)/1000);
  
  if(debug){
    saving();
   }
   
  if(Timeduring < CuffBaseTime){
    textSize(160);
    fill(255);
    text("請閉眼休息",width/2,height/2-40);
    //text((CuffBaseTime-Timeduring)+"秒",width/2,height/2+160);
  }
  
  if(Timeduring >= CuffBaseTime && Timeduring < (CuffTaskTime+CuffBaseTime)){
    textSize(160);
    fill(255);
    text("小腿束縛，請閉眼休息",width/2,height/2-40);
    //text((CuffTaskTime+CuffBaseTime-Timeduring)+"秒",width/2,height/2+160);
  }
  
  if(Timeduring >= (CuffTaskTime+CuffBaseTime) && Timeduring < (CuffRestTime+CuffTaskTime+CuffBaseTime)){
    textSize(160);
    fill(255);
    text("束縛結束，請閉眼休息",width/2,height/2);
    //text((CuffRestTime+CuffTaskTime+CuffBaseTime-Timeduring)+"秒",width/2,height/2+160);
  }
  
  if(Timeduring >= (CuffRestTime+CuffTaskTime+CuffBaseTime)){
    state = 3;
  }
  
}
  
  