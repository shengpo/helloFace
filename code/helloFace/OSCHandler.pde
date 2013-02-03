public class OSCHandler {
    private PApplet papplet = null;
    private OscP5 oscP5 = null;
    private int localOscPort = 12000;
    private NetAddress myRemoteLocation = null;
    private String remoteAddress = "127.0.0.1";    //default address is local
    private int remoteOscPort = 12000;



    public OSCHandler(PApplet papplet){
        this.papplet = papplet;
        oscP5 = new OscP5(papplet, localOscPort);
        myRemoteLocation = new NetAddress(remoteAddress, remoteOscPort);
        
        //add plugs (plug to this object's function!) --> need to test
        oscP5.plug(this,"test","/test");
    }
    

    public void sendOut(Rectangle[] faceRect){
        if(faceRect!=null && faceRect.length>0){
            OscMessage myMessage = new OscMessage("/faceDetect");
            myMessage.add(faceRect.length);    //偵測到的face數量
            
            //集合偵測到的人臉資訊
            for(int i=0; i<faceRect.length; i++){
                //...
            }
            
            myMessage.add(456); /* add a second int to the osc message */
            oscP5.send(myMessage, myRemoteLocation); 
        }
    }
    

    public void test(int theA, int theB) {
        println("### plug event method. received a message /test.");
        println(" 2 ints received: "+theA+", "+theB);  
    }
}
