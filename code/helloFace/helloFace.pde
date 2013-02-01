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


//for view panel
int viewPanelWidth = 400;
int viewPanelHeight = 300;

//for setting panel
SettingPanel settingPanel = null;
int settingPanelWidth = 400;

//for camera
Capture cam = null;
CamProperties camProperties = null;

//for detector
Detector detector = null;

//for garbage collector
GarbageCollector gc = null;
float gcPeriodMinute = 5;    //設定幾分鐘做一次gc





void setup() {
    size(viewPanelWidth, viewPanelHeight);
    background(0);
    frame.setResizable(true);    //make frame is resizable
    
    //for camera properties
    camProperties = new CamProperties();

    //for setting panel
    settingPanel = new SettingPanel(this, settingPanelWidth);
    
//    String[] cams = camProperties.getAvailableList();
//    if(cams != null){
//        camProperties.setCamera(cams[0]);
//        cam = new Capture(this, camProperties.getSelectedCamera());
//        cam.start();
//        
//        //for detector
//        detector = new Detector(camProperties.getCamWidth(), camProperties.getCamHeight());
//    }

    //for garbage collector
    gc = new GarbageCollector(gcPeriodMinute);
    gc.start();
}


void draw() {
    background(0);

    if (cam!=null && cam.available()) {
        cam.read();
    }

    if(detector != null){
        showImage(detector.doDetect(cam));
    }else{
        showImage(cam);
    }
}


void showImage(PImage img){
    if(img != null){
        //this way has a bug in Processing2.0b7
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
    if(key=='s' || key=='S'){
        if(settingPanel != null)    settingPanel.switchOnOff();
    }
}
