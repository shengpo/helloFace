public class InfoPanel {
    private int width = 100;    //width of info panel
    private boolean isShowInfo = false;

    
    public InfoPanel(int width){
        this.width = width;

        PFont myFont = createFont("Georgia", 12);
        textFont(myFont);
    }
    
    public void show(){
        if(isShowInfo){
            //background of info panel
            noStroke();
            fill(170, 170, 250, 128);
            int h = 30;
            rect(0, viewPanelHeight-h, width, h);
            
            /*list infos*/
            //selected camera params
            fill(255, 255, 0);
            text("cam: "+camProperties.getSelectedCamera(), 10, viewPanelHeight-4);
        }
    }
    
    public void switchOnOff(){
        isShowInfo = !isShowInfo;
    }
}
