//for any controller event of controlP5

void controlEvent(ControlEvent theEvent) {
    if (theEvent.isGroup()) {
        // check if the Event was triggered from a ControlGroup
        println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());

        //DropdownList: cameraDropdownList
        if(theEvent.getName().equals("cameraDropdownList")){
            String[] camlist = camProperties.getAvailableList();
            if(camlist != null){
                if(cam != null)    cam.stop();    //先停止之前選擇的camera
                camProperties.setCamera(camlist[(int)theEvent.getValue()]);    //設定目前選的camera parameters (紀錄parameter中的各個項目)
                cam = new Capture(this, camProperties.getSelectedCamera());    //產生新的camera
                cam.start();    //啟動
                println("[INFO] camera initialized !");
                
                //for detector
                detector = null;    //清除之前的detector
                detector = new Detector(this, camProperties.getCamWidth(), camProperties.getCamHeight(), detector.FACEDETECTION);    //設定做face detection
                println("[INFO] detector initialized !");
            }
        }
    } else if (theEvent.isController()) {
        println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
        
        //Bang: connectBang
        if(theEvent.getName().equals("connectBang")){
            int localOscPort = int(settingPanel.getControlP5().get(Textfield.class, "localOscPortTextfield").getText());
            String remoteAddress = settingPanel.getControlP5().get(Textfield.class, "remoteAddressTextfield").getText();
            int remoteOscPort =  int(settingPanel.getControlP5().get(Textfield.class, "remoteOscPortTextfield").getText());
            
            println("[INO] localOscPort: "+localOscPort);
            println("[INO] remoteAddress: "+remoteAddress);
            println("[INO] remoteOscPort: "+remoteOscPort);
            
            if(localOscPort>0 && !remoteAddress.equals("") && remoteOscPort>0){
                //for OSC handler
                if(oscHandler != null){    //清除之前的oscHandler
                    oscHandler.stop();
                    oscHandler = null;    
                }
                oscHandler = new OSCHandler(this, localOscPort, remoteAddress, remoteOscPort);
                println("[INFO]  OSC Handler is intialized !");
                
                //set osc connection info
                settingPanel.getControlP5().get(Textfield.class, "oscConnectionInfoTextfield").setCaptionLabel("OSC    connection    OK");
            }else{
                println("[INFO]  OSC related parameters could be wrong, please check it again");
                //set osc connection info
                settingPanel.getControlP5().get(Textfield.class, "oscConnectionInfoTextfield").setCaptionLabel("OSC    paramteres    could    be    wrong,    please    check");
            }
        }
    }
}

