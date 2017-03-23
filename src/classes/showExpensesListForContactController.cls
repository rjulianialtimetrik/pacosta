public class showExpensesListForContactController {
    
    private String queryString = '';
    
    public List<Expense__c> getExpenses(){
        
        
        String idContact = ApexPages.currentPage().getParameters().get('id');
            
        List<Expense__c> results = Database.query('SELECT id, Name, Category__c, RecordType.Name, Amount__c, Tax__c, Client_Company__c, Submitted__c '+
                                              	  'FROM Expense__c '+
                                                 'WHERE Employee__r.Id=' + '\'' + idContact + '\'' + 
                                                 queryString);
        
        return results;
    }
    
    public void showBusinessTrips(){
        
        this.queryString = ' AND RecordType.Name = \'Business Trips\'';
        
    }
    
    public void showClientMeetings(){
        
        this.queryString = ' AND RecordType.Name = \'Client Meetings\'';
        
        
    }
    
    public void showAllExpenses(){
        
        this.queryString = '';
        
    }

    
    
}