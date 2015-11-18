/**
 * all_in_one.java
 * 
 * Basic strings, setPixel, (byte)Expression, Int, Color.
 * 
 * Ming Sun, supersun17, 09/13/2015
 */
import meggy.Meggy;

class all_in_one {
    public static void main(String[] args){
        Meggy.setPixel( (byte)0, (byte)1, Meggy.Color.DARK );
        
        Meggy.delay(100);
        
        if(true){
            Meggy.delay(100);
            
            if(!false){
                Meggy.delay(100);
            }
            else
                Meggy.delay(100);
        }
        
        if(false){
            Meggy.delay(100);
            
            if(!true){
                Meggy.delay(100);
            }
        }
        else
            Meggy.delay(100);
        
        if(new newclass2().newmt1()){
            Meggy.delay(100);
        }
        if(new newclass2().newmt2(true)){
            Meggy.toneStart(Meggy.Tone.C3, 1);
            Meggy.toneStart(Meggy.Tone.Cs3, 1);
            Meggy.toneStart(Meggy.Tone.D3, 1);
            Meggy.toneStart(Meggy.Tone.Ds3, 1);
            Meggy.toneStart(Meggy.Tone.E3, 1);
            Meggy.toneStart(Meggy.Tone.F3, 1);
            Meggy.toneStart(Meggy.Tone.Fs3, 1);
            Meggy.toneStart(Meggy.Tone.G3, 1);
            Meggy.toneStart(Meggy.Tone.Gs3, 1);
            Meggy.toneStart(Meggy.Tone.A3, 1);
            Meggy.toneStart(Meggy.Tone.As3, 1);
            Meggy.toneStart(Meggy.Tone.B3, 1);
        }
        if (2 + 2 == 3 + (- 4)){
            Meggy.delay(100);
        }
        if (2 + 1 < 4 + (- 1)){
            Meggy.delay(100);
        }
        if ((1 + 3 == 3 - 4) && ((byte)1 * (byte)2 == (byte)3 * (byte)4)){
            Meggy.delay(100);
        }
        
        if (Meggy.getPixel((byte)1, (byte)0) == Meggy.Color.DARK){
            while(Meggy.checkButton(Meggy.Button.B)){
                Meggy.delay(100);
            }
        }
        while(new newclass2().newmt2(true)){
            Meggy.delay(100);
        }
        
        Meggy.toneStart(Meggy.Tone.A3, 1);
        new newclass2().newmt1();
        new newclass2().newmt2(true);
    }
         
}

class newclass1{
    public boolean newmt1(boolean input1){
        Meggy.setPixel( (byte)0, (byte)1, Meggy.Color.DARK );
        return true;
    }
}

class newclass2{
    public boolean newmt1(){
        Meggy.setPixel( (byte)0, (byte)1, Meggy.Color.DARK );
        Meggy.setPixel( (byte)1, (byte)2, Meggy.Color.RED );
        return false;
    }
    public boolean newmt2(boolean input1){
        if(input1){
            
        }
        Meggy.setPixel( (byte)0, (byte)1, Meggy.Color.DARK );
        Meggy.setPixel( (byte)1, (byte)2, Meggy.Color.RED );
        return true;
    }
    public byte newmt3(boolean input1, byte input2){
        Meggy.setPixel( (byte)0, (byte)1, Meggy.Color.DARK );
        Meggy.setPixel( (byte)1, (byte)2, Meggy.Color.RED );
        this.newmt1();
        return (byte)7;
    }
    
    public int newmt4(boolean input1, byte input2, int input3){
        Meggy.setPixel( (byte)0, (byte)1, Meggy.Color.DARK );
        Meggy.setPixel( (byte)1, (byte)2, Meggy.Color.RED );
        return 1;
    }
    public Meggy.Color newmt5(Meggy.Color color){
        Meggy.setPixel( (byte)0, (byte)1, Meggy.Color.DARK );
        Meggy.setPixel( (byte)1, (byte)2, Meggy.Color.RED );
        return Meggy.Color.DARK;
    }
    public Meggy.Button newmt6(Meggy.Button button){
        Meggy.setPixel( (byte)0, (byte)1, Meggy.Color.DARK );
        Meggy.setPixel( (byte)1, (byte)2, Meggy.Color.RED );
        return Meggy.Button.Up;
    }
    public Meggy.Tone newmt7(Meggy.Tone tone){
        Meggy.setPixel( (byte)0, (byte)1, Meggy.Color.DARK );
        Meggy.setPixel( (byte)1, (byte)2, Meggy.Color.RED );
        return Meggy.Tone.A3;
    }
}