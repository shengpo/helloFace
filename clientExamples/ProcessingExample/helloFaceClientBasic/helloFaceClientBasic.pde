/***********************
 helloFaceClientBasic
 ================
 helloFaceClientBasic is used for basic OSC messages demonstration between this lient sketch and helloFace
 
 
 Development Environment:
 --------------------------------------
 Processing 2.0b7
 
 Author: 
 -----------
 Shen, Sheng-Po (http://shengpo.github.com)
 
 License: 
 ------------
 CC BY-SA 3.0
 
 ***********************/

import oscP5.*;
import netP5.*;


OscP5 oscP5;
NetAddress myRemoteLocation;



void setup() {
    size(200, 200);

    oscP5 = new OscP5(this, 12001);    //this port parameter must be related to hellFace's OSC settings
    //assume this example and helloFace app are located at the same PC
    myRemoteLocation = new NetAddress("127.0.0.1", 12000);    //this address and port parameters must be related to hellFace's OSC settings

    //receive OSC messages from helloFace
    oscP5.plug(this, "faceDetect", "/faceDetect");
    oscP5.plug(this, "returnCamRes", "/returnCamRes");
    oscP5.plug(this, "returnCamFps", "/returnCamFps");
}


void draw() {
    background(0);
}


public void faceDetect(int count, String facelist) {
    println("received a message /faceDetect");
    println("face count: " + count);
    println("face list: " + facelist);
}

public void returnCamRes(int w, int h) {
    println("received a message /returnCamRes");
    println("camera width: " + w);
    println("camera height: " + h);
}

public void returnCamFps(int fps) {
    println("received a message /returnCamFps");
    println("camera fps: " + fps);
}


void mousePressed() {
    //query camera resolution
    OscMessage myMessage1 = new OscMessage("/queryCamRes");
    oscP5.send(myMessage1, myRemoteLocation);

    //query camera fps
    OscMessage myMessage2 = new OscMessage("/queryCamFps");
    oscP5.send(myMessage2, myRemoteLocation);
}
