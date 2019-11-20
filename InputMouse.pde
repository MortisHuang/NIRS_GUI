int pretest = 0;
int count = 0;
int CorrectionOver;
int connect=0;
// Inputs Mouse
void mousePressed() {
  // depending on the state choose mousePressed routine
  
  
  switch (state) {
  case stateWelcomeScreen:
    mousePressedStateWelcomeScreen();
    break;
  case statePlay:
    mousePressedStatePlay();
    break;
  case stateLearnMore:
    state = stateWelcomeScreen;
    break;
  case stateAfterAGame:
    state = stateWelcomeScreen;
    Timeduring =0;
    break;  
  default:
    println("Unknown State (Error 18 in tab InputMouse): " 
      + state+ ".");
    exit();
    break;
  }
  
  
  
  // switch
} // func 

// ----------------------------------------------------------------------------

void mousePressedStateWelcomeScreen() {
  // Mouse pressed in state Welcome Screen / Main Screen.
  // Evaluate three main buttons. 
  Timeduring =0;
  if (rectButtonBoard1.overRect()) {
    if(debug){
      if(multiple){
    PApplet.runSketch(args1, sa);
      }
    }
    score=0;
    life=100;
    startTime_H=hour();
    startTime_M=minute();
    startTime_S=second();
    if(debug){
    csv();
    Filename = (String.valueOf(year())+"_"+String.valueOf(month())+"_"+String.valueOf(day())+"_"+String.valueOf(hour())+String.valueOf(minute()));
    myPort.write("1");
    }
    TimeStart=millis();
    currentGame = chooseGame1;    
    state = statePlay;
  }
  else if (rectButtonBoard2.overRect()) {
    if(debug){ if(multiple){
    PApplet.runSketch(args1, sa);}}
    theNumber=1000;
    Answers = 0;
    Serial13 = 0;
    startTime_H=hour();
    startTime_M=minute();
    startTime_S=second();
    if(debug){
    csv();
    Filename = (String.valueOf(year())+"_"+String.valueOf(month())+"_"+String.valueOf(day())+"_"+String.valueOf(hour())+String.valueOf(minute()));
    myPort.write("1");
    }
    TimeStart=millis();
    currentGame = chooseGame2;
    state = statePlay;
 //
  }
  else if (rectButtonBoard3.overRect()) {
    if(debug){ if(multiple){
    PApplet.runSketch(args1, sa);}}
    startTime_H=hour();
    startTime_M=minute();
    startTime_S=second();
    if(debug){
    csv();
    Filename = (String.valueOf(year())+"_"+String.valueOf(month())+"_"+String.valueOf(day())+"_"+String.valueOf(hour())+String.valueOf(minute()));
    myPort.write("1");
    }
    TimeStart=millis();
    currentGame = chooseGame3;    
    state = statePlay;
  }
    else  if (rectButtonBoard4.overRect()) {
       x_airplane=0;
       Oxy_true=0;
       airplane_playstate=0;
       run_times=0;
       success=0;
    if(debug){
      if(multiple){
    PApplet.runSketch(args1, sa);
      }
    }
    startTime_H=hour();
    startTime_M=minute();
    startTime_S=second();
      base_start_H=hour();
  base_start_M=minute();
  base_start_S=second();
    if(debug){
    csv();
    Filename = (String.valueOf(year())+"_"+String.valueOf(month())+"_"+String.valueOf(day())+"_"+String.valueOf(hour())+String.valueOf(minute()));
    myPort.write("1");
    }
    TimeStart=millis();
    currentGame = chooseGame4;    
    state = statePlay;
  }
    else if (rectButtonBoard5.overRect()) {
    if(debug){ if(multiple){
    PApplet.runSketch(args1, sa);}}
    //記得資料要歸零初始化!!!
    pretest = 0;
    c = round(random(0,1));
    push = 0;
    press = 0;
    CorrectOrWrong = 999;
    round = 0;
    Q = 0;
    Correct = 0;
    Wrong = 0;
    Slow = 0;
    count=0; //計算滑鼠點擊次數(選擇答案)，讓答案只能選一次
    CloseEyeState=1; //避免測驗中跳回閉眼階段，且要休息3xxxx秒以上的情況 
   
    shuffle(a);
    stressTask = 0;
    startTime_milli=millis();    
    if(debug){
    csv();
    Filename = (String.valueOf(year())+"_"+String.valueOf(month())+"_"+String.valueOf(day())+"_"+String.valueOf(hour())+String.valueOf(minute()));
    myPort.write("1");
    }
    TimeStart=millis();
    currentGame = chooseGame5;
    state = statePlay;

    
    
 //
  }
  
  else if (rectButtonBoard6.overRect()) {
    if(debug){ if(multiple){
    PApplet.runSketch(args1, sa);}}
    //記得資料要歸零初始化!!!
    pretest = 1;
    c = round(random(0,1));
    push = 0;
    press = 0;
    CorrectOrWrong = 999;
    round = 0;
    Q = 0;
    Correct = 0;
    Wrong = 0;
    Slow = 0;
    count=0; //計算滑鼠點擊次數(選擇答案)，讓答案只能選一次
    CloseEyeState=1; //避免測驗中跳回閉眼階段，且要休息3xxxx秒以上的情況 
   
    shuffle(a);
    stressTask = 0;
    startTime_milli=millis();   
    if(debug){
    csv();
    Filename = (String.valueOf(year())+"_"+String.valueOf(month())+"_"+String.valueOf(day())+"_"+String.valueOf(hour())+String.valueOf(minute()));
    myPort.write("1");
    }
    TimeStart=millis();
    currentGame = chooseGame5;
    state = statePlay;
   
 //
  }
  
  else if (rectCorrection.overRect()) {
    if(debug){ if(multiple){
    PApplet.runSketch(args1, sa);}}
     if(debug){   
      myPort.write("1");
      
      currentGame = chooseGame6;
      state = statePlay;
     }
    if(debug==false){showMessageDialog(frame,"Device is not connected to the PC");}
  
  }
   else if (rectShowOxyLine.overRect()) {
     easedVal_CH1_Oxy=0;
     easedVal_CH2_Oxy=0;
     easedVal_CH3_Oxy=0;
     easedVal_CH4_Oxy=0;
     easedVal_CH1_DeOxy=0;
     easedVal_CH2_DeOxy=0;
     easedVal_CH3_DeOxy=0;
     easedVal_CH4_DeOxy=0;
     x=0;
     gain=20;
     background(0);
     if(debug){
     csv();
     Filename = (String.valueOf(year())+"_"+String.valueOf(month())+"_"+String.valueOf(day())+"_"+String.valueOf(hour())+String.valueOf(minute()));
     myPort.write("1");
     }
     TimeStart=millis();
     currentGame = chooseGame7;
     state = statePlay;
   } 
  else if (rectCalfCuff.overRect()) {
    if(debug){ if(multiple){
      PApplet.runSketch(args1, sa);}
    }
    if(debug){
      csv();
      Filename = (String.valueOf(year())+"_"+String.valueOf(month())+"_"+String.valueOf(day())+"_"+String.valueOf(hour())+String.valueOf(minute()));
      myPort.write("1");
    }
    TimeStart=millis();
    CuffstartTime_milli=millis();
    currentGame = chooseGame8;
    state = statePlay;
    
  }
    
  else if (rectLearnmore.overRect()) {
    printLearnMore();
    state = stateLearnMore;
  }
   else if (rectConnect.overRect()) {
     COMx = "";
     COMlist = "";
    if(debug){myPort.stop();debug=false;connect=1;}
    else {
    comport();
    redraw();
    connect = 0;
    
  }
  }
  else if (rectMultipleWindow.overRect()){if(multiple){multiple=false;}else if (!multiple){multiple=true;}}

  else {
    // do nothing
  }
}
//



void mousePressedStatePlay() {
  // here would come your games logic. 
  // When game over, state = stateAfterAGame;
  // would apply.  
  Timeduring =0;
 
  switch (currentGame) {
  case chooseGame1:
    fire = true;
    if(life>0){
    shoot.trigger();
  }
     if(life<=0){
    loop();}
    break;
  case chooseGame2:
    //state = stateAfterAGame;
    break;
  case chooseGame3:
    state = stateAfterAGame;
    break;
  case chooseGame4:
    state = stateAfterAGame;
    break;
  case chooseGame5:
    //state = stateAfterAGame;
    if(stressTask==2){
      if(count<1){                           //計算滑鼠點擊次數(選擇答案)，讓答案只能選一次
        if(mouseX>0 && mouseX<width/2 ){
        press = 1;
        push = 1;
        //AnsT_S=second();
        AnsT_M=millis();
        //RT =(AnsT_M - AnsStartT_M)/thousand;
        count++;
      }
      if(mouseX>width/2 && mouseX<width ){
        press = 2;
        push = 1;
        //AnsT_S=second();
        AnsT_M=millis();
        //RT =(AnsT_M - AnsStartT_M)/thousand;
        count++;
      }
     }
    }
    break;
  case chooseGame6:
    myPort.write("2");
    CorrectionOver = 1;
    state = stateWelcomeScreen;
    break;
  case chooseGame7:
    background(0);
    if(debug){
    saveTable(table, "data/"+chooseGameName[currentGame]+"/"+Filename+".csv");
    myPort.write("2");
    myPort.clear();
    }
    state = stateWelcomeScreen;
    break;
  case chooseGame8:
    state = stateAfterAGame;
    break;
  default:
    println ("Error 66 in tab InputMouse for currentGame with "
      + currentGame);
    exit();
    break;
  } // switch
}
//
