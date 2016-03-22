float firstRubrikLength = 80;
int lengthBetween = 20;
int halfOfLengthBetween = 10;
int nameHight = 120;

int numberOf18CentHerous = 4;
int numberOf19CentHerous = 8;
int availableNumberOfHerous = numberOf18CentHerous+numberOf19CentHerous;
int lines18 = 2;
int lines19 = 3;
int lines = lines18 + lines19;
float positionYOfFirstImage = firstRubrikLength +5;
float yOffsetForFirst = 0.0; 
PImage[] imgHerousSquare = new PImage[availableNumberOfHerous];

PVector[] pictureCordinates = new PVector[availableNumberOfHerous];
float firstColumnX = 20;
float secondColumnX;
float thirdColumnX;
float spaceBetweenColumns = 30;
float spaceBetweenImages = 30;
float canvasOffset = 5;
float imageSize = 0;
String[][] heroNamesAndYears ={{"Столетов", "Николай Григорьевич", "1831 – 1912"}, 
  {"Гурко", "Иосиф Владимирович ", "1828 – 1901"}, 
  {"Струков", "Александр Петрович", "1840 – 1911"}, 
  {"Оборона Шипки", "", ""}, 
  {"Радецкий", "Фёдор Федорович", "1820 – 1890"}, 
  {"Оборона Баязета", "", ""}, 
  {"Штоквич", "Фёдор Эдуардович", "1828 – 1896"}, 
  {"Дубасов и Шестаков", "", ""}, 
  {"Мищенко", "Павел Иванович", "1853 – 1918"}, 
  {"Самсонов", "Александр Васильевич", "1859 – 1914"}, 
  {"Оборона русскими\nвойсками крепости\nПорт-Артур", "", "13 (26) мая 1904 –\n20 декабря 1904\n(2 января 1905 г.)"}, 
  {"Путилов", "Павел Николаевич", "1854 – 1919"}};
/////////19/////////////////////////////////////////////////////////////////////////////////////


PFont dinHeader;
PFont dinHeaderSecond;
PFont dinName;
PFont nevaHeroInfo;
String name18cent = "Русско-турецкая\nвойна\n1877-1878";
String name19cent = "Русско-японская\nвойна\n1904-1905";
ArrayList<String[][]> infoAboutHeroes = new ArrayList<String[][]>();
ArrayList<PImage[]> awards = new ArrayList<PImage[]>();
ArrayList<PImage[]> imgHerousFull = new ArrayList<PImage[]>();
float lastPositionOfFirstImage = 0.0;
float lengthOfAllHeroes = 0.0;
String centName =  name18cent;
boolean pictureClicked = false;
int clickedPicture = 1000;
float lineNameX = firstColumnX+ 100;
float lineNameX2 ;
float lineNameX3;
float secondPageImageX = 20;
float secondPageTextX = 450;
float secondPageYOffset = 25;
PVector backButtonCoord;
float fullImageHight = 500;
float fullImageWidth = 400;
int backButtonWidth = 160;
int backButtonHight = 80;
float textLeadingInfo = 25.0;
PImage krest;
PImage krest2;
PFont dinCent;
float xOffsetSecondPage;
float xWidthSecondPage;
float xCut = 0.15;
float xFirstColumnSecondPage;
float secondRubrikLength = 160;
float lengthOfSecondScreen = 0;

float positionYOfFirstImageSecondPage = secondRubrikLength +3;
float lastPositionOfFirstImageSecondScreen = 0;

void setup() {
  fullScreen();
  //pixelDensity(2);
  dinHeader = createFont("DINPro-Regular.otf", 55.0, true);
  dinHeaderSecond = createFont("DINPro-Regular.otf", 30.0, true);
  dinName = createFont("DINPro-Regular.otf", 25.0, true);
  nevaHeroInfo = createFont("NevaC.otf", 22.0, true); 
  dinCent = createFont("DINPro-Regular.otf", 35.0, true);

  ///////////////////////// LOADING IMAGES ///////////////////////
  ////////////////////////////////////////////////////////////////
  krest = loadImage("krest.png");
  krest2 = loadImage("krest2.png");

  imgHerousSquare[0] = loadImage("02_stoletov.png");
  imgHerousSquare[1] = loadImage("03_gurko.png");
  imgHerousSquare[2] = loadImage("04_strukov.png");
  imgHerousSquare[3] = loadImage("05_shipka.png");
  imgHerousSquare[4] = loadImage("06_reditskyj.png");
  imgHerousSquare[5] = loadImage("07_oborona-baiazeta.png");
  imgHerousSquare[6] = loadImage("08_shtokovich.png");
  imgHerousSquare[7] = loadImage("09_dubasov-shestakov.png");
  imgHerousSquare[8] = loadImage("01_mishenko.png");
  imgHerousSquare[9] = loadImage("02_samsonov.png");
  imgHerousSquare[10] = loadImage("03_port-artur.png");
  imgHerousSquare[11] = loadImage("04_putilov.png");
  ////////////////////////////////////////////////////////////////////////////////
  imgHerousFull.add(new PImage[]{loadImage("02_stoletov1.png"), loadImage("02_stoletov2.png"), 
    loadImage("02_stoletov3.png"), loadImage("02_stoletov4.png"), loadImage("02_stoletov5.png"), loadImage("02_stoletov6.png")});
  imgHerousFull.add(new PImage[]{loadImage("03_gurko1.png"), loadImage("03_gurko2.png"), loadImage("03_gurko3.png"), 
    loadImage("03_gurko5.png"), loadImage("03_gurko6.png")});
  imgHerousFull.add(new PImage[]{loadImage("04_strukov1.png"), loadImage("04_strukov2.png")});
  imgHerousFull.add(new PImage[]{loadImage("05_shipka1.png"), loadImage("05_shipka2.png"), loadImage("05_shipka3.png")}); 
  imgHerousFull.add(new PImage[]{loadImage("06_reditskyj1.png")}); 
  imgHerousFull.add(new PImage[]{loadImage("07_oborona-baiazeta1.png")});
  imgHerousFull.add(new PImage[]{loadImage("08_shtokovich1.png"), loadImage("08_shtokovich2.png"), loadImage("08_shtokovich3.png"), 
    loadImage("08_shtokovich4.png"), loadImage("08_shtokovich5.png")});
  imgHerousFull.add(new PImage[]{loadImage("09_dubasov-shestakov1.png"), loadImage("09_dubasov-shestakov2.png"), 
    loadImage("09_dubasov-shestakov3.png")}); 

  imgHerousFull.add(new PImage[]{loadImage("01_mishenko1.png"), loadImage("01_mishenko2.png"), loadImage("01_mishenko3.png"), 
    loadImage("01_mishenko4.png"), loadImage("01_mishenko5.png")}); 
  imgHerousFull.add(new PImage[]{loadImage("02_samsonov1.png"), loadImage("02_samsonov2.png")}); 
  imgHerousFull.add(new PImage[]{loadImage("03_port-artur1.png"), loadImage("03_port-artur2.png"), loadImage("03_port-artur3.png"), 
    loadImage("03_port-artur4.png"), loadImage("03_port-artur5.png"), loadImage("03_port-artur6.png"), loadImage("03_port-artur7.png"), 
    loadImage("03_port-artur8.png"), loadImage("03_port-artur9.png"), loadImage("03_port-artur10.png"), loadImage("03_port-artur11.png"), 
    loadImage("03_port-artur13.png"), loadImage("03_port-artur14.png")}); 
  imgHerousFull.add(new PImage[]{loadImage("04_putilov1.png"), loadImage("04_putilov2.png"), loadImage("04_putilov3.png"), 
    loadImage("04_putilov4.png"), loadImage("04_putilov6.png"), loadImage("04_putilov7.png"), loadImage("04_putilov8.png"), 
    loadImage("04_putilov9.png"), loadImage("04_putilov10.png"), loadImage("04_putilov11.png")}); 

  infoAboutHeroes.add(new String[][]{loadStrings("02_stoletov1.txt"), loadStrings("02_stoletov2.txt"), loadStrings("02_stoletov3.txt"), 
    loadStrings("02_stoletov4.txt"), loadStrings("02_stoletov5.txt"), loadStrings("02_stoletov6.txt")}); 
  infoAboutHeroes.add(new String[][]{loadStrings("03_gurko1.txt"), loadStrings("03_gurko2.txt"), loadStrings("03_gurko3.txt")});
  infoAboutHeroes.add(new String[][]{loadStrings("04_strukov1.txt"), loadStrings("04_strukov2.txt")});
  infoAboutHeroes.add(new String[][]{loadStrings("05_shipka1.txt"), loadStrings("05_shipka2.txt"), loadStrings("05_shipka3.txt")});
  infoAboutHeroes.add(new String[][]{loadStrings("06_reditskyj.txt")});
  infoAboutHeroes.add(new String[][]{loadStrings("07_oborona-baiazeta.txt")});
  infoAboutHeroes.add(new String[][]{loadStrings("08_shtokovich1.txt"), loadStrings("08_shtokovich2.txt"), loadStrings("08_shtokovich3.txt"), 
    loadStrings("08_shtokovich4.txt"), loadStrings("08_shtokovich5.txt")});
  infoAboutHeroes.add(new String[][]{loadStrings("09_dubasov-shestakov.txt")});

  infoAboutHeroes.add(new String[][]{loadStrings("01_mishenko.txt")});
  infoAboutHeroes.add(new String[][]{loadStrings("02_samsonov.txt")});
  infoAboutHeroes.add(new String[][]{loadStrings("03_port-artur.txt")});
  infoAboutHeroes.add(new String[][]{loadStrings("04_putilov.txt")});

  imageSize = imgHerousSquare[0].width;
  secondColumnX = firstColumnX + spaceBetweenColumns + 2*canvasOffset +imageSize;
  thirdColumnX = firstColumnX + 2*(spaceBetweenColumns + 2*canvasOffset +imageSize);
  lineNameX2 =secondColumnX+ 100;
  lineNameX3 = thirdColumnX + 100;
  lengthOfAllHeroes = imageSize*lines + nameHight*(lines)+ 2*canvasOffset*lines + spaceBetweenImages*lines;
  lastPositionOfFirstImage = -lengthOfAllHeroes+height;

  awards.add(new PImage[]{krest, krest});
  awards.add(new PImage[]{krest, krest2});
  awards.add(new PImage[]{krest});
  awards.add(new PImage[]{});
  awards.add(new PImage[]{krest, krest, krest2}); //5
  awards.add(new PImage[]{});
  awards.add(new PImage[]{krest});
  awards.add(new PImage[]{krest});

  awards.add(new PImage[]{krest});
  awards.add(new PImage[]{krest});
  awards.add(new PImage[]{}); //10
  awards.add(new PImage[]{krest});

  xOffsetSecondPage = width*xCut;
  xWidthSecondPage = width - 2*width*xCut;
  xFirstColumnSecondPage = width*0.22;
}
void drawBackButton() {
  stroke(#986727);
  fill(#22232B);
  rect(30, height -backButtonHight -30, backButtonWidth, backButtonHight);
  stroke(#d5c2a8);
  rect(31, height -backButtonHight -30+1, backButtonWidth-2, backButtonHight-2);
  stroke(#986727);
  line(50, height -backButtonHight -30 + backButtonHight/2, 110, height -backButtonHight -30 + 10);
  line(50, height -backButtonHight -30 + backButtonHight/2, 110, height -backButtonHight -30 + 70);
  backButtonCoord = new PVector(30, height -backButtonHight -30);
}

void drawTextSecondPage(float yPos) {
  String[][] info = infoAboutHeroes.get(clickedPicture);
  PImage[] pics = imgHerousFull.get(clickedPicture);
  if (info.length != pics.length) {
    float firstYPos = yPos;

    for (PImage im : pics) {
      float proc = xFirstColumnSecondPage/im.width;
      image(im, xOffsetSecondPage, yPos, im.width*proc, im.height*proc);
      yPos += im.height*proc + 30;
    }
    yPos = firstYPos;
    for (String[] text : info) {
      float textOffset = drawInfoText(yPos, xOffsetSecondPage +xFirstColumnSecondPage + 10, xWidthSecondPage - (xFirstColumnSecondPage + 10), text);
      yPos +=  textOffset+ 30;
    }
    drawBackButton();
    return;
  }
  for (int i = 0; i < info.length; i++) {
    float proc = xFirstColumnSecondPage/pics[i].width;
    image(pics[i], xOffsetSecondPage, yPos, pics[i].width*proc, pics[i].height*proc);
    float textOffset = drawInfoText(yPos, xOffsetSecondPage +pics[i].width*proc + 10, xWidthSecondPage - (pics[i].width*proc + 10), info[i]);
    float picHeight = pics[i].height*proc;
    yPos += max(textOffset, picHeight)+30;
  }
  drawBackButton();
}

float drawInfoText(float yPos, float xOffsetForText, float widthForText, String[] info) {
  fill(#986727);
  textFont(nevaHeroInfo);
  textLeading(textLeadingInfo);
  float firstYPos = yPos;
  String text = "";
  for (String paragraph : info) {
    String[] words = paragraph.split(" ");
    for (String s : words) {
      if (textWidth(text+s)< (widthForText)) {
        text = text.concat(s+" ");
      } else {
        text = text.concat("\n");
        text(text, xOffsetForText, yPos);
        yPos +=textLeadingInfo;
        text = s+" ";
      }
    }
    text(text, xOffsetForText, yPos);
    yPos +=textLeadingInfo;
    text = "";
  }
  return yPos - firstYPos;
}
void drawHeader(float yOffset) {
  fill(#22232B);
  stroke(#22232B);
  rect(0, 0, width, secondRubrikLength);
  fill(#986727);
  textAlign(LEFT, TOP);
  textFont(dinHeaderSecond);
  text(heroNamesAndYears[clickedPicture][0], xOffsetSecondPage + xFirstColumnSecondPage, 30);
  text(heroNamesAndYears[clickedPicture][1], xOffsetSecondPage + xFirstColumnSecondPage, 70);
  fill(#666666);
  text(heroNamesAndYears[clickedPicture][2].replaceAll("\n",""), xOffsetSecondPage + xFirstColumnSecondPage, 130);
}

void draw() {
  background(#22232B);
  if (pictureClicked) {
    if (positionYOfFirstImageSecondPage > secondRubrikLength + 5) {
      positionYOfFirstImageSecondPage = secondRubrikLength +5;
    }
    if (positionYOfFirstImageSecondPage + lengthOfSecondScreen < height) {
      positionYOfFirstImageSecondPage = lastPositionOfFirstImageSecondScreen;
    }
    float yPosition = positionYOfFirstImageSecondPage;
    drawTextSecondPage(yPosition);
    drawHeader(yPosition);
    return;
  }

  if (positionYOfFirstImage > firstRubrikLength + 5) {
    positionYOfFirstImage = firstRubrikLength +5;
  }
  if (positionYOfFirstImage + lengthOfAllHeroes < height) {
    positionYOfFirstImage = lastPositionOfFirstImage;
  }

  ////////////////////////////////
  float yPosition = positionYOfFirstImage;
  int picNum = 0;
  PImage[] awardsCurr;
  float posAw = firstColumnX+5;
  float posAwSec = secondColumnX+5;
  float posAwThird = thirdColumnX+5;
  for (int i = 0; i < lines18; i++) {
    if (yPosition+imageSize + nameHight> firstRubrikLength) {
      centName =  name18cent;
    }
    pictureCordinates[picNum] = new PVector(firstColumnX, yPosition);
    stroke(#666666);
    strokeWeight(1.5);
    fill(255);
    rect(firstColumnX, yPosition, imageSize + 10, imageSize+10);
    image(imgHerousSquare[picNum], firstColumnX+5, yPosition+5, imageSize, imageSize);
    //color of the name of the herofill(#666666);  
    textFont(dinName);
    textAlign(LEFT, TOP);
    textLeading(25);
    text(heroNamesAndYears[picNum][0]+"\n", lineNameX + 10, yPosition+imageSize+spaceBetweenImages);
    fill(#666666);
    text(heroNamesAndYears[picNum][1]+"\n", lineNameX + 10, yPosition+imageSize+spaceBetweenImages + 30);
    text(heroNamesAndYears[picNum][2]+"\n", lineNameX + 10, yPosition+imageSize+spaceBetweenImages + 80);
    line(lineNameX, yPosition+imageSize+spaceBetweenImages, lineNameX, yPosition+imageSize+spaceBetweenImages + 105);
    fill(255);
    awardsCurr = awards.get(picNum);
    for (PImage aw : awardsCurr) {
      image(aw, posAw, yPosition+imageSize+spaceBetweenImages);
      posAw+= 25;
    }
    picNum++;
    posAw = firstColumnX+5;

    if (picNum<numberOf18CentHerous) {
      rect(secondColumnX, yPosition, imageSize + 10, imageSize+10);
      image(imgHerousSquare[picNum], secondColumnX+5, yPosition+5, imageSize, imageSize);
      text(heroNamesAndYears[picNum][0]+"\n", lineNameX2 + 10, yPosition+imageSize+spaceBetweenImages);
      fill(#666666);
      text(heroNamesAndYears[picNum][1]+"\n", lineNameX2 + 10, yPosition+imageSize+spaceBetweenImages + 30);
      text(heroNamesAndYears[picNum][2]+"\n", lineNameX2 + 10, yPosition+imageSize+spaceBetweenImages + 80);
      line(lineNameX2, yPosition+imageSize+spaceBetweenImages, lineNameX2, yPosition+imageSize+spaceBetweenImages + 105);
      fill(255);
      pictureCordinates[picNum] = new PVector(secondColumnX, yPosition);
      awardsCurr = awards.get(picNum);
      for (PImage aw : awardsCurr) {
        image(aw, posAwSec, yPosition+imageSize+spaceBetweenImages);
        posAwSec+= 25;
      }
      picNum++;
      //posAw = firstColumnX+5;
    }
    if (picNum<numberOf18CentHerous) {
      posAw = thirdColumnX+5;
      rect(thirdColumnX, yPosition, imageSize + 10, imageSize+10);
      image(imgHerousSquare[picNum], thirdColumnX+5, yPosition+5, imageSize, imageSize);
      text(heroNamesAndYears[picNum][0]+"\n", lineNameX3 + 10, yPosition+imageSize+spaceBetweenImages);
      fill(#666666);
      text(heroNamesAndYears[picNum][1]+"\n", lineNameX3 + 10, yPosition+imageSize+spaceBetweenImages + 30);
      text(heroNamesAndYears[picNum][2]+"\n", lineNameX3 + 10, yPosition+imageSize+spaceBetweenImages + 80);
      line(lineNameX3, yPosition+imageSize+spaceBetweenImages, lineNameX3, yPosition+imageSize+spaceBetweenImages + 105);
      fill(255);
      pictureCordinates[picNum] = new PVector(thirdColumnX, yPosition);
      awardsCurr = awards.get(picNum);
      for (PImage aw : awardsCurr) {
        image(aw, posAwThird, yPosition+imageSize+spaceBetweenImages);
        posAw+= 25;
      }
      picNum++;
      //posAw = firstColumnX+5;
    }
    
    yPosition += (imageSize + spaceBetweenImages +2*canvasOffset +nameHight);
  }
  for (int i = 0; i < lines19; i++) {
    if (picNum == numberOf18CentHerous) {
      fill(#666666);
      textFont(dinCent);
      text(name19cent, width - 300, yPosition);
    }
    if (yPosition < firstRubrikLength) {
      centName =  name19cent;
    }
    pictureCordinates[picNum] = new PVector(firstColumnX, yPosition);
    stroke(#666666);
    strokeWeight(1.5);
    fill(255);
    rect(firstColumnX, yPosition, imageSize + 10, imageSize+10);
    image(imgHerousSquare[picNum], firstColumnX+5, yPosition+5, imageSize, imageSize);
    textFont(dinName);
    textAlign(LEFT, TOP);
    textLeading(25);
    text(heroNamesAndYears[picNum][0]+"\n", lineNameX + 10, yPosition+imageSize+spaceBetweenImages);
    fill(#666666);
    text(heroNamesAndYears[picNum][1]+"\n", lineNameX + 10, yPosition+imageSize+spaceBetweenImages + 30);
    text(heroNamesAndYears[picNum][2]+"\n", lineNameX + 10, yPosition+imageSize+spaceBetweenImages + 80);
    line(lineNameX, yPosition+imageSize+spaceBetweenImages, lineNameX, yPosition+imageSize+spaceBetweenImages + 105);
    fill(255);
    awardsCurr = awards.get(picNum);
    for (PImage aw : awardsCurr) {
      image(aw, posAw, yPosition+imageSize+spaceBetweenImages);
      posAw+= 25;
    }
    picNum++;
    posAw = firstColumnX+5;
    if (picNum<availableNumberOfHerous) {
      rect(secondColumnX, yPosition, imageSize + 10, imageSize+10);
      image(imgHerousSquare[picNum], secondColumnX+5, yPosition+5, imageSize, imageSize);
      text(heroNamesAndYears[picNum][0]+"\n", lineNameX2 + 10, yPosition+imageSize+spaceBetweenImages);
      fill(#666666);
      text(heroNamesAndYears[picNum][1]+"\n", lineNameX2 + 10, yPosition+imageSize+spaceBetweenImages + 30);
      text(heroNamesAndYears[picNum][2]+"\n", lineNameX2 + 10, yPosition+imageSize+spaceBetweenImages + 80);
      line(lineNameX2, yPosition+imageSize+spaceBetweenImages, lineNameX2, yPosition+imageSize+spaceBetweenImages + 105);
      fill(255);
      pictureCordinates[picNum] = new PVector(secondColumnX, yPosition);
      awardsCurr = awards.get(picNum);
      for (PImage aw : awardsCurr) {
        image(aw, posAwSec, yPosition+imageSize+spaceBetweenImages);
        posAw+= 25;
      }
      picNum++;
      posAw = firstColumnX+5;
    }
     if (picNum<availableNumberOfHerous) {
      posAw = thirdColumnX+5;
      rect(thirdColumnX, yPosition, imageSize + 10, imageSize+10);
      image(imgHerousSquare[picNum], thirdColumnX+5, yPosition+5, imageSize, imageSize);
      text(heroNamesAndYears[picNum][0]+"\n", lineNameX3 + 10, yPosition+imageSize+spaceBetweenImages);
      fill(#666666);
      text(heroNamesAndYears[picNum][1]+"\n", lineNameX3 + 10, yPosition+imageSize+spaceBetweenImages + 30);
      text(heroNamesAndYears[picNum][2]+"\n", lineNameX3 + 10, yPosition+imageSize+spaceBetweenImages + 80);
      line(lineNameX3, yPosition+imageSize+spaceBetweenImages, lineNameX3, yPosition+imageSize+spaceBetweenImages + 105);
      fill(255);
      pictureCordinates[picNum] = new PVector(thirdColumnX, yPosition);
      awardsCurr = awards.get(picNum);
      for (PImage aw : awardsCurr) {
        image(aw, posAwThird, yPosition+imageSize+spaceBetweenImages);
        posAw+= 25;
      }
      picNum++;
      //posAw = firstColumnX+5;
    }
    yPosition += (imageSize + spaceBetweenImages +2*canvasOffset +nameHight);
  }
  fill(#22232B);
  stroke(#22232B);
  rect(0, 0, width, firstRubrikLength);
  fill(#986727);
  textFont(dinHeader);
  textAlign(LEFT, CENTER);
  text("Русско-японская и русско-турецкая войны", 15, 30);

  fill(#666666);
  textFont(dinCent);
  text(centName, width - 300, firstRubrikLength + 65);
  fill(255);
}

float calculateSecondScreenLength() {
  float offset = 0;
  String[][] info = infoAboutHeroes.get(clickedPicture);
  PImage[] pics = imgHerousFull.get(clickedPicture);
  if (info.length != pics.length) {
    float imLength = 0;
    for (PImage i : pics) {
      float proc = xFirstColumnSecondPage/i.width;
      imLength += i.height*proc + 30;
    }
    float textLength = 0;
    for (String[] text : info) {
      textLength += getTextOffset(xWidthSecondPage - (xFirstColumnSecondPage + 10), text);
    }
    return max(imLength, textLength+30);
  }
  for (int i = 0; i < info.length; i++) {
    float proc = xFirstColumnSecondPage/pics[i].width;
    offset += max(getTextOffset(xWidthSecondPage - (pics[i].width*proc + 10), info[i]), pics[i].height*proc)+30;
  }
  return offset;
}
float getTextOffset(float widthForText, String[] info) {
  textFont(nevaHeroInfo);
  textLeading(textLeadingInfo);
  float yPos = 0;
  String text = "";
  for (String paragraph : info) {
    String[] words = paragraph.split(" ");
    for (String s : words) {
      if (textWidth(text+s)< (widthForText)) {
        text = text.concat(s+" ");
      } else {
        yPos +=textLeadingInfo;
        text = s+" ";
      }
    }
    yPos +=textLeadingInfo;
    text = "";
  }
  return yPos;
}

void mousePressed() {
  println("----------------MOUSE PRESSED--------------------");
  if (!pictureClicked) {
    yOffsetForFirst = mouseY-positionYOfFirstImage;
  } else {
    yOffsetForFirst = mouseY-positionYOfFirstImageSecondPage;
  }
}

void mouseDragged() {
  println("----------------MOUSE DRAGGED--------------------");
  if (!pictureClicked) {
    positionYOfFirstImage = mouseY - yOffsetForFirst;
  } else {
    positionYOfFirstImageSecondPage = mouseY - yOffsetForFirst;
  }
}

void mouseClicked() {
  if (pictureClicked) {
    if (mouseX > backButtonCoord.x && mouseX < backButtonCoord.x+backButtonWidth && mouseY > backButtonCoord.y && mouseY < backButtonCoord.y+backButtonHight) {
      pictureClicked = false;
      clickedPicture = 1000;
      positionYOfFirstImageSecondPage = secondRubrikLength +3;
      return;
    }
  }
  for (int x = 0; x < availableNumberOfHerous; x++) {
    if (mouseX>pictureCordinates[x].x 
      && mouseX < (pictureCordinates[x].x + imageSize) 
      && mouseY > pictureCordinates[x].y 
      && mouseY < (pictureCordinates[x].y + imageSize)) {
      clickedPicture = x;
      pictureClicked = true;
      lengthOfSecondScreen = calculateSecondScreenLength();
      if (lengthOfSecondScreen < height - secondRubrikLength) {
        lengthOfSecondScreen = height - secondRubrikLength;
      }
      lastPositionOfFirstImageSecondScreen = -lengthOfSecondScreen + height;
      return;
    }
  }
}

void drawInfoText(float yPos, String[] info) {
  fill(#986727);
  textFont(nevaHeroInfo);
  textLeading(textLeadingInfo);
  String text = "";
  for (String paragraph : info) {
    String[] words = paragraph.split(" ");
    for (String s : words) {
      if (textWidth(text+s)< (width - secondPageTextX - 50)) {
        text = text.concat(s+" ");
      } else {
        text = text.concat("\n");
        text(text, secondPageTextX, yPos);
        yPos +=textLeadingInfo;
        text = s+" ";
      }
    }
    text(text, secondPageTextX, yPos);
    yPos +=textLeadingInfo;
    text = "";
  }
}