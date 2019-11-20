int AE_correct=0;
int AS_correct=0;
int BE_correct=0;
int BS_correct=0;
int CE_correct=0;
int CS_correct=0;
int DE_correct=0;
int DS_correct=0;

int p11_correct=0;
int p12_correct=0;
int p13_correct=0;
int p14_correct=0;
int p15_correct=0;
int p16_correct=0;
int p17_correct=0;
int p18_correct=0;
int tt_correct=0;

void Correction(){
  
    
  if(debug){
    if ( myPort.available() > 0 ) {  // If data is available,
      uart = myPort.readStringUntil(10);
    if (uart!=null  && uart.length() >= 100 ){
    //println(uart);

      p11_correct = uart.indexOf("AS");
      p12_correct = uart.indexOf("AE");
      p13_correct = uart.indexOf("BS");
      p14_correct = uart.indexOf("BE");
      p15_correct = uart.indexOf("CS");
      p16_correct = uart.indexOf("CE");
      p17_correct = uart.indexOf("DS");
      p18_correct = uart.indexOf("DE");
      tt_correct = uart.length();

      AS_correct=int(uart.substring(p11_correct+2,p12_correct));
      AE_correct=int(uart.substring(p12_correct+2,p13_correct));
      BS_correct=int(uart.substring(p13_correct+2,p14_correct));
      BE_correct=int(uart.substring(p14_correct+2,p15_correct));
      CS_correct=int(uart.substring(p15_correct+2,p16_correct));
      CE_correct=int(uart.substring(p16_correct+2,p17_correct));
      DS_correct=int(uart.substring(p17_correct+2,p18_correct));
      DE_correct=int(uart.substring(p18_correct+2,tt_correct-2));

  
  //漏光
  //if()
  }
  }
  }
           
  textSize(30);
  fill(255);
  text("Ch1_730 = "+AS_correct ,width/4,height/10);
  text("Ch1_850 = "+AE_correct ,width/4,height/10*2);
  text("Ch2_730 = "+BS_correct ,width/4,height/10*3);
  text("Ch2_850 = "+BE_correct ,width/4,height/10*4);
  text("Ch3_730 = "+CS_correct ,width/4,height/10*5);
  text("Ch3_850 = "+CE_correct ,width/4,height/10*6);
  text("Ch4_730 = "+DS_correct ,width/4,height/10*7);
  text("Ch4_850 = "+DE_correct ,width/4,height/10*8);
  
  //外側光強不足之情況
  if(AS_correct<20 && DS_correct>20){text("Ch1_730光強不足，請將整頭架位置向右微調" ,width/2,height/10);}
  if(AE_correct<20 && DE_correct>20){text("Ch1_850光強不足，請將整頭架位置向右微調" ,width/2,height/10);}
  if(DS_correct<20 && AS_correct>20){text("Ch4_730光強不足，請將整頭架位置向左微調" ,width/2,height/10);}
  if(DE_correct<20 && AE_correct>20){text("Ch4_850光強不足，請將整頭架位置向左微調" ,width/2,height/10);}
  if(AS_correct<20 && DS_correct<20){text("兩側光強不足，請增加LED光強度" ,width/2,height/10);}
  if(AE_correct<20 && DE_correct<20){text("兩側光強不足，請增加LED光強度" ,width/2,height/10);}
  
  
  }