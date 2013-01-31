public class Detector {
    private PGraphics curImage  = null;    //目前正要被處理的image (from camera)  
    private boolean isShowVisualInfo = false;
    
    
    public Detector(int imageWidth, int imageHeight){
        curImage = createGraphics(imageWidth, imageHeight);
    }
    
    public PImage doDetect(PImage img){
        //do detection
        //...
                
        //show final result with/out visual info
        if(isShowVisualInfo){
            curImage.beginDraw();
            //...
            curImage.endDraw();

            return curImage;
        }else{
            return img;
        }
    }
}
