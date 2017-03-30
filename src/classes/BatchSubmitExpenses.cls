global class BatchSubmitExpenses implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        String query = 'SELECT Category__c, RecordType.Name, Amount__c, Tax__c, Client_Company__c, Submitted__c, '+
                                              'Employee__r.Id, Employee__r.Name, Employee__r.Birthdate '+
                                              'FROM Expense__c WHERE Amount__c >=5000 AND Submitted__c=false';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext bc, List<Expense__c> results){
        
        if(results.size()>0){
        	for(Expense__c exp:results){
            	
            	exp.Submitted__c = true;
            
        	}
        
        	update results;
        }
        
        
    }
    
    global void finish(Database.BatchableContext BC){
        
        
        
    }

}