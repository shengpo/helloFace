public class CamProperties {
    private String[] cameras = null;            //紀錄可使用的camera列表    
    private String selectedCamera = "";     //紀錄被選取的camera參數設定
    
    //camera參數項目
    private String camName = "";              //camera的名字
    private int camWidth = 0;                    //width of camera's resolution
    private int camHeight = 0;                  //height of camera's resolution
    private int fps = 0;                            //fps of camera
    
    
    
    public CamProperties(){
        //get available cameras
        cameras = Capture.list();
    }
    
    public String[] getAvailableList(){
        if (cameras.length == 0) {
            println("[INFO] There are no cameras available for capture.");
            return null;
        } else {
            println("[INFO] Available cameras:");
            println("-----------------------------");
            for (int i = 0; i < cameras.length; i++) {
                println(cameras[i]);
            }
            println("-----------------------------");
            return cameras;
        }      
    }
    
    public void setCamera(String selectedCamera){
        this.selectedCamera = selectedCamera;

        //get related properties of selected camera
        String[] params = split(selectedCamera, ",");
        for(int i=0; i<params.length; i++){
            if(trim(params[i]).startsWith("name=")){
                camName = trim(params[i]).substring(5);    //retrieve substring from index 5 (after "name=")
            }
            if(trim(params[i]).startsWith("size=")){
                String[] resolution = split(trim(params[i]).substring(5), "x");    //retrieve substring from index 5 (after "size=")
                camWidth = int(resolution[0]);
                camHeight = int(resolution[1]);
            }
            if(trim(params[i]).startsWith("fps=")){
                fps = int(trim(params[i]).substring(4));    //retrieve substring from index 4 (after "fps=")
            }
        }
        
        println("[INFO] selected camera parameter's items: ");
        println("camera name : " + camName);
        println("camera resolution : " + camWidth + " x " + camHeight);
        println("camera fps : " + fps);
    }
    
    
    public String getSelectedCamera(){
        return selectedCamera;
    }
    
    public String getCamName(){
        return camName;
    }
    
    public int getCamWidth(){
        return camWidth;
    }
    
    public int getCamHeight(){
        return camHeight;
    }
    
    public int getCamFPS(){
        return fps;
    }
}
