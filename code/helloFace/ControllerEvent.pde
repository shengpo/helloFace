//for any controller event of controlP5

void controlEvent(ControlEvent theEvent) {
    if (theEvent.isGroup()) {
        // check if the Event was triggered from a ControlGroup
        println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());

        //DropdownList: cameraList
        if(theEvent.getName().equals("cameraList")){
            String[] cams = camProperties.getAvailableList();
            if(cams != null){
                if(cam != null)    cam.stop();    //先停止之前選擇的camera
                camProperties.setCamera(cams[(int)theEvent.getValue()]);    //設定目前選的camera parameters
                cam = new Capture(this, camProperties.getSelectedCamera());    //產生新的camera
                cam.start();    //啟動
                println("[INFO] camera initialized !");
                
                //for detector
                detector = null;    //漆除之前的detector
                detector = new Detector(camProperties.getCamWidth(), camProperties.getCamHeight());
                println("[INFO] detector initialized !");
            }
        }
    } else if (theEvent.isController()) {
        println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
    }
}

