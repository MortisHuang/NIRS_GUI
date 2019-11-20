import processing.serial.*;
import static javax.swing.JOptionPane.*;
Serial myPort;  // Create object from Serial class
boolean debug = false;
Table table;
Table table2;
Table table3;
Table table4;
Table table5;
String uart;
int i =0;
int x=0;
float Oxy = 0;
float CH1_Oxy=0;
float CH2_Oxy=0;
float CH3_Oxy=0;
float CH4_Oxy=0;
float CH1_DeOxy=0;
float CH2_DeOxy=0;
float CH3_DeOxy=0;
float CH4_DeOxy=0;
String COMx, COMlist = "";
String portName;
Boolean table1save=false;
Boolean table2save=false;
Boolean table3save=false;
Boolean table4save=false;
Boolean table5save=false;
float AnswerRate;
float CorrectRate;
float thousand=1000;
float RT=0;

void csv(){
  
  table = new Table();
  table.addColumn("Time_Host");
  table.addColumn("Time_Arduino");
  table.addColumn("easingdata");
  table.addColumn("CH1_Oxy");
  table.addColumn("CH1_Deoxy");
  table.addColumn("CH2_Oxy");
  table.addColumn("CH2_Deoxy");
  table.addColumn("CH3_Oxy");
  table.addColumn("CH3_Deoxy");
  table.addColumn("CH4_Oxy");
  table.addColumn("CH4_Deoxy");
  table.addColumn("CH1_PD730");
  table.addColumn("CH1_PD850");
  table.addColumn("CH2_PD730");
  table.addColumn("CH2_PD850");
  table.addColumn("CH3_PD730");
  table.addColumn("CH3_PD850");
  table.addColumn("CH4_PD730");
  table.addColumn("CH4_PD850");
  table.addColumn("Answers");
  table.addColumn("airplane_playstate");
  table.addColumn("frameRate");
  table.addColumn("Correct"); 
  table.addColumn("Wrong"); 
  table.addColumn("Too Slow"); 
  table.addColumn("Respond Time"); 
  table.addColumn("AnswerRate");
  table.addColumn("CorrectRate"); 

   
  
  
  table2 = new Table();
  table2.addColumn("Time_Host");
  table2.addColumn("Time_Arduino");
  table2.addColumn("easingdata");
  table2.addColumn("CH1_Oxy");
  table2.addColumn("CH1_Deoxy");
  table2.addColumn("CH2_Oxy");
  table2.addColumn("CH2_Deoxy");
  table2.addColumn("CH3_Oxy");
  table2.addColumn("CH3_Deoxy");
  table2.addColumn("CH4_Oxy");
  table2.addColumn("CH4_Deoxy");
  table2.addColumn("CH1_PD730");
  table2.addColumn("CH1_PD850");
  table2.addColumn("CH2_PD730");
  table2.addColumn("CH2_PD850");
  table2.addColumn("CH3_PD730");
  table2.addColumn("CH3_PD850");
  table2.addColumn("CH4_PD730");
  table2.addColumn("CH4_PD850");
  table2.addColumn("Answers");
  table2.addColumn("airplane_playstate");
  table2.addColumn("frameRate");

  
 
  table3 = new Table();
  table3.addColumn("Time_Host");
  table3.addColumn("Time_Arduino");
  table3.addColumn("easingdata");
  table3.addColumn("CH1_Oxy");
  table3.addColumn("CH1_Deoxy");
  table3.addColumn("CH2_Oxy");
  table3.addColumn("CH2_Deoxy");
  table3.addColumn("CH3_Oxy");
  table3.addColumn("CH3_Deoxy");
  table3.addColumn("CH4_Oxy");
  table3.addColumn("CH4_Deoxy");
  table3.addColumn("CH1_PD730");
  table3.addColumn("CH1_PD850");
  table3.addColumn("CH2_PD730");
  table3.addColumn("CH2_PD850");
  table3.addColumn("CH3_PD730");
  table3.addColumn("CH3_PD850");
  table3.addColumn("CH4_PD730");
  table3.addColumn("CH4_PD850");
  table3.addColumn("Answers");
  table3.addColumn("airplane_playstate");
  table3.addColumn("frameRate");

    
  table4 = new Table();
  table4.addColumn("Time_Host");
  table4.addColumn("Time_Arduino");
  table4.addColumn("easingdata");
  table4.addColumn("CH1_Oxy");
  table4.addColumn("CH1_Deoxy");
  table4.addColumn("CH2_Oxy");
  table4.addColumn("CH2_Deoxy");
  table4.addColumn("CH3_Oxy");
  table4.addColumn("CH3_Deoxy");
  table4.addColumn("CH4_Oxy");
  table4.addColumn("CH4_Deoxy");
  table4.addColumn("CH1_PD730");
  table4.addColumn("CH1_PD850");
  table4.addColumn("CH2_PD730");
  table4.addColumn("CH2_PD850");
  table4.addColumn("CH3_PD730");
  table4.addColumn("CH3_PD850");
  table4.addColumn("CH4_PD730");
  table4.addColumn("CH4_PD850");
  table4.addColumn("Answers");
  table4.addColumn("airplane_playstate");
  table4.addColumn("frameRate");

  
  table5 = new Table();
  table5.addColumn("Time_Host");
  table5.addColumn("Time_Arduino");
  table5.addColumn("easingdata");
  table5.addColumn("CH1_Oxy");
  table5.addColumn("CH1_Deoxy");
  table5.addColumn("CH2_Oxy");
  table5.addColumn("CH2_Deoxy");
  table5.addColumn("CH3_Oxy");
  table5.addColumn("CH3_Deoxy");
  table5.addColumn("CH4_Oxy");
  table5.addColumn("CH4_Deoxy");
  table5.addColumn("CH1_PD730");
  table5.addColumn("CH1_PD850");
  table5.addColumn("CH2_PD730");
  table5.addColumn("CH2_PD850");
  table5.addColumn("CH3_PD730");
  table5.addColumn("CH3_PD850");
  table5.addColumn("CH4_PD730");
  table5.addColumn("CH4_PD850");
  table5.addColumn("Answers");
  table5.addColumn("airplane_playstate");
  table5.addColumn("frameRate");


}

void comport(){

  try {
    if(true) {printArray(Serial.list());
    int i = Serial.list().length;
    if (i != 0) {
      if (i >= 2) {
        // need to check which port the inst uses -
        // for now we'll just let the user decide
        for (int j = 0; j < i;) {
          COMlist += char(j+'a') + " = " + Serial.list()[j];
          if (++j < i) COMlist += ",  ";
        }
        
        COMx = showInputDialog("If you just need to DEMO choose Cancel\n"+"Which COM port is correct? (a,b,..):\n"+COMlist);
        //frame.setAlwaysOnTop(true);
        if (COMx == null) debug =false;
        if (COMx.isEmpty()) debug = false;
        i = int(COMx.toLowerCase().charAt(0) - 'a') + 1;
        debug = true;
      }
      portName = Serial.list()[i-1];
         if (debug){
    myPort = new Serial(this, portName, 57600); // change baud rate to your liking
    myPort.bufferUntil('\n');
    println(portName);
    //myPort.clear();// buffer until CR/LF appears, but not required..
    }
      
    
    }
    else {
      showMessageDialog(frame,"Device is not connected to the PC");
      debug=false;
      
    }
  }
  }
  catch (Exception e)
  { //Print the type of error
    showMessageDialog(frame,"COM port is not available (may\nbe in use by another program)");
    println("Error:", e);
    debug=false;
  }

}


void saving(){
  

  float thousand = 1000;
  float Time = millis()/thousand;
  if ( myPort.available() > 0 ) {  // If data is available,
  uart = myPort.readStringUntil(10);

  if (uart!=null  && uart.length() >= 100 ){
    //println(uart);
     

     int p1 = uart.indexOf("T");
     int p2 = uart.indexOf("e");
     int p3 = uart.indexOf("AO");
     int p4 = uart.indexOf("AH");
     int p5 = uart.indexOf("BO");
     int p6 = uart.indexOf("BH");
     int p7 = uart.indexOf("CO");
     int p8 = uart.indexOf("CH");
     int p9 = uart.indexOf("DO");
     int p10 = uart.indexOf("DH");
     int p11 = uart.indexOf("AS");
     int p12 = uart.indexOf("AE");
     int p13 = uart.indexOf("BS");
     int p14 = uart.indexOf("BE");
     int p15 = uart.indexOf("CS");
     int p16 = uart.indexOf("CE");
     int p17 = uart.indexOf("DS");
     int p18 = uart.indexOf("DE");
     int tt = uart.length();
     
         Oxy =float(uart.substring(p2+1,p3));
         CH1_Oxy=float(uart.substring(p3+2,p4));
         CH1_DeOxy=float(uart.substring(p4+2,p5));
         CH2_Oxy=float(uart.substring(p5+2,p6));
         CH2_DeOxy=float(uart.substring(p6+2,p7));
         CH3_Oxy=float(uart.substring(p7+2,p8));
         CH3_DeOxy=float(uart.substring(p8+2,p9));
         CH4_Oxy=float(uart.substring(p9+2,p10));
         CH4_DeOxy=float(uart.substring(p10+2,p11));

         float Host_time = millis()-TimeStart;

         
         
         table1save = true;
         table2save = false;
         table3save = false;
         table4save = false;
         table5save = false;
         TableRow newRow = table.addRow();
         newRow.setFloat("Time_Host",(Host_time)/1000.00);
         newRow.setString("Time_Arduino", uart.substring(p1+1,p2)); 
         newRow.setString("easingdata", uart.substring(p2+1,p3));
         newRow.setString("CH1_Oxy", uart.substring(p3+2,p4));
         newRow.setString("CH1_Deoxy", uart.substring(p4+2,p5));
         newRow.setString("CH2_Oxy", uart.substring(p5+2,p6));
         newRow.setString("CH2_Deoxy", uart.substring(p6+2,p7));
         newRow.setString("CH3_Oxy", uart.substring(p7+2,p8));
         newRow.setString("CH3_Deoxy", uart.substring(p8+2,p9));
         newRow.setString("CH4_Oxy", uart.substring(p9+2,p10));
         newRow.setString("CH4_Deoxy", uart.substring(p10+2,p11));
         newRow.setString("CH1_PD730", uart.substring(p11+2,p12));
         newRow.setString("CH1_PD850", uart.substring(p12+2,p13));
         newRow.setString("CH2_PD730", uart.substring(p13+2,p14));
         newRow.setString("CH2_PD850", uart.substring(p14+2,p15));
         newRow.setString("CH3_PD730", uart.substring(p15+2,p16));
         newRow.setString("CH3_PD850", uart.substring(p16+2,p17));
         newRow.setString("CH4_PD730", uart.substring(p17+2,p18));
         newRow.setString("CH4_PD850", uart.substring(p18+2,tt-2));
          if(currentGame==0){
         newRow.setInt("Answers", score);
         }
         if(currentGame==1){
         newRow.setInt("Answers", Answers);
         }
         if(currentGame==2){
         }
         if(currentGame==3){
            newRow.setInt("Answers",success);
            newRow.setInt("airplane_playstate",airplane_playstate);
            newRow.setFloat("frameRate",frameRate);
         } 
         if(currentGame==4){
            newRow.setInt("Answers",Q);
            newRow.setInt("Correct",Correct);
            newRow.setInt("Wrong",Wrong);
            newRow.setInt("Too Slow",Slow);
            newRow.setFloat("Respond Time",RT);
            if(Q>0){AnswerRate = ((Correct+Wrong)*thousand)/(Q*1000);newRow.setFloat("AnswerRate",AnswerRate);}
            if(Q>0){CorrectRate = (Correct*thousand)/(Q*1000);newRow.setFloat("CorrectRate",CorrectRate);}

            
         }
    
  

}//length >=100  
}//Serial port avaible
}//saving()