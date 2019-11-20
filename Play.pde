
// the actual game play; your game logic would be here 

void MainProgram() {
  // depending on game chosen 
  switch (currentGame) {
  case chooseGame1:
    handleGame1();
    break;
  case chooseGame2:
    Timeduring =0;
    handleGame2();
    break;
  case chooseGame3:
    handleGame3();
    break;
  case chooseGame4: 
    handleGame4();
    break;
  case chooseGame5: 
    handleGame5();
    break;
  case chooseGame6:
    Correction();
    break;  
  case chooseGame7:
    ShowOxyLine();
    break;
  case chooseGame8:
    CalfCuffTask();
    break;  
  default:
    // error 
    println ("Error 17 in tab Play (unknown currentGame) with "
      + currentGame 
      + ".");
    exit();
    break;
  } // switch
} // func 

// -----------------------------------------------------------------------------------------------------------------------------
int theNumber=1000;
int BaseTime =  5;
int TaskTime = 120;
int RestTime = 150;
int Answers = 0;
int Serial13 = 0;

void handleGame2() {
  background(0);
  nowTime_M=minute();
  nowTime_S=second();
  Timeduring = (nowTime_M-startTime_M)*60+(nowTime_S-startTime_S);
   if(debug){
  saving();
}

switch(Serial13){
case 0:
 textSize(80);
 fill(255);
 text("請閉眼休息"+(BaseTime-Timeduring)+"秒",width/2,height/2);
break;
case 1:
  textSize(50);
  if(theNumber>=12){
  fill(255);
  text(theNumber+"  -  13  =  ?  ",width/2,height/2);
  textSize(15);
  fill(#9B9696);
  text(Timeduring-BaseTime,50,height-20); //測驗經過時間
  fill(255);}
break;
default:
break;
}


 if(Timeduring<=BaseTime){
 Serial13 = 0;
 }
  
 if(Timeduring>BaseTime && (Timeduring-BaseTime)<TaskTime ){
  Serial13 = 1;
  }
 
 if((Timeduring-BaseTime)>=TaskTime){textSize(50);text("測驗結束，請閉眼休息，並專注於自身呼吸",width/2,height/2);}
  if((Timeduring-BaseTime-TaskTime)>=RestTime){
  myPort.write("2");
  state=3;
}
 
  //
}

//----------------------------------------------------------------------------Shooting Game-----------------------------------------------------------------------------------


int[] ballx = { getRandomX(), getRandomX()+100, getRandomX()+300, getRandomX()+250, getRandomX()+800 };
int[] bally = { getRandomY(), getRandomY(), getRandomY(), getRandomY(), getRandomY() };

PShape rocket;
int life =100;
float xpos =0, ypos =0;
int ballSize =50;
int score =0;
boolean fire = false;
float speed =2;

int getRandomX(){return int(random(20,width-20));}
int getRandomY(){return int(random(0,300));}

void shootingSetting(){
rocket = loadShape("rocket.obj");
minim = new Minim(this);
shoot = minim.loadSample("shoot1.mp3",1024);
explosion = minim.loadSample("explosion1.mp3",1024);
}

void ballFalling()
  {  
    stroke(39, 154, 240); 
    fill (39, 154, 240); 
    
    for (int i=0; i<5; i++)
    {
      ellipse(ballx[i], bally[i]+=speed, ballSize, ballSize);
    }
  }
  
void ballReborn()
  {
    for (int i=0; i< 5; i++)
    {
      if(bally[i]>=height)
      {
    explosion.trigger();
    fill (255,0,0);
    ellipse(ballx[i], bally[i],ballSize+50, ballSize+50);
    ballx[i] = getRandomX();
    bally[i] = 0;
       }
      }
    }
    
void cannon(float shotX)
  {
    boolean strike = false;
    for (int i = 0; i < 5; i++)
    {
      if((shotX >= (ballx[i]-ballSize/2)) && (shotX <= (ballx[i]+ballSize/2)) && (bally[i]<850)) {
        strike = true;
        stroke(255,0,0);
        strokeWeight(15);
        line(shotX, height/2+200, shotX, bally[i]);
        strokeWeight(1);
        fill (255);
        ellipse(ballx[i], bally[i],ballSize+50, ballSize+50);
        ballx[i] = getRandomX();
        bally[i] = 0;
        score++;
      }    
      
    }
  
    if(strike == false)
    {
      
      stroke(255,0,0);
      strokeWeight(15);
      line(shotX, height/2+200, shotX, -750);
       strokeWeight(1);
    }  
  
  }
 

void handleGame1() {
if(debug){
  saving();}

background(0);


if (life>0 ){ 
shape(rocket,mouseX,height/2+150);
if(fire)
    {
      cannon(mouseX);
      fire = false;
    }
ballFalling();
ballReborn();

if(life<=0){
 state=3;  
  myPort.clear();
  myPort.stop();}
} 


//text(speed,width/2-150,100);


if(Oxy>1.5 ){speed-=0.01;}
if(Oxy<-0.5){speed+=0.01;}
if(speed <=0.8){speed=2.5;}



textSize(70);
fill(255);
textMode(SHAPE);
text("SCORE:"+score,width/2-50,200);

}
  //


//----------------------------------------------------------------------------Rotating Arcs-----------------------------------------------------------------------
// Trig lookup tables borrowed from Toxi; cryptic but effective.
float sinLUT[];
float cosLUT[];
float SINCOS_PRECISION=1.0;
int SINCOS_LENGTH= int((360.0/SINCOS_PRECISION));
 
// System data
boolean dosave=false;
int num;
float pt[];
int style[];
float Speed=0;
void handleGame3() {
  background(0);
 if(debug){
  saving();
}
   //顯示Oxy 數值
   fill(0, 102, 153);
   stroke(255,255,255);
   textSize(20);
   text("Oxy = "+ Oxy, 60,20);
 
  int index=0;
  translate(width/2, height/2, 0);
  rotateX(PI/6);
  rotateY(PI/6);
 
  for (int i = 0; i < num; i++) {
    pushMatrix();
 
    rotateX(pt[index++]);
    rotateY(pt[index++]);
 
    if(style[i*2+1]==0) {
      stroke(style[i*2]);
      noFill();
      strokeWeight(1);
      arcLine(0,0, pt[index++],pt[index++],pt[index++]);
    }
    else if(style[i*2+1]==1) {
      fill(style[i*2]);
      noStroke();
      arcLineBars(0,0, pt[index++],pt[index++],pt[index++]);
    }
    else {
      fill(style[i*2]);
      noStroke();
      arc(0,0, pt[index++],pt[index++],pt[index++]);
    }
 
    // increase rotation
    pt[index-5]+=pt[index]/10+abs((6.5-Oxy))*0.05;      //////////////////////閥值
    pt[index-4]+=pt[index++]/20+abs((6.5-Oxy))*0.05;
    popMatrix();
  }
 
}

void RotatingArcSetting(){
  // Fill the tables
  sinLUT=new float[SINCOS_LENGTH];
  cosLUT=new float[SINCOS_LENGTH];
  for (int i = 0; i < SINCOS_LENGTH; i++) {
    sinLUT[i]= (float)Math.sin(i*DEG_TO_RAD*SINCOS_PRECISION);
    cosLUT[i]= (float)Math.cos(i*DEG_TO_RAD*SINCOS_PRECISION);
  }
 
  num = 150;
  pt = new float[6*num]; // rotx, roty, deg, rad, w, speed
  style = new int[2*num]; // color, render style
 
  // Set up arc shapes
  int index=0;
  float prob;
  for (int i=0; i<num; i++) {
    pt[index++] = random(PI*2); // Random X axis rotation
    pt[index++] = random(PI*2); // Random Y axis rotation
 
    pt[index++] = random(60,80); // Short to quarter-circle arcs
    if(random(100)>90) pt[index]=(int)random(8,27)*10;
 
    pt[index++] = int(random(2,50)*5); // Radius. Space them out nicely
 
    pt[index++] = random(4,32); // Width of band
    if(random(100)>90) pt[index]=random(40,60); // Width of band
 
    pt[index++] = radians(random(5,30))/5; // Speed of rotation
 
    // get colors
    prob = random(100);
    if(prob<30) style[i*2]=colorBlended(random(1), 255,0,100, 255,0,0, 210);
    else if(prob<70) style[i*2]=colorBlended(random(1), 0,153,255, 170,225,255, 210);
    else if(prob<90) style[i*2]=colorBlended(random(1), 200,255,0, 150,255,0, 210);
    else style[i*2]=color(255,255,255, 220);

    if(prob<50) style[i*2]=colorBlended(random(1), 200,255,0, 50,120,0, 210);
    else if(prob<90) style[i*2]=colorBlended(random(1), 255,100,0, 255,255,0, 210);
    else style[i*2]=color(255,255,255, 220);

    style[i*2+1]=(int)(random(100))%3;
  }
}
 
 
// Get blend of two colors
int colorBlended(float fract,
float r, float g, float b,
float r2, float g2, float b2, float a) {
 
  r2 = (r2 - r);
  g2 = (g2 - g);
  b2 = (b2 - b);
  return color(r + r2 * fract, g + g2 * fract, b + b2 * fract, a);
}
 
 
// Draw arc line
void arcLine(float x,float y,float deg,float rad,float w) {
  int a=(int)(min (deg/SINCOS_PRECISION,SINCOS_LENGTH-1));
  int numlines=(int)(w/2);
 
  for (int j=0; j<numlines; j++) {
    beginShape();
    for (int i=0; i<a; i++) { 
      vertex(cosLUT[i]*rad+x,sinLUT[i]*rad+y);
    }
    endShape();
    rad += 2;
  }
}
 
// Draw arc line with bars
void arcLineBars(float x,float y,float deg,float rad,float w) {
  int a = int((min (deg/SINCOS_PRECISION,SINCOS_LENGTH-1)));
  a /= 4;
 
  beginShape(QUADS);
  for (int i=0; i<a; i+=4) {
    vertex(cosLUT[i]*(rad)+x,sinLUT[i]*(rad)+y);
    vertex(cosLUT[i]*(rad+w)+x,sinLUT[i]*(rad+w)+y);
    vertex(cosLUT[i+2]*(rad+w)+x,sinLUT[i+2]*(rad+w)+y);
    vertex(cosLUT[i+2]*(rad)+x,sinLUT[i+2]*(rad)+y);
  }
  endShape();
}
 
// Draw solid arc
void arc(float x,float y,float deg,float rad,float w) {
  int a = int(min (deg/SINCOS_PRECISION,SINCOS_LENGTH-1));
  beginShape(QUAD_STRIP);
  for (int i = 0; i < a; i++) {
    vertex(cosLUT[i]*(rad)+x,sinLUT[i]*(rad)+y);
    vertex(cosLUT[i]*(rad+w)+x,sinLUT[i]*(rad+w)+y);
  }
  endShape();
}

// ----------------------------Simulated Flying-----------------------------------
PImage airplane;
PImage cloud;
int x_airplane=0;
float y_airplane=0;
float y_airplane_base=0;
int Oxy_true=0;
int airplane_playstate=0;
int run_times=0;
int success=0;
int[] set_trail={5,30,5,20}; //5,30,5,20
int setForTransfer=1; // 0代表飛機平著跑，其他代表飛機不動
int setForNeuro=0; //0代表飛機訓練，1切換到射擊遊戲

int neuro_start_H;
int neuro_start_M;
int neuro_start_S;

int base_start_H;
int base_start_M;
int base_start_S;

int rest_start_H;
int rest_start_M;
int rest_start_S;
int test_i=0;


float rect0_x=width*0.00,rect0_y=height*0.8875,rect0_width=width*0.1,rect0_height=height*1/50;
float rect1_x=width*0.12,rect1_y=height*0.8875,rect1_width=width*0.1,rect1_height=height*1/50;
float rect2_x=width*0.24,rect2_y=height*0.8875,rect2_width=width*0.1,rect2_height=height*1/50;
float rect3_x=width*0.36,rect3_y=height*0.8875,rect3_width=width*0.1,rect3_height=height*1/50;
float rect4_x=width*0.48,rect4_y=height*0.8875,rect4_width=width*0.1,rect4_height=height*1/50;
float rect5_x=width*0.60,rect5_y=height*0.8875,rect5_width=width*0.1,rect5_height=height*1/50;
float rect6_x=width*0.72,rect6_y=height*0.8875,rect6_width=width*0.1,rect6_height=height*1/50;
float rect7_x=width*0.84,rect7_y=height*0.8875,rect7_width=width*0.1,rect7_height=height*1/50;
float rect8_x=width*0.96,rect8_y=height*0.8875,rect8_width=width*0.1,rect8_height=(height*1/50);


void airplane_setting(){
airplane = loadImage("airplane.png");
cloud = loadImage("cloud.png");
y_airplane_base=height-200;// height/2   height-200
 rect0_x=width*0.00;rect0_y=height*0.8875;rect0_width=width*0.1;rect0_height=height*1/50;
 rect1_x=width*0.12;rect1_y=height*0.8875;rect1_width=width*0.1;rect1_height=height*1/50;
 rect2_x=width*0.24;rect2_y=height*0.8875;rect2_width=width*0.1;rect2_height=height*1/50;
 rect3_x=width*0.36;rect3_y=height*0.8875;rect3_width=width*0.1;rect3_height=height*1/50;
 rect4_x=width*0.48;rect4_y=height*0.8875;rect4_width=width*0.1;rect4_height=height*1/50;
 rect5_x=width*0.60;rect5_y=height*0.8875;rect5_width=width*0.1;rect5_height=height*1/50;
 rect6_x=width*0.72;rect6_y=height*0.8875;rect6_width=width*0.1;rect6_height=height*1/50;
 rect7_x=width*0.84;rect7_y=height*0.8875;rect7_width=width*0.1;rect7_height=height*1/50;
 rect8_x=width*0.96;rect8_y=height*0.8875;rect8_width=width*0.1;rect8_height=(height*1/50);
}

void handleGame4() {
  
   test_i++;
background(#A0CAFF);
fill(#787A7E);

noStroke();
rect(0, height*8/10, width, height);
fill(#FFE415);
rect(rect0_x,rect0_y,rect0_width,rect0_height);
rect(rect1_x,rect1_y,rect1_width,rect1_height);
rect(rect2_x,rect2_y,rect2_width,rect2_height);
rect(rect3_x,rect3_y,rect3_width,rect3_height);
rect(rect4_x,rect4_y,rect4_width,rect4_height);
rect(rect5_x,rect5_y,rect5_width,rect5_height);
rect(rect6_x,rect6_y,rect6_width,rect6_height);
rect(rect7_x,rect7_y,rect7_width,rect7_height);
rect(rect8_x,rect8_y,rect8_width,rect8_height);



image(cloud, width/5, height/80);
image(cloud, width*1.2/5, height*15/80);

  nowTime_H=hour();
  nowTime_M=minute();
  nowTime_S=second();
  Timeduring = (nowTime_H-startTime_H)*3600+(nowTime_M-startTime_M)*60+(nowTime_S-startTime_S);
  
  fill(0);
  textSize(20);
 // text("Timeduring"+Timeduring,150,50);
   fill(255,0,0);
  textSize(20);
//  text("run_times"+run_times,150,150);
  fill(0,255,0);
  textSize(20);
//  text("setForTransfer"+setForTransfer,150,250);
  fill(0);
  textSize(20);
//  text("y_airplane_base"+y_airplane_base,350,150);
   fill(0);
  textSize(20);
//  text("oxy"+Oxy,550,150);
 if(debug){
  saving();}
 
  switch(airplane_playstate){
  case 0:
  baseline();
  neuro_start_H=hour();
  neuro_start_M=minute();
  neuro_start_S=second();
  x_airplane=0;
  break;
  case 1:

  neurofeedback();

  if(Oxy>0.5){Oxy_true+=1;}
     int neuroduringTime=(hour()-neuro_start_H)*3600+ (minute()-neuro_start_M)*60+(second()-neuro_start_S);
   if(neuroduringTime>set_trail[1]){
         if(Oxy_true>=100){suc = true;success++;Oxy_true=0;}
         else{suc=false;}
         airplane_playstate=2;Oxy_true=0;}
  break;
  
  case 2:
  result();
  rest_start_H=hour();
  rest_start_M=minute();
  rest_start_S=second();
  break;
  case 3:
  rest();
  base_start_H=hour();
  base_start_M=minute();
  base_start_S=second();
  x_airplane=0;
  break;
  default:
  break;
  }
  if(run_times>31){
  state = stateAfterAGame;}

}
boolean suc;
int reat_t=0;

void baseline(){
  image(airplane, 0, y_airplane_base);
  Oxy_true=0;
  reat_t =5-((hour()-base_start_H)*3600+ (minute()-base_start_M)*60+(second()-base_start_S));
  
  fill(0);
  textSize(100);
  text("距離起飛倒數"+reat_t+"秒",width/2,height/2);
  if(reat_t==0){airplane_playstate=1;}
}


void neurofeedback(){
   x_airplane+=10;
   if(x_airplane>=width){x_airplane=0;}
   
   if(y_airplane_base-Oxy*30>=height){x=0;}
   if(run_times<3){  //當不是transfer block時
       y_airplane=y_airplane_base-Oxy*60;
       if(y_airplane>y_airplane_base){y_airplane=y_airplane_base;}
       if(y_airplane<0){y_airplane=0;}
       }
   else {
             x_airplane=width/2-100;
             y_airplane=height/2-100;  } //當跑到transfer block時，不移動
   
      
   image(airplane, x_airplane, y_airplane);
   }


void result(){
   if(suc){
      fill(0,255,0);
      textSize(200);
      text("O",width/2,height/2+100);}

   else{
      fill(255,0,0);
      textSize(200);
      text("X",width/2,height/2+100);}
if(Timeduring-(set_trail[0]+set_trail[1]+(run_times)*(set_trail[0]+set_trail[1]+set_trail[2]+set_trail[3]))>=set_trail[2]){
   airplane_playstate=3;}
}

void rest(){

  reat_t =set_trail[3]-((hour()-rest_start_H)*3600+ (minute()-rest_start_M)*60+(second()-rest_start_S));
  fill(0);
  textSize(100);
  text("請閉眼休息"+reat_t+"秒",width/2,height/2);
  if(reat_t==0){
  airplane_playstate=0;run_times++;}
 
}

// ------------------------------------------------------mental arithmetics--------------------------------------------------------------
int modifyBaseTime;    //60
int modifyTaskTime = 316;    //316
int modifyRestTime =  180;    //120
int QuestionTime = 1;
int ThinkingTime = 4;
int AnswerTime = 1;
int FeedbackTime = 1;
int stressTask;
int MentalCalculate = 0;
  //circle 倒數計時用
  float q;
  float w;
int[] a = { 33,89,27,42,75,23,38,53,50,82,24,61,79,28,52,67,12,22,44,36,18,99,84,72,63,516,728,223,913,407,332,302,211,401,526,700,314,819,963,930,427,295,775,569,611};  //二位數25個，三位數20個
int c;
int b;
int[] var = {3, -3, 7, -7, 10, -10}; //混淆答案用的數字
int d;
int[] ans = {0, 0};
int round = 0;
int anskey;
int CorrectOrWrong = 999;
int Q = 0;
PImage cir;
PImage cross;
PImage Q_mark;
//答對、答錯、未達題數
int Correct=0;
int Wrong=0;
int Slow=0;
//判斷是否答對
int correct=0;
int wrong=0;
int slow=0;
int AnsStartT_M;
int AnsStartT_S;
int AnsT_M;
int AnsT_S;
int zzz;
int CloseEyeState; //避免測驗中跳回閉眼階段，且要休息3xxxx秒以上的情況 
int startTime_milli;
int nowTime_milli;
int taskTime_milli;


 



void MentalCal_Setting(){
  cir = loadImage("circle.png");
  cross = loadImage("cross.png");
  Q_mark = loadImage("Q_mark.png");
}

void handleGame5(){
    if (pretest==0){modifyBaseTime = 60;}        //60
    if (pretest==1){modifyBaseTime = 5;}
    nowTime_milli=millis();
    Timeduring = floor((nowTime_milli-startTime_milli)/1000);
    

   if(debug){
    saving();
   }
    
    //檢查bug用
    //textSize(80);
    //text("modifyBaseTime: "+modifyBaseTime,width/4*3, height/2+320 );
    //text("Timeduring: "+Timeduring,width/4*3, height/2+400 );
  
    
    // 預先測試5題(size(Q) = 5) 
    if(pretest==1 && Q>4){
     if(connect == 1){myPort.write("2");}
     state=3;
   }
    
    
    
switch(MentalCalculate){
 case 0:
  textSize(160);
  fill(255);
  //text("請閉眼休息"+(modifyBaseTime-Timeduring)+"秒",width/2,height/2);
  text("請閉眼休息",width/2,height/2-40);
  text((modifyBaseTime-Timeduring)+"秒",width/2,height/2+160);
  
break;

 case 1:
  

 // c == true 代表真實答案在左邊，c == false 代表真實答案在右邊
 if(boolean(c) == true){
   switch(stressTask){
     case 0:   
     
     textSize(160);
     text(a[Q]+" + 17 = ?  ",width/2+40,height/2);
     
     //fill(#9B9696);
     //textSize(60);
     //text(Timeduring-modifyBaseTime,50,height-20); //測驗經過時間
     //fill(255);
     break;
     
     case 1:
     circle();
     press =0;
     push=0;
     
     //fill(#9B9696);
     //textSize(60);
     //text(Timeduring-modifyBaseTime,50,height-20); //測驗經過時間
     //fill(255);
     break;
     
     case 2:
     textSize(160);
     text(ans[0],width/4,height/2);
     text(ans[1],width/4+940,height/2);
     
     //fill(#9B9696);
     //textSize(60);
     //text(Timeduring-modifyBaseTime,50,height-20); //測驗經過時間
     //fill(255);
     break;
     
     case 3:
     press =3;
     feedback();
     
     //fill(#9B9696);
     //textSize(60);
     //text(Timeduring-modifyBaseTime,50,height-20); //測驗經過時間
     //fill(255);
     break;
     default:
     break;
   }  //switch
  } //if
    
  if(boolean(c) == false){
   switch(stressTask){
     case 0:   
     
     //textSize(50);
     textSize(160);
     text(a[Q]+" - 17 = ?  ",width/2+40,height/2);
     
     //fill(#9B9696);
     //textSize(60);
     //text(Timeduring-modifyBaseTime,50,height-20); //測驗經過時間
     //fill(255);
     break;
     
     case 1:
     circle();
     press =0;
     push=0;
     
     //fill(#9B9696);
     //textSize(60);
     //text(Timeduring-modifyBaseTime,50,height-20); //測驗經過時間
     //fill(255);
     break;
     
     case 2:
     textSize(160);
     text(ans[0],width/4,height/2);
     text(ans[1],width/4+940,height/2);
     
     //fill(#9B9696);
     //textSize(60);
     //text(Timeduring-modifyBaseTime,50,height-20); //測驗經過時間
     //fill(255);
     break;
     
     case 3:
     press =3;
     feedback();
     
     //fill(#9B9696);
     //textSize(60);
     //text(Timeduring-modifyBaseTime,50,height-20); //測驗經過時間
     //fill(255);
     break;
     default:
     break;
   }  //switch
  } //if
  
  
  break;  // case 1
  
  

  default:
  break; 
 }  //switch
  
  
  if(Timeduring<modifyBaseTime && CloseEyeState == 1){
  MentalCalculate = 0;
 }
  
  if(Timeduring>=modifyBaseTime && (Timeduring-modifyBaseTime)<modifyTaskTime ){
  MentalCalculate = 1;
  
  }
  
  if(Timeduring ==modifyBaseTime+QuestionTime +7*round  && (Timeduring-modifyBaseTime)<modifyTaskTime ){
    q=HALF_PI*3;
    w=(PI/180);
    frameRate(50);
    CloseEyeState = 0;
  }

  if(Timeduring >modifyBaseTime+QuestionTime +7*round && (Timeduring-modifyBaseTime)<modifyTaskTime ){
  stressTask = 1;
  }

  if(Timeduring ==modifyBaseTime+QuestionTime+ThinkingTime +7*round && c == 1 && (Timeduring-modifyBaseTime)<modifyTaskTime ){
   b = a[Q] + 17; 
   //var = {3, -3, 7, -7};
   shuffle(var);   
   d = b+var[1];
   ans[0] = b;
   ans[1] = d;
   //ans = {b, d};
   shuffle(ans);
   //AnsStartT_S=second();
   AnsStartT_M=millis();
   
  }

  if(Timeduring ==modifyBaseTime+QuestionTime+ThinkingTime +7*round && c == 0 && (Timeduring-modifyBaseTime)<modifyTaskTime ){
   b = a[Q] - 17; 
   //var = {3, -3, 7, -7};
   shuffle(var);   
   d = b+var[1];
   ans[0] = b;
   ans[1] = d;
   //ans = {b, d};
   shuffle(ans);
   //AnsStartT_S=second();
   AnsStartT_M=millis();
   
  }

  if(Timeduring >modifyBaseTime+QuestionTime+ThinkingTime +7*round && (Timeduring-modifyBaseTime)<modifyTaskTime ){
  stressTask = 2;
  }
  
  if(press == 1){
    fill(204, 102, 0);
    noStroke();
    rect(0, 0, width/2, height);
    fill(255);
    textSize(160);
    text(ans[0],width/4,height/2);
    text(ans[1],width/4+940,height/2);
    anskey = 1;
    
  }  
  if(press == 2){
    fill(204, 102, 0);
    noStroke();
    rect(width/2, 0, width, height);
    fill(255);
    textSize(160);
    text(ans[0],width/4,height/2);
    text(ans[1],width/4+940,height/2);
    anskey = 2;
    
  }  

  if(Timeduring ==modifyBaseTime+QuestionTime+ThinkingTime+AnswerTime +7*round && (Timeduring-modifyBaseTime)<modifyTaskTime ){
    if(ans[0]==b){
      if(press == 1){CorrectOrWrong = 1;}
      if(press == 2){CorrectOrWrong = 0;}
      }
    if(ans[1]==b){
      if(press == 1){CorrectOrWrong = 0;}
      if(press == 2){CorrectOrWrong = 1;}
      }
  }

  if(Timeduring >modifyBaseTime+QuestionTime+ThinkingTime+AnswerTime +7*round && (Timeduring-modifyBaseTime)<modifyTaskTime ){
  stressTask = 3;
  }

  if(Timeduring >modifyBaseTime+QuestionTime+ThinkingTime+AnswerTime+FeedbackTime +7*round && (Timeduring-modifyBaseTime)<modifyTaskTime ){
  Q++;
  RT =(AnsT_M - AnsStartT_M)/thousand;
  if(zzz ==1){RT=1;}
  c = round(random(0,1));
  round++;
  push = 0;
  press = 0;
  CorrectOrWrong = 999;
  stressTask = 0;
    if(correct==1){Correct++;}
    if(wrong==1){Wrong++;}
    if(slow==1){Slow++;}
  correct=0;
  wrong=0;
  slow=0;
  count=0;
  zzz=0; 
  
  
    
  }
  
  

  
 
 
 if((Timeduring-modifyBaseTime)>=modifyTaskTime){push = 0;press = 0;CorrectOrWrong = 999;background(0);textSize(80);text("測驗結束，請閉眼休息，並專注於自身呼吸",width/2,height/2);}
  if((Timeduring-modifyBaseTime-modifyTaskTime)>=modifyRestTime){
  //myPort.write("2");
  state=3;
  }
     
} 


   void shuffle(int[] ha) 
{ 
  int temp; 
  int pick; 
  
  println("Shuffling..."); 
   for(int i=0; i<ha.length; i++) 
     { 
       temp = ha[i]; 
       pick  = (int)random(ha.length); 
       ha[i] = ha[pick]; 
       ha[pick]= temp; 
     } 
} 


  void circle(){
  background(0);
  noFill();
  stroke(255);
  strokeWeight(10);
  strokeCap(PROJECT);
  arc(width/2, height/2, 200, 200,w*270, q);
  q=q+1.8*w;
  }
  
  void feedback(){
    background(0);
    if(CorrectOrWrong == 0){
      image(cross,width/2-200, height/2-200, 400,400 );
      fill(255);
      //text(" 答錯  ",width/2,height/2);
      wrong=1;}
    if(CorrectOrWrong == 1){ 
      image(cir,width/2-200, height/2-200, 400,400 );
      fill(255);
      //text(" 答對  ",width/2,height/2);
      correct=1;}
    if(push == 0){ 
      image(Q_mark,width/2-200, height/2-200, 400,400 );
      fill(255);
      //text(" 算太久了!  ",width/2,height/2);
      slow=1;
      zzz=1;} //RT=0不放在這裡的是因為要讓Excel輸出表格的數值同時改變，看起來較舒服
      
  }
  
  //-------------------------------------------------------------------------------ShowOxyLine---------------------------------------------------------------------------------
  
