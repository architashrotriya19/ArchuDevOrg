public class Student {

    public Student() {

    }


    public Student(ApexPages.StandardController controller) {
		//Vehical__c v = controller.getRecord(); 
    }


    
	public Integer math = 10;
	public Integer science = 20;
	public Integer english = 0;
	public Integer hindi = 0;
	String result = '';
	String section = '';


	public Integer getTotal(){
		Integer tot = math + science + english+ hindi;
		return tot;
	}

	public Decimal getPercentage(){

		Decimal per = (getTotal()/4);

		return per;
	}

	public String getResult(){
		if(getPercentage() > 35 ){
			return 'Pass';
		}else{
			return 'Fail';
		}
	}
}