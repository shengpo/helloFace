public class Circle {
    private float x = 0;
    private float y = 0;
    private float diameter = 0;
    private int step = 30;
    
    
    public Circle(float x, float y, float diameter){
        this.x = x;
        this.y = y;
        this.diameter = diameter;
        step = (int)random(10, 120);
    }
    
    public void update(){
        diameter = diameter + (0-diameter)/step;
    }
    
    public void show(){
        noStroke();
        fill(255, 100);
        ellipse(x, y, diameter, diameter);
    }
    
    public boolean isDead(){
        if(abs(diameter-0) < 1){
            return true;
        }else{
            return false;
        }
    }
}
