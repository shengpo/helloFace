public class Detector {
    private PApplet papplet = null;
    private PGraphics curImage  = null;    //目前正要被處理的image (from camera)  
    private boolean isShowVisualInfo = true;
    
    //opencv
    private OpenCV opencv = null;
    
    //face detection
    private Rectangle[] faceRect = null;    //recording detected faces 
    
    
    
    public Detector(PApplet papplet, int imageWidth, int imageHeight){
        this.papplet = papplet;
        curImage = createGraphics(imageWidth, imageHeight);
        
        //initializing OpenCV
        opencv = new OpenCV(papplet);
        opencv.allocate(imageWidth, imageHeight);
        
        //cascade setting: for face detection 
        opencv.cascade(dataPath("cascade"),"haarcascade_frontalface_alt.xml");
    }
    
    public PImage doDetect(PImage img){
        //copy image for further detections
        opencv.copy(img);

        //do face detection
        //opencv.cascade(dataPath("cascade"),"haarcascade_frontalface_alt.xml");
        faceRect = opencv.detect(true);
        
        //do other detections...
        //...
                
        //send out OSC messages
        if(oscHandler != null)    oscHandler.sendOut(faceRect);
         
        //show final result with/out visual info
        if(isShowVisualInfo){
            curImage.beginDraw();
            //curImage.image(img, 0, 0);
            curImage.set(0, 0, img);
            curImage.noFill();
            curImage.stroke(255, 0, 0);
            for(int i=0; i<faceRect.length; i++){
                curImage.rect(faceRect[i].x, faceRect[i].y, faceRect[i].width, faceRect[i].height);
            }
            curImage.endDraw();

            return curImage;
        }else{
            return img;
        }
    }
    
    
    public void switchOnOffVisualInfo(){
        isShowVisualInfo = !isShowVisualInfo;
    }
}
