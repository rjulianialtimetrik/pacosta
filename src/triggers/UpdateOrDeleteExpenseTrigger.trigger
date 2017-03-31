trigger UpdateOrDeleteExpenseTrigger on Expense__c (before update, before delete) {
    
    if(Trigger.isDelete){
    	for(Expense__c ex: Trigger.old){
        
        	if(ex.Expense_Status__c != 'NOT SUBMITTED'){
            
            	Trigger.oldMap.get(ex.Id).addError('Cannot Delete SUBMITTED Expenses!');
            
        	}
        
    	}
    }
    
    if(Trigger.isUpdate){
        
        for(Expense__c ex: Trigger.new){
            
            
            if(ex.Expense_Status__c != 'NOT SUBMITTED'){
            
            	Trigger.newMap.get(ex.Id).addError('Cannot Update SUBMITTED Expenses!');
            
        	}
            
            else{
                
                if(ex.Submitted__c==true && ex.Expense_Status__c == 'NOT SUBMITTED'){
                    
                    ex.Expense_Status__c='SUBMITTED';
                }
            }
            
            
            
        }
        
    }

}