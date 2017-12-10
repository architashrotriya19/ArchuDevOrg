public class ErrorHandling {
    @future
        public static void ErrorXyz (){
      try{
    system.debug('IN Try');
       integer i = 5;
          opportunity a =new opportunity();
          a.name='abc';
      insert a;
          integer j;
          i=j;
          
   // throw new CustomException('Catch me in catch');
}catch(Exception e){
    system.debug('I will print');
   // throw e;
    system.debug('I will not print');
}
            system.debug('I will  print outside throw');
    }

}