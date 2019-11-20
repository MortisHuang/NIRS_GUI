

// states for the program 

void handleStateShowWelcomeScreen() {
  // 
  // shows the main menu with the main game buttons 
  // 
  // headline 
  background(0);
  strokeWeight(1);
  fill(255);  
  textSize(50);
  textAlign(CENTER);
  text (strConstTitel, width/2-50, 60);
  //
  // intro text below headline 
  textSize(19);
  textAlign(LEFT);

if(debug){text ("已與NIRS頭架連接，開啟自動存檔功能", textXPos+100, 80+30+30);
  if(multiple){text ("已開啟監控功能", textXPos+100, 80+30+30+30);} 
  else {text ("未開啟監控功能", textXPos+100, 80+30+30+30);}  } 
else {text ("未與NIRS頭架連接：Demo Mode", textXPos+100, 80+30+30);}
  
  
  
  //
  // 1st game option
  rectButtonBoard1.outputRect(); 
  // 2nd game option 
  rectButtonBoard2.outputRect(); 
  // 3rd game option 
  rectButtonBoard3.outputRect(); 
  // 4th game option
  rectButtonBoard4.outputRect();
  // 5th game option
  rectButtonBoard5.outputRect();
  // 6th game option
  rectButtonBoard6.outputRect();
  // Correction
  rectCorrection.outputRect();
  // ShowOxyLine
  rectShowOxyLine.outputRect();
  // CalfCuff
  rectCalfCuff.outputRect();
  // learn more box
  rectLearnmore.outputRect();
  //Connect Button
  rectConnect.outputRect();
  //MultipleWindow
  if(debug){
  rectMultipleWindow.outputRect();}
  //時間歸0
  Timeduring=0;
  
  
}
//
void handleStatePlay() {

  MainProgram();
  
}
//
void handleStateLearnMore() {
  //
  textLearnMoreOnScreen();
}
//
void handleStateAfterAGame() {
  // After a game:
  // Wait for mousePressed 
  // to go to the Welcome Screen again. 

  background(0);
  strokeWeight(1);
  // headline 
  fill(255);  
  textSize(32);
  textAlign(CENTER);
  text (strConstTitel, width/2, 40);
  //
  // intro text 
  textSize(30);
  textAlign(LEFT);
  text ( chooseGameName[currentGame] + "已結束", textXPos, 150);  
  textSize(30);
  text("感謝您的配合", 
  textXPos, 230);
  text("按一下回到首頁", 500, height-30);
  if(debug){
saveTable(table, "data/"+chooseGameName[currentGame]+"/"+Filename+".csv"); //已包含創建資料夾功能
myPort.write("2");
myPort.clear();
  }
  Timeduring = 0;
  //
} // func 
// 
