/**
 * PA2Test1
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
        
        while(1 + 2 == 3 + (- 4)){
            Meggy.delay(100);
        }
        
        while((1 + 2 == 3 - 4) && ((byte)1 * (byte)2 == (byte)3 * (byte)4)){
            Meggy.delay(100);
        }
        
        while(Meggy.getPixel((byte)1, (byte)0) == Meggy.Color.DARK){
            while(Meggy.checkButton(Meggy.Button.B)){
                Meggy.delay(100);
            }
        }
    }
}
