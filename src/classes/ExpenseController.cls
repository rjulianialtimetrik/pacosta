public class ExpenseController {
    
    private String queryString = '';
    
    
    public List<Expense__c> getExpenses(){
        
        List<Expense__c> results = Database.query('SELECT Category__c, RecordType.Name, Amount__c, Tax__c, Client_Company__c, Submitted__c, '+
                                              'Employee__r.Id, Employee__r.Name, Employee__r.Birthdate '+
                                              'FROM Expense__c ' + queryString);
        
        return results;
        
    }
    
    public void showBusinessTrips(){
        
        this.queryString = 'WHERE RecordType.Name = \'Business Trips\'';
        
    }
    
    public void showClientMeetings(){
        
        this.queryString = 'WHERE RecordType.Name = \'Client Meetings\'';
        
        
    }
    
    public void showAllExpenses(){
        
        this.queryString = '';
        
    }
    
    
    

}