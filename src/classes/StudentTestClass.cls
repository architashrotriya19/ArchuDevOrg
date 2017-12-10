@isTest
public class StudentTestClass {
	
    
    static testMethod void testM(){    
    	Student st = new Student();
    	system.assertEquals(0, st.getTotal() , 'It is working fine');
    }
    
    static testMethod void testM1(){
    	Student st = new Student();
        st.math = 10;
        st.hindi = 20;
    	system.assertEquals(30, st.getTotal() , 'It is working fine');
    }
    
    
}