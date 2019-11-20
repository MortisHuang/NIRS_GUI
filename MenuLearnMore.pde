

// Tools for "Learn More" 

void textLearnMoreOnScreen() {
  String a = textLearnMore();
  a = a.replaceAll("#", "\n");
  a += "                          - 點一下，回到首頁。";
  textLeading(100);
  text(a, width/2, height/2-300);
}
//
void printLearnMore() {
  String a = textLearnMore();
  String[] list = split(a, '#');
  for (int i=0; i<list.length;i++) {
    println(list[i]);
  }
}
//
String textLearnMore() {
  // the sign # is used as line break here  
  String a=""; 
  a+="#"+"NCTU Biomedical Optical Imaging Lab";
  a+="#"+"此程式製作者：Mortis Huang ";
  a+="#"+"開發目的：提供方便的NIRS量測、測試環境";
  a+="#"+"如有任何問題，請燒紙。  E-mail: mortis1115.eo00@g2.nctu.edu.tw";
  a+="#"+"#";
  return (a);
}
//
