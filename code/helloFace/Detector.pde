public class Detector {
    //for detection type
    static final public int FACEDETECTION = 0;    //face detection
    
    private PApplet papplet = null;
    private PGraphics curImage  = null;    //目前正要被處理的image (from camera)  
    private boolean isShowVisualInfo = true;
    
    //opencv
    private OpenCV opencv = null;
    private int detectionType = -1;
    
    //face detection
    private Rectangle[] faceRect = null;    //recording detected faces 
    
    
    
    public Detector(PApplet papplet, int imageWidth, int imageHeight, int detectionType){
        this.papplet = papplet;
        this.detectionType = detectionType;
        curImage = createGraphics(imageWidth, imageHeight);
        
        //initializing OpenCV
        opencv = new OpenCV(papplet);
        opencv.allocate(imageWidth, imageHeight);
        
        //cascade setting
        switch(detectionType){
            case FACEDETECTION:    //for face detection
                        opencv.cascade(dataPath("cascade"),"haarcascade_frontalface_alt.xml");
                        break;
            default:    //不是目前有提供的detecting功能
                        detectionType = -1;
                        break;
        }
    }
    
    public PImage doDetect(PImage img){
        if(img==null || img.width<=0 || img.height<=0) return null;    //避免處理null image或empty image
        
        //copy image for further detections
        opencv.copy(img);

        /*do detecting*/
        switch(detectionType){
            case FACEDETECTION:    //face detection
                        //opencv.cascade(dataPath("cascade"),"haarcascade_frontalface_alt.xml");
                        faceRect = opencv.detect(true);
                        break;
            case 1:
                        //other detectiing function will be added in the future
                        break;
            default:
                        //do nothing ...
                        break;
        }
                
        //send out OSC messages
        if(oscHandler != null)    oscHandler.sendOut(faceRect);
         
        //show final result with/out visual info
        if(isShowVisualInfo){
            curImage.beginDraw();
            //curImage.image(img, 0, 0);    //put original image first
            curImage.set(0, 0, img);    //put original image first; set() is more faster
            showVisualInfo(curImage);    //add visual info messages on original image
            curImage.endDraw();

            return curImage;
        }else{
            return img;
        }
    }
    
    private void showVisualInfo(PGraphics curImage){
        switch(detectionType){
            case FACEDETECTION:
                        //show出辨識到的人臉矩型範圍
                        curImage.noFill();
                        curImage.stroke(255, 0, 0);
                        for(int i=0; i<faceRect.length; i++){
                            curImage.rect(faceRect[i].x, faceRect[i].y, faceRect[i].width, faceRect[i].height);
                        }
            default:
                        //do nothing
                        break;
        }
    }
    
    
    public void switchOnOffVisualInfo(){
        isShowVisualInfo = !isShowVisualInfo;
    }
    
    public String getDetectionTypeName(){
        String typename = "";
        
        switch(detectionType){
            case FACEDETECTION:
                            typename = "FACEDETECTION";
                            break;
            default:
                            typename = "NOT-DEFINED";
                            break;
        }
        
        return typename;
    }
}
