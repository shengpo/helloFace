public class SettingPanel {
    private PApplet papplet = null;
    private int width = 100;            //width of panel
    private boolean isSettingMode = false;
    
    //controlP5 controllers
    private ControlP5 cp5;
    private DropdownList dropdownList;
    

    
    public SettingPanel(PApplet papplet, int width){
        this.papplet = papplet;
        this.width = width;
        
        //controllers
        cp5 = new ControlP5(papplet);
        setControllersLayout();
    }
    
    public void switchOnOff(){
        //展開setting panel
        if(!isSettingMode){
            papplet.frame.setSize(viewPanelWidth+width, viewPanelHeight);
            isSettingMode = true;
        }else{    //縮回setting panel
            papplet.frame.setSize(viewPanelWidth, viewPanelHeight);
            isSettingMode = false;
        }
    }
    
    
    private void setControllersLayout(){
        /*DropdownList for camera list*/
        dropdownList = cp5.addDropdownList("cameraDropdownList")
                               .setSize(330, 100)
                               .setPosition(viewPanelWidth+50, 50)
                               .setBackgroundColor(color(190))
                               .setColorBackground(color(60))
                               .setColorActive(color(255, 128))
                               .setItemHeight(25)
                               .setBarHeight(20)
                               .setScrollbarWidth(10);
        dropdownList.captionLabel().set("camera list");
        dropdownList.captionLabel().style().marginTop = 5;
        dropdownList.captionLabel().style().marginLeft = 5;
        dropdownList.valueLabel().style().marginTop = 5;
        //add camera list items
        String[] cams = camProperties.getAvailableList();
        if(cams != null){
            for(int i=0; i<cams.length; i++){
                dropdownList.addItem(cams[i], i);
            }
        }
        
        /*TextFiled for local OSC port setting*/
        cp5.addTextfield("localOscPortTextfield")
             .setCaptionLabel("local OSC port")
             .setPosition(viewPanelWidth+50, 150)
             .setSize(65, 15)
             .setColorBackground(color(60))
             .setInputFilter(Textfield.INTEGER)
             .setFont(infoFont);
        
        /*TextFiled for remote address setting*/
        cp5.addTextfield("remoteAddressTextfield")
             .setCaptionLabel("remote address")
             .setPosition(viewPanelWidth+200, 150)
             .setSize(110, 15)
             .setColorBackground(color(60))
             .setFont(infoFont);

        /*TextFiled for remote OSC port setting*/
        cp5.addTextfield("remoteOscPortTextfield")
             .setCaptionLabel("remote OSC port")
             .setPosition(viewPanelWidth+315, 150)
             .setSize(65, 15)
             .setColorBackground(color(60))
             .setInputFilter(Textfield.INTEGER)
             .setFont(infoFont);
        
        /*Bang for build OSC connection*/
        cp5.addBang("connectBang")
             .setCaptionLabel("build    OSC    connection")
             .setPosition(viewPanelWidth+50, 185)
             .setSize(330, 20)
             .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
             
        /*TextFiled for osc connection info*/
        cp5.addTextfield("oscConnectionInfoTextfield")
             .setCaptionLabel("OSC    connection    not    build")
             .setPosition(viewPanelWidth+50, 210)
             .setSize(330, 15)
             .setColorForeground(color(100))
             .setColorBackground(color(0))
             .setColorCaptionLabel(color(200, 0, 0))
             .setFont(infoFont)
             .setLock(true)
             .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);

        /*TextFiled for setAsDefaultToggle info*/
        cp5.addTextfield("setAsDefaultToggleInfoTextfield")
             .setCaptionLabel("Set    Above    Setting    As    Default")
             .setPosition(viewPanelWidth+50, 275)
             .setSize(290, 20)
             .setColorForeground(color(60))
             .setColorBackground(color(0))
             .setColorCaptionLabel(color(200))
             .setFont(infoFont)
             .setLock(true)
             .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);

        /*Toggle for using current controllers' properties to boot helloFace application at next time*/
        cp5.addToggle("setAsDefaultToggle")
             .setCaptionLabel("YES        NO")
             .setPosition(viewPanelWidth+340, 275)
             .setSize(60, 20)
             .setColorBackground(color(60))
             .setColorActive(color(0, 200, 0))
             .setMode(ControlP5.SWITCH)
             .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
    }
    
    
    public ControlP5 getControlP5(){
        return cp5;
    }
}
