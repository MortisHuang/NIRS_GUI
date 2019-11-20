int press; //判斷左右按鍵
int pressL;
int pressR;
int push = 0; //評斷是否有按按鍵
// Input key
// each state has an own keyPressed routine 

void keyPressed() {
  //
  // depending on the state choose keyPressed routine
  switch (state) {
  case stateWelcomeScreen:
    keyPressedstateWelcomeScreen();
    break;
  case statePlay:
    if(currentGame==1){ 
    if(keyCode == ENTER){theNumber-=13;Answers+=1;}
    if(keyCode == ALT)state=stateAfterAGame;}
    if(currentGame==0){ 
     state = stateAfterAGame;}
    if(currentGame==4){
      //if(stressTask == 2){
      //  if(keyCode == LEFT){
      //  press = 1;
      //  push = 1;
      //  //AnsT_S=second();
      //  AnsT_M=millis();
      //  RT =(AnsT_M - AnsStartT_M)/thousand;
        
      //  }
      //  if(keyCode == RIGHT){
      //  press = 2;
      //  push = 1;
      //  //AnsT_S=second();
      //  AnsT_M=millis();
      //  RT =(AnsT_M - AnsStartT_M)/thousand;
        
      //  }
        
      //} 
      if(keyCode == ALT)state=stateAfterAGame;
     }
    break;
  case stateLearnMore:
    //
    break;
  case stateAfterAGame:
    //
    break;  
  default:
    println("Unknown State (Error 23 in tab InputKey): " + state+ ".");
    exit();
    break;
  } // switch
  //
  if(keyCode == CONTROL){
  // Saves each frame as line-000001.png, line-000002.png, etc.
  saveFrame("line-######.png");
  }
} // func 
//
void keyPressedstateWelcomeScreen() {
  // do nothing
}
//