int availableNumberOfHerous = 3; //<>//
String[][] heroNamesAndYears = {{"Иван Никитич", "1782 – 1849"}, 
  {"Дмитрий Иванович", "1821 – 1879"}, 
  {"Михаил Дмитриевич", "1843 – 1882"}};
String surname = "Скобелев";
String header1 = "Династия Скобелевых";
String header2 = "Век на службе империи";
boolean pictureClicked = false;
int clickedPicture = 1000;
int firstHeaderOffset = 70;
PFont dinHeader;
PFont dinHeaderSecond;
PFont dinName;
PFont nevaHeroInfo;
PImage krest12;
PImage krest34;
ArrayList<String[][]> infoAboutHeroes = new ArrayList<String[][]>();
ArrayList<PImage[]> awards = new ArrayList<PImage[]>();
PImage[] imgHerousSquare = new PImage[availableNumberOfHerous];
ArrayList<PImage[]> imgHerousFull = new ArrayList<PImage[]>();
float awardSecondPageYOffset = 50;

float[] pictureCordinates = new float[availableNumberOfHerous];
PImage synHist;
String[] synHistText;
float xOffset;
float betweenImages = 40;
float imageSquareSize = 350;
float imageFullWidth = 400;
float imageFullHeight = 600;
float imageSquareYOffset = 300;
float secondPageImageX = 20;
float secondPageTextX = 450;
float secondPageYOffset = 25;
PVector backButtonCoord;
int backButtonWidth = 160;
int backButtonHight = 80;
float textLeadingInfo = 25.0;
float lengthOfSecondScreen = 0;
float lastPositionOfFirstImageSecondScreen = 0;
float xOffsetSecondPage;
float xWidthSecondPage;
float xCut = 0.15;
float xFirstColumnSecondPage;
float secondRubrikLength = 140;
float positionYOfFirstImageSecondPage = secondRubrikLength +3;
float yOffset = 0.0;


void setup() {
  fullScreen();
  //pixelDensity(2);
  dinHeader = createFont("DINPro-Regular.otf", 32.0, true);
  dinHeaderSecond = createFont("DINPro-Regular.otf", 32.0, true);
  dinName = createFont("DINPro-Regular.otf", 25.0, true);
  nevaHeroInfo = createFont("NevaC.otf", 20.0, true);
  ///////////////////////////////////////////////////////////////
  krest12 = loadImage("krest12.png");
  krest34 = loadImage("krest34.png");
  ///////////////////////////////////////////////////////////////
  imgHerousSquare[0] = loadImage("01.1_menu.png");
  imgHerousSquare[1] = loadImage("02.1_menu.png");
  imgHerousSquare[2] = loadImage("03.1_menu.png");
  ///////////////////////////////////////////////////////////////
  imgHerousFull.add(new PImage[]{loadImage("01.2_v-text.png")});
  imgHerousFull.add(new PImage[]{loadImage("02.2_v-text.png"), loadImage("01.png"), loadImage("02.png"), loadImage("03.png")});
  imgHerousFull.add(new PImage[]{loadImage("03.2_v-text.png"), loadImage("03.3_v-text.png")});
  ///////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////
  infoAboutHeroes.add(new String[][]{loadStrings("ded.txt")});
  infoAboutHeroes.add(new String[][]{loadStrings("otets_text.txt"), loadStrings("otets_text2.txt"),loadStrings("otets_text3.txt"),
  loadStrings("otets_text4.txt")});
  infoAboutHeroes.add(new String[][]{loadStrings("syn_text.txt"), loadStrings("syn_hist.txt")});

  awards.add(new PImage[]{krest34, krest34});
  awards.add(new PImage[]{krest34, krest34});
  awards.add(new PImage[]{krest34, krest34, krest12});
  xOffset = width/2 - 1.5*imageSquareSize-betweenImages;
  xOffsetSecondPage = width*xCut;
  xWidthSecondPage = width - 2*width*xCut;
  xFirstColumnSecondPage = width*0.22;
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
  fill(0);
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
void drawBackButton() {
  stroke(#986727);
  fill(255);
  rect(30, height -backButtonHight -30, backButtonWidth, backButtonHight);
  stroke(#d5c2a8);
  rect(31, height -backButtonHight -30+1, backButtonWidth-2, backButtonHight-2);
  stroke(#986727);
  line(50, height -backButtonHight -30 + backButtonHight/2, 110, height -backButtonHight -30 + 10);
  line(50, height -backButtonHight -30 + backButtonHight/2, 110, height -backButtonHight -30 + 70);
  backButtonCoord = new PVector(30, height -backButtonHight -30);
}
void drawHeader(float yOffset) {
  fill(255);
  stroke(255);
  rect(0, 0, width, secondRubrikLength);
  fill(0);
  textFont(dinName);
  textAlign(LEFT, CENTER);
  text(header1+"\n"+header2, xOffsetSecondPage, 50);

  PImage[] awardsCurr = awards.get(clickedPicture);
  float posAw =  xOffsetSecondPage + xWidthSecondPage -(awardsCurr.length*awardsCurr[0].width+(awardsCurr.length-1)*5);// currXOffset + imageSquareSize - (awardsCurr.length*awardsCurr[0].width+(awardsCurr.length-1)*5);
  for (PImage aw : awardsCurr) {
    image(aw, posAw, 
      awardSecondPageYOffset);
    posAw+= 25;
  }

  fill(#986727);
  textFont(dinHeaderSecond);
  textAlign(LEFT, TOP);
  text(surname+"\n"+heroNamesAndYears[clickedPicture][0], xOffsetSecondPage +xFirstColumnSecondPage + 10, secondPageYOffset);
  fill(#666666);
  text(heroNamesAndYears[clickedPicture][1], xOffsetSecondPage +xFirstColumnSecondPage + 10, secondPageYOffset + 75);
}
void draw() {
  background(255);
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
  fill(0);
  textFont(dinHeader);
  textAlign(LEFT, CENTER);
  float currXOffset = xOffset;
  text(header1+"\n"+header2, xOffset, 100);
  PImage[] awardsCurr;
  for (int i=0; i < availableNumberOfHerous; i++) {
    awardsCurr = awards.get(i);
    float posAw = currXOffset + imageSquareSize - (awardsCurr.length*awardsCurr[0].width+(awardsCurr.length-1)*5);

    for (PImage aw : awardsCurr) {
      image(aw, posAw, 
        imageSquareYOffset - 30);
      posAw+= 25;
    }
    image(imgHerousSquare[i], currXOffset, imageSquareYOffset, imageSquareSize, imageSquareSize);
    pictureCordinates[i] = currXOffset;

    fill(#986727);
    textFont(dinName);
    textAlign(LEFT, TOP);
    textLeading(25);
    text(surname+"\n"+heroNamesAndYears[i][0], currXOffset, imageSquareYOffset+imageSquareSize+20);
    fill(0);
    text(heroNamesAndYears[i][1]+"\n", currXOffset, imageSquareYOffset+imageSquareSize+80);

    currXOffset += betweenImages+imageSquareSize;
  }
}
void mousePressed() {
  println("----------------MOUSE PRESSED--------------------");
  if (pictureClicked) {
    yOffset = mouseY-positionYOfFirstImageSecondPage;
  }
}

void mouseDragged() {
  println("----------------MOUSE DRAGGED--------------------");
  if (pictureClicked) {
    positionYOfFirstImageSecondPage = mouseY - yOffset;
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
    if (mouseX>pictureCordinates[x]
      && mouseX < (pictureCordinates[x] + imageSquareSize) 
      && mouseY > imageSquareYOffset
      && mouseY < (imageSquareYOffset + imageSquareSize)) {
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
//void drawInfoText(float yPos) {
//  fill(0);
//  textFont(nevaHeroInfo);
//  textLeading(textLeadingInfo);
//  String[] info = infoAboutHeroes.get(clickedPicture);
//  String text = "";
//  for (String paragraph : info) {
//    String[] words = paragraph.split(" ");
//    for (String s : words) {
//      if (textWidth(text+s)< (width - secondPageTextX - 50)) {
//        text = text.concat(s+" ");
//      } else {
//        text = text.concat("\n");
//        text(text, secondPageTextX, yPos);
//        yPos +=textLeadingInfo;
//        text = s+" ";
//      }
//    }
//    text(text, secondPageTextX, yPos);
//    yPos +=textLeadingInfo;
//    text = "";
//  }
//}

//void drawInfoText(float yPos, String[] info, float xOffset) {
//  fill(0);
//  textFont(nevaHeroInfo);
//  textLeading(textLeadingInfo);
//  String text = "";
//  for (String paragraph : info) {
//    String[] words = paragraph.split(" ");
//    for (String s : words) {
//      if (textWidth(text+s)< (width - xOffset - 50)) {
//        text = text.concat(s+" ");
//      } else {
//        text = text.concat("\n");
//        text(text, secondPageTextX, yPos);
//        yPos +=textLeadingInfo;
//        text = s+" ";
//      }
//    }
//    text(text, secondPageTextX, yPos);
//    yPos +=textLeadingInfo;
//    text = "";
//  }
//}
//void drawInfoText(float yPos, String[] info, float xOffset, float widthMax) {
//  fill(0);
//  textFont(nevaHeroInfo);
//  textLeading(textLeadingInfo);
//  String text = "";
//  for (String paragraph : info) {
//    String[] words = paragraph.split(" ");
//    for (String s : words) {
//      if (textWidth(text+s)< (widthMax)) {
//        text = text.concat(s+" ");
//      } else {
//        text = text.concat("\n");
//        text(text, xOffset, yPos);
//        yPos +=textLeadingInfo;
//        text = s+" ";
//      }
//    }
//    text(text, xOffset, yPos);
//    yPos +=textLeadingInfo;
//    text = "";
//  }
//}