
// Main 

//Sound Effect
import ddf.minim.*;
Minim minim;
AudioSample shoot;
AudioSample explosion;

//Timing
int startTime_H=0,nowTime_H=0,startTime_M=0,nowTime_M=0,startTime_S=0,nowTime_S=0,Timeduring=0,TimeStart;

//Prepare to use own font
PFont myFont;
String Filename;


// Titel
final String strConstTitel = "NIRS Headgear Software";


// states for the program (see tab States)
final int stateWelcomeScreen  = 0; // Menu at the beginning 
final int statePlay           = 1; // playing the game that has beeen chosen
final int stateLearnMore      = 2; // show help / learn more
final int stateAfterAGame     = 3; // after game, before returning to Welcome Screen


int state = stateWelcomeScreen;  // current state (current game)

// Games: 
final int chooseGame1 = 0; //射擊               
final int chooseGame2 = 1; //算數
final int chooseGame3 = 2; //時輪
final int chooseGame4 = 3; //飛機
final int chooseGame5 = 4; //算數new
final int chooseGame6 = 5; //校正
final int chooseGame7 = 6; //即時顯示血氧訊號
final int chooseGame8 = 7; //小腿束縛測驗

final String [] chooseGameName = 
{ 
  "射擊遊戲",
  "算術測驗", 
  "旋轉時之輪",
  "模擬飛行",
  "算術測驗new",
  "校正",
  "血氧訊號",
  "小腿束縛測驗",
  "了解更多",
  "連接/中斷",
  "監控視窗",
  "預先測試"
};



final String [] statusText = 
{
  "利用滑鼠控制飛船，擊落隕石。", 
  "在有限時間內盡量完成越多題目越好。", 
  "試著靠專注力來停下轉動的時之輪", 
  "Learn more about BOIL research team",
  "藍芽連接/中斷",
  "開啟/關閉監控功能",
  "試著用專注力控制畫面中的飛機", 
  "盡可能地去答對所有題目",
  "在五題練習題中熟悉作答方式",
  "在測驗開始前請先進行校正",
  "即時顯示血氧訊號",
  "小腿束縛測驗監控"
  
};
//
// current game
int currentGame = chooseGame1;
//
// the initial Main Menu
int textXPos;
int learnPos; 
int[] textYPos = { 
  200, 
  350, 
  500, 
  650,
  800,
  950
};
//
// rectangles as buttons for main menu 
Rectangle rectButtonBoard1;  //shoot 
Rectangle rectButtonBoard2;  //math
Rectangle rectButtonBoard3;  //rotating arc
Rectangle rectButtonBoard4;  //fly
Rectangle rectButtonBoard5;  //math New
Rectangle rectButtonBoard6;  //pretest
Rectangle rectCorrection;   
Rectangle rectShowOxyLine;
Rectangle rectCalfCuff;
Rectangle rectLearnmore; 
Rectangle rectConnect;
Rectangle rectMultipleWindow;


//Second Window
 String[] args1 = {"TwoFrameTest"};
 NIRSWindow sa = new NIRSWindow();
 int second_window_monitor = 2;
 int first_window_monitor = 1;
//
// ========================================================================================================
void settings(){
  fullScreen(P3D,2); //控制你的主畫面要在哪個螢幕上顯示
}
void setup () {

  // define values for class Rectangle
  textXPos = width/2-250;
  learnPos = textXPos+400;
  // define objects of class Rectangle
  rectButtonBoard1 = new Rectangle(textXPos, textYPos[0], 500, 145, chooseGameName[0], statusText[0], 0);
  rectButtonBoard2 = new Rectangle(textXPos, textYPos[1], 500, 145, chooseGameName[1], statusText[1], 1);
  rectButtonBoard3 = new Rectangle(textXPos, textYPos[2], 500, 145, chooseGameName[2], statusText[2], 2);
  rectButtonBoard4 = new Rectangle(textXPos, textYPos[3], 500, 145, chooseGameName[3], statusText[6], 2);
  rectButtonBoard5 = new Rectangle(textXPos, textYPos[4], 500, 145, chooseGameName[4], statusText[7], 3);
  rectButtonBoard6 = new Rectangle(learnPos+105, textYPos[4], 145, 145, chooseGameName[11], statusText[8], -1);
  rectCorrection = new Rectangle(textXPos, textYPos[5], 100, 25, chooseGameName[5], statusText[9], -1);
  rectShowOxyLine = new Rectangle(textXPos-150, textYPos[4], 145, 145, chooseGameName[6], statusText[10], -1);  //血氧訊號圖
  rectCalfCuff = new Rectangle(textXPos-150, textYPos[3], 145, 145, chooseGameName[7], statusText[11], -1);
  rectLearnmore    = new Rectangle(learnPos, textYPos[5], 100, 25, chooseGameName[8], statusText[3], -1);
  rectConnect      = new Rectangle(learnPos-120, textYPos[5], 100, 25, chooseGameName[9], statusText[4], -1);
  rectMultipleWindow      = new Rectangle(learnPos-240, textYPos[5], 100, 25, chooseGameName[10], statusText[5], -1);
  
  myFont = createFont("Microsoft YaHei Mono.ttf",100);
  textFont(myFont);
  frameRate(50);

  //Simulated Flying
airplane_setting();

  //Rotating Arcs
RotatingArcSetting();
  //ShootingGame
shootingSetting();
  //Second Window
  
MentalCal_Setting();
  //mental arithmetics
  
LoadImageIcon_Setting();
  //menu icon images


}



void draw () {

  if (currentGame != chooseGame7){background(0);}
    // see tab States for handling the states 
  switch (state) {
  case stateWelcomeScreen:
    handleStateShowWelcomeScreen();
    break;
  case statePlay:
    handleStatePlay();
    break;
  case stateLearnMore:
    handleStateLearnMore();
    break;
  case stateAfterAGame:
    handleStateAfterAGame();
    break;
  default:
    // error 
    println("Unknown State (Error 33 in main tab): " 
      + state
      + ".");
    exit();
    break;
 
    
    
  } // switch
} // func 
//
