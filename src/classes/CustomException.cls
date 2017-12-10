public class CustomException extends Exception {

    /*
// SAMPLE ONE
try{
    system.debug('IN Try I will print');
}catch(Exception e){
    system.debug('I will not print');
}

// SAMPLE TWO Throwing exception in catch also

try{
    system.debug('IN Try I will print');
    throw new CustomException('Catch me in catch');
}catch(Exception e){
    system.debug('I will print');
    throw new CustomException('Catch me in catch');
    system.debug('I will not print');
}

// SAMPLE THREE
//Nested try catch to handle exception in Catch


try{
    system.debug('IN Try I will print');
    throw new CustomException('Catch me in catch');
}catch(Exception e){
    system.debug('I will print');
    try{
    	system.debug('I will print because I am in nested try');
    	throw new CustomException('Catch me in catch');
    	system.debug('I will not print');
    }catch(Exception e){
    	system.debug('I will print because I am handled');
    }
    
}
*/
}