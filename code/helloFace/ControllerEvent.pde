//for any controller event of controlP5
/*for controller event test
void controlEvent(ControlEvent theEvent) {
    if (theEvent.isGroup()) {
        // check if the Event was triggered from a ControlGroup
        println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
    } else if (theEvent.isController()) {
        println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
    }
}
*/

void controlEvent(ControlEvent theEvent) {
    //Toggle: setAsDefaultToggle
    if(theEvent.getName().equals("setAsDefaultToggle")){
        boolean isSetAsDefault = false;
        isSetAsDefault = boolean(int(theEvent.getController().getValue()));

        //儲存目前設定值
        if(isSetAsDefault){
            if(initializer.isDone()){    //initializer運作完後，之後更該的設定才做snapshot
                //save snapshot of controllers as default settings
                settingPanel.getControlP5().getProperties().setSnapshot("settings");    //將目前的controllers' properties存到RAM中
                settingPanel.getControlP5().getProperties().saveSnapshotAs(dataPath("defaultSettings"), "settings");    //將RAM中記憶的controllers' properties存到檔案中(settings.ser檔)
                
                //for hack (解決connectToggle比OSc-related TextField載入快速的問題(導致無法順利建立OSC connection))
                if(settingPanel.getControlP5().get(Toggle.class, "connectToggle").getState() == true){
                    String[] state = {"1"};
                    saveStrings(dataPath("")+"/connectToggleState.hack", state);
                }else{
                    String[] state = {"0"};
                    saveStrings(dataPath("")+"/connectToggleState.hack", state);
                }
                
                println("[INFO] current controllers' state are used as default settings");

                //change deleteDefaultSettingFileBang caption label
                settingPanel.getControlP5().get(Bang.class, "deleteDefaultSettingFileBang").setCaptionLabel("Delete    Default    Setting    Files");
            }
        }
    }
    
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
            
            //只要更動過，就將setAsDefaultToggle設成false
            if(initializer.isDone()){
                settingPanel.getControlP5().get(Toggle.class, "setAsDefaultToggle").setValue(false);
            }
        }
    }

    //Toggle: connectToggle
    if(theEvent.getName().equals("connectToggle")){
        boolean isBuildConnect = false;
        isBuildConnect = boolean(int(theEvent.getController().getValue()));
        if(!isBuildConnect){
            //change connectToggle caption label
            theEvent.getController().setCaptionLabel("Click    to    build    OSC    connection");
            //change osc connection info
            settingPanel.getControlP5().get(Textfield.class, "oscConnectionInfoTextfield").setCaptionLabel("Waiting    for     new    OSC    connection");
            //unlock all OSC-related TextField
            settingPanel.getControlP5().get(Textfield.class, "localOscPortTextfield").setLock(false).setColorBackground(color(60));
            settingPanel.getControlP5().get(Textfield.class, "remoteAddressTextfield").setLock(false).setColorBackground(color(60));
            settingPanel.getControlP5().get(Textfield.class, "remoteOscPortTextfield").setLock(false).setColorBackground(color(60));
            return;    //connectToggle值為false則return不繼續
        }

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
            
            //set connectToggle caption label
            theEvent.getController().setCaptionLabel("Click    Me    for    New    OSC    Connection");
            
            //set osc connection info
            settingPanel.getControlP5().get(Textfield.class, "oscConnectionInfoTextfield").setCaptionLabel("OSC    connection    OK");

            //lock all OSC-related TextField
            settingPanel.getControlP5().get(Textfield.class, "localOscPortTextfield").setLock(true).setColorBackground(color(120));
            settingPanel.getControlP5().get(Textfield.class, "remoteAddressTextfield").setLock(true).setColorBackground(color(120));
            settingPanel.getControlP5().get(Textfield.class, "remoteOscPortTextfield").setLock(true).setColorBackground(color(120));
    
            //只要更動過，就將setAsDefaultToggle設成false
            if(initializer.isDone()){
                settingPanel.getControlP5().get(Toggle.class, "setAsDefaultToggle").setValue(false);
            }
        }else{
            println("[INFO]  OSC related parameters could be wrong, please check it again");

            //reset to false for being pressed at next time
            theEvent.getController().setValue(0);    

            //set osc connection info
            settingPanel.getControlP5().get(Textfield.class, "oscConnectionInfoTextfield").setCaptionLabel("OSC    paramteres    could    be    wrong,    please    check");
        }
    }
        
    //Bang: deleteDefaultSettingFileBang
    if(theEvent.getName().equals("deleteDefaultSettingFileBang")){
        int deleteCount = 0;
        
        //delete default setting files: data資料夾下的defaultSettings.ser檔 和 connectToggleState.hack檔
        File settingFile1 = new File(dataPath("")+"/defaultSettings.ser");
        if(settingFile1.delete() == true){
            println("[INFO] default setting file (defaultSettings.ser) is deleted");
            deleteCount = deleteCount + 1;
        }else{
            println("[INFO] default setting file (defaultSettings.ser) can not be deleted. It could be not existed or permission issue");
        }

        File settingFile2 = new File(dataPath("")+"/connectToggleState.hack");
        if(settingFile2.delete() == true){
            println("[INFO] default setting file (connectToggleState.hack) is deleted");
            deleteCount = deleteCount + 1;
        }else{
            println("[INFO] default setting file (connectToggleState.hack) can not be deleted. It could be not existed or permission issue");
        }

        if(deleteCount == 2){
            //change deleteDefaultSettingFileBang caption label
            theEvent.getController().setCaptionLabel("No    Default    Setting    Files");            
            //將setAsDefaultToggle設成false
            settingPanel.getControlP5().get(Toggle.class, "setAsDefaultToggle").setValue(false);
        }
    }
}

