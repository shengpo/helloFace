/***********************
 helloFaceClientSimple
 ================
 helloFaceClientSimple is a simple helloFace client example 
 which show how to receive OSC message (/faceDetect ) from helloFace
 
 
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
ArrayList<Circle> circleList;


void setup() {
    size(640, 480);    //depended on your camera resolution setting in helloFace app
    //size(400, 200);    //of course, you can use any size you want if you don't mind about the correct ratio between this example and helloFace camera resolution

    circleList = new ArrayList<Circle>();

    oscP5 = new OscP5(this, 12001);    //this port setting must be related to hellFace's OSC settings
    oscP5.plug(this, "faceDetect", "/faceDetect");
}


void draw() {
    background(0);
    
    for(int i=circleList.size()-1; i>=0; i--){
        if(circleList.get(i).isDead()){
            circleList.remove(i);
        }else{
            circleList.get(i).update();
            circleList.get(i).show();
        }
    }
}

public void faceDetect(int count, String list) {
    println("face count: " + count);
    println("face list: " + list);
    
    String[] faces = split(list, "|");    //get each face range
    for(int i=0; i<faces.length; i++){
        String[] params = split(faces[i], ",");    //get every params in face range
        float x = 0;
        float y = 0;
        float w = 0;
        float h = 0;

        for(int a=0; a<params.length; a++){
            if(params[a].startsWith("x=")){
                x = float(params[a].substring(2));    //get substring after "x="
            }
            if(params[a].startsWith("y=")){
                y = float(params[a].substring(2));    //get substring after "y="
            }
            if(params[a].startsWith("w=")){
                w = float(params[a].substring(2));    //get substring after "w="
            }
            if(params[a].startsWith("h=")){
                h = float(params[a].substring(2));    //get substring after "h="
            }
        }
        
        circleList.add(new Circle(x*width, y*height, (w*width+h*height)/2));    //map to this sketch's size
    }
}
