import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer BGM;

int mode = 0;
int money = 1000;
int turtleX, turtleY;

int buttonWidth, buttonHeight;

String userInput = "";
PImage turtleImg;
PImage turtleButtonImg;
PImage turtleImgAlt;
PImage turtleTitleScreen;
PImage turtleTitle;

ArrayList <turtle> turtle;

void setup() {
  size(700,700);
  
  turtle = new ArrayList <turtle> ();
  
  turtleImg = loadImage("turtle.png");
  turtleImgAlt = loadImage("turtlealt.png");
  turtleImgAlt.resize(60,60);
  turtleImg.resize(60, 60);
  turtleX = 50;
  turtleY = 650;
  
  turtleButtonImg = loadImage("turtle.png");
  buttonWidth = 50;
  buttonHeight = 50;
  
  minim = new Minim(this);
  BGM = minim.loadFile("track4.mp3");
}

void draw() {
  background(255);
  drawStartLine();
  drawFinishLine();
  
  if (mode == 0) {
    textSize(48);
    fill(1, 52, 131);
    text("Turtle Racing", 185, 300);
    
    textSize(16);
    fill(55, 3, 100);
    text("Version 1.0.2", 5, 675);
    
    
    drawStartButton();
    BGM.pause();
    
    turtleTitleScreen = loadImage("turtle.png");
    imageMode(CENTER);
    turtleTitleScreen.resize(80, 80);
    image(turtleTitleScreen, 125, 245);
    image(turtleTitleScreen, 500, 105);
    image(turtleTitleScreen, 350, 550);
    
    turtleTitle = loadImage("emoji.png");
    imageMode(CENTER);
    turtleTitle.resize(80, 80);
    image(turtleTitle, 500, 275);
  }
  else if (mode == 1) {
    textSize(36);
    fill(111, 6, 157);
    text("Place Bet Here:", 225, 300);
    drawButtons();
    drawInputBox();
    BGM.play();
  }
  else if (mode == 2) {
    drawTurtle();
    moveTurtles();
  }
  
  fill(6,45,157);
  textSize(16);
  text("Money: " + money + " Coins", 25, 25);
  text("Press r to reset race", 550, 25);
  
  checkForFinish();
  
  if (money <= 0) {
    textSize(48);
    text("GAME OVER", 225, 300);
    BGM.pause();
    noLoop();
  }
  
  if (!BGM.isPlaying()) {
    BGM.rewind();
    BGM.play();
  }
}

void drawStartLine() {
  stroke(213, 232, 14);
  strokeWeight(3);
  line(0, 650, 700, 650);
}

void drawFinishLine() {
  stroke(42, 232, 14);
  strokeWeight(3);
  line(0, 50, 700, 50);
}

void drawTurtle() {
  for (int i =0; i<turtle.size(); i++) {
    turtle.get(i).drawTurtle();
  }
}

void checkForFinish() {
  for (int i=0; i<turtle.size(); i++) {
    turtle a = turtle.get(i);
    if (turtleY <= 45) {
      turtle.remove(a);
      money+= Integer.valueOf(userInput) * 1.25;
    }
  }
}

void moveTurtles() {
  for(int i = 0; i<turtle.size(); i++) {
    turtle a = turtle.get(i);
    if (a.move()== false) {
      turtle.remove(i);
    }
  }
}

void drawButtons() {
  noStroke();
  
  //Draw Button 1 for Turtle 1
  fill(232,225,225);
  rect(75, 315, buttonWidth, buttonHeight);
  textSize(16);
  fill(0);
  text("1", 75, 325);
  turtleButtonImg = loadImage("turtle.png");
  turtleButtonImg.resize(40, 40);
  image(turtleButtonImg, buttonWidth+50, buttonHeight+290);
  imageMode(CENTER);
  
  //Draw Button 2 for Turtle 2
  fill(232,225,225);
  rect(175, 315, buttonWidth, buttonHeight);
  textSize(16);
  fill(0);
  text("2", 175, 325);
  turtleButtonImg = loadImage("turtle.png");
  turtleButtonImg.resize(40, 40);
  image(turtleButtonImg, buttonWidth+150, buttonHeight+290);
  imageMode(CENTER);
  
  //Draw Button 3 for Turtle 3
  fill(232,225,225);
  rect(275, 315, buttonWidth, buttonHeight);
  textSize(16);
  fill(0);
  text("3", 275, 325);
  turtleButtonImg = loadImage("turtle.png");
  turtleButtonImg.resize(40, 40);
  image(turtleButtonImg, buttonWidth+250, buttonHeight+290);
  imageMode(CENTER);
  
  //Draw Button 4 for Turtle 4
  fill(232,225,225);
  rect(375, 315, buttonWidth, buttonHeight);
  textSize(16);
  fill(0);
  text("4", 375, 325);
  turtleButtonImg = loadImage("turtle.png");
  turtleButtonImg.resize(40, 40);
  image(turtleButtonImg, buttonWidth+350, buttonHeight+290);
  imageMode(CENTER);
  
  //Draw Button 5 for Turtle 5
  fill(232,225,225);
  rect(475, 315, buttonWidth, buttonHeight);
  textSize(16);
  fill(0);
  text("5", 475, 325);
  turtleButtonImg = loadImage("turtle.png");
  turtleButtonImg.resize(40, 40);
  image(turtleButtonImg, buttonWidth+450, buttonHeight+290);
  imageMode(CENTER);
  
  //Draw Button 6 for Turtle 6
  fill(232,225,225);
  rect(575, 315, buttonWidth, buttonHeight);
  textSize(16);
  fill(0);
  text("6", 575, 325);
  turtleButtonImg = loadImage("turtle.png");
  turtleButtonImg.resize(40, 40);
  image(turtleButtonImg, buttonWidth+550, buttonHeight+290);
  imageMode(CENTER);
  
}

void drawStartButton() {
  fill(232,225,225);
  stroke(255);
  rect(275, 315, buttonWidth + 75, buttonHeight);
  textSize(24);
  fill(0);
  text("Play Game", 285, 345);
}

void drawInputBox() {
  fill(255);
    stroke(0);
    strokeWeight(1);
    rect(200, 375, 275, 50);
    fill(0);
    textSize(48);
    text(userInput, 215, 415);
}

void mousePressed(){
  //check for button clicks
  if (mode == 1) {
    if (mouseX > 75 && mouseX < 75+buttonWidth && mouseY > 325 && mouseY < 375) {
      mode = 2;
      println("you selected turtle 1");
      turtle.add(new turtle(turtleX, turtleY, (int)random(-9, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 100, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 200, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 300, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 400, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 500, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      money-=Integer.valueOf(userInput);
    }
    else if (mouseX > 175 && mouseX < 175+buttonWidth && mouseY > 325 && mouseY < 375) {
      mode = 2;
      println("you selected turtle 2");
      turtle.add(new turtle(turtleX, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 100, turtleY, (int)random(-9, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 200, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 300, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 400, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 500, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      money-=Integer.valueOf(userInput);
    }
    else if (mouseX > 275 && mouseX < 275+buttonWidth && mouseY > 325 && mouseY < 375) {
      mode = 2;
      println("you selected turtle 3");
      turtle.add(new turtle(turtleX, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 100, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 200, turtleY, (int)random(-9, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 300, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 400, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 500, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      money-=Integer.valueOf(userInput);
    }
    else if (mouseX > 375 && mouseX < 375+buttonWidth && mouseY > 325 && mouseY < 375) {
      mode = 2;
      println("you selected turtle 4");
      turtle.add(new turtle(turtleX, turtleY, (int)random(-7, -1), (int)random(0,2)));
      turtle.add(new turtle(turtleX + 100, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 200, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 300, turtleY, (int)random(-9, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 400, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 500, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      money-=Integer.valueOf(userInput);
    }
    else if (mouseX > 475 && mouseX < 475+buttonWidth && mouseY > 325 && mouseY < 375) {
      mode = 2;
      println("you selected turtle 5");
      turtle.add(new turtle(turtleX, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 100, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 200, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 300, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 400, turtleY, (int)random(-9, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 500, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      money-=Integer.valueOf(userInput);
    }
    else if (mouseX > 575 && mouseX < 575+buttonWidth && mouseY > 325 && mouseY < 375) {
      mode = 2;
      println("you selected turtle 6");
      turtle.add(new turtle(turtleX, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 100, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 200, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 300, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 400, turtleY, (int)random(-7, -1), (int)random(0, 2)));
      turtle.add(new turtle(turtleX + 500, turtleY, (int)random(-9, -1), (int)random(0, 2)));
      money-=Integer.valueOf(userInput);
    }
  }
  else if (mode == 0) {
    if (mouseX > 275 && mouseX < 275+buttonWidth+75 && mouseY > 315 && mouseY < 365) {
      mode = 1;
    }
  }
}

void keyPressed() {
  if (key == 'r') {
    mode = 1;
    for(int i = 0; i<turtle.size(); i++) {
      turtle a = turtle.get(i);
      turtle.remove(i);
    }
  }
  else if (key == BACKSPACE || key == DELETE) {
    if (!userInput.equals("")) {
      userInput = userInput.substring(0, userInput.length()-1);
    }
  }
  else if (key == '1'){
    userInput = userInput + "1";
  }
  else if (key == '2'){
    userInput = userInput + "2";
  }
  else if (key == '3'){
    userInput = userInput + "3";
  }
  else if (key == '4'){
    userInput = userInput + "4";
  }
  else if (key == '5'){
    userInput = userInput + "5";
  }
  else if (key == '6'){
    userInput = userInput + "6";
  }
  else if (key == '7'){
    userInput = userInput + "7";
  }
  else if (key == '8'){
    userInput = userInput + "8";
  }
  else if (key == '9'){
    userInput = userInput + "9";
  }
  else if (key == '0'){
    userInput = userInput + "0";
  }
}
