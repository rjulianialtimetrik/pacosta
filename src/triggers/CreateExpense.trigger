trigger CreateExpense on Expense__c (before insert, before update) {

    for(Expense__c ex: Trigger.new){
        
        if(ex.Submitted__c==true){
            
            
            ex.Expense_Status__c='SUBMITTED';
        }
        
        
    }
    
    
}