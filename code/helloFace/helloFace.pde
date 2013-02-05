/***********************
 helloFace
 =======
 helloFace is a face-detection tool which aims on simple setting and easy using.
 
 Functions:
 ---------------
 * using OSC to send out the result of face-detection
 * also receive OSC message for dynamic settings
 * providing GUI for simple setting and easy using
 
 Instruction:
 ----------------
 * 按s/S鍵, 可以switch on/off 設定面板
 * 按i/I鍵, 可以switch on/off 資訊面板
 * 按v/V, 可以switch on/off 偵測到的視覺資訊
 
 
 Used libraries:
 ---------------------
 * Processing Video library (version: 2.0b7)
 * oscP5 (version: 0.9.8)
 * controlP5 (version: 2.0.4)
 * javacvPro (version: 0.5)
 
 
 Author: 
 -----------
 Shen, Sheng-Po (http://shengpo.github.com)
 
 License: 
 ------------
 CC BY-SA 3.0
 
 ***********************/

import processing.video.*;
import monclubelec.javacvPro.*;
import controlP5.*;
import oscP5.*;
import netP5.*;
import java.awt.*;


//for view panel
int viewPanelWidth = 400;
int viewPanelHeight = 300;

//for setting panel
SettingPanel settingPanel = null;
int settingPanelWidth = 400;

//for info panel
InfoPanel infoPanel = null;

//for camera
Capture cam = null;
CamProperties camProperties = null;

//for detector
Detector detector = null;

//for OSC handler
OSCHandler oscHandler = null;

//for font (used in InfoPanel, SettingPanel)
PFont infoFont = null;
int fontSize = 12;

//for garbage collector
GarbageCollector gc = null;
float gcPeriodMinute = 5;    //設定幾分鐘做一次gc





void setup() {
    size(viewPanelWidth, viewPanelHeight);
    background(0);
    frame.setResizable(true);    //make frame is resizable
    
    //set universal font in this application
    infoFont = createFont("Georgia", fontSize);
    textFont(infoFont);
    
    //for camera properties
    camProperties = new CamProperties();

    //for setting panel
    settingPanel = new SettingPanel(this, settingPanelWidth);
    
    //for info panel
    infoPanel = new InfoPanel(viewPanelWidth);

    //for garbage collector
    gc = new GarbageCollector(gcPeriodMinute);
    gc.start();
}


void draw() {
    background(0);

    //read-in camera video
    if (cam!=null && cam.available()) {
        cam.read();
    }

    //do detecting
    if(detector != null){
        //將detect的結果秀出來
        showImage(detector.doDetect(cam));
    }else{
        //直接秀camera影像，不做detect
        showImage(cam);
    }
    
    //show verbose info
    infoPanel.show();
}


void showImage(PImage img){
    if(img != null){
        //resize() has a bug in Processing2.0b7
        //img.resize(viewPanelWidth, 0); 
        //image(img, 0, (viewPanelHeight-img.height)/2);
        
        float w = viewPanelWidth;
        float h = img.height*(viewPanelWidth/float(img.width));
        float x = 0;
        float y = (viewPanelHeight-h)/2;
        
        image(img, x, y, w, h);
    }
}


void keyPressed(){
    //switch on/off setting panel
    if(key=='s' || key=='S'){
        if(settingPanel != null)    settingPanel.switchOnOff();
    }

    //switch on/off info panel
    if(key=='i' || key=='I'){
        if(infoPanel != null)    infoPanel.switchOnOff();
    }

    //switch on/off detecting-visual-info    
    if(key=='v' || key=='V'){
        if(detector != null)    detector.switchOnOffVisualInfo();
    }
}
