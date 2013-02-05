public class Initializer {
    private boolean isDone = false;    //判斷是否載入default設定完畢
    
    
    public Initializer(){
    }
    
    public void loadDefaultSetting(){
        //load default controllers' state
        boolean isValidFile = settingPanel.getControlP5().getProperties().load(dataPath("")+"/defaultSettings.ser");

        //for hack (解決connectToggle比OSc-related TextField載入快速的問題(導致無法順利建立OSC connection))
        String[] state = loadStrings(dataPath("")+"/connectToggleState.hack");
        if(state != null){
            if(int(trim(state[0])) == 1)    settingPanel.getControlP5().get(Toggle.class, "connectToggle").setState(true);  
        }
        
        if(isValidFile && state!=null){
            println("[INFO] initiallized successfully !");
        }
        if(!isValidFile){
            println("[INFO] default setting file (settings.ser) is not existed");
        }
        if(state == null){
            println("[INFO] default setting file (connectToggleState.hack) is not existed");
        }

        isDone = true;    //表示initializing完成，讓之後的controller state改變時能夠存取最新的改變
    }
    
    public void deleteDefaultSetting(){
        //...
    }

    public boolean isDone(){
        return isDone;
    }
}
