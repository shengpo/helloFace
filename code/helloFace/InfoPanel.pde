public class InfoPanel {
    private int width = 100;    //width of info panel
    private boolean isShowInfo = false;

    
    public InfoPanel(int width){
        this.width = width;
    }
    
    public void show(){
        if(isShowInfo){
            //background of info panel
            noStroke();
            fill(170, 170, 250, 128);
            float h = fontSize*4.5;
            rect(0, viewPanelHeight-h, width, h);
            
            /*list infos*/
            fill(255, 255, 0);
            //local OSC port
            text("[ Local OSC port ] " + (oscHandler!=null ? oscHandler.getLocalOscPort() : ""), 10, viewPanelHeight-fontSize*3.3);
            //remote address and OSC port
            text("[ Remote ] " + (oscHandler!=null ? oscHandler.getRemoteAddress() : "") + ":" + (oscHandler!=null ? oscHandler.getRemoteOscPort() : ""), 10, viewPanelHeight-fontSize*2.3);
            //detecting type
            text("[ Detecting Type ] " + (detector!=null ? detector.getDetectionTypeName() : ""), 10, viewPanelHeight-fontSize*1.3);
            //selected camera params
            text("[ Cam ] "+camProperties.getSelectedCamera(), 10, viewPanelHeight-fontSize*0.3);
        }
    }
    
    public void switchOnOff(){
        isShowInfo = !isShowInfo;
    }
}
