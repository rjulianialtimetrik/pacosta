public class ExpenseController {
    
    private String queryString = '';
    public Integer CountTotalRecords{get;set;}  
    public Integer OffsetSize = 0; //number of rows to skip, dinamically loaded depending on 
    private Integer QueryLimit = 3; //limit number for test purposes, we can see how the list pagination works
    
    public ExpenseController(){
        
        CountTotalRecords = [SELECT count() FROM Expense__c];
        
    }
    
    public List<ExpenseWrapper> wrappedExpenses {get; set;}
    
    
    public List<ExpenseWrapper> getExpenses(){
        
        List<Expense__c> results = Database.query('SELECT Category__c, RecordType.Name, Amount__c, Tax__c, Client_Company__c, Submitted__c, '+
                                              'Employee__r.Id, Employee__r.Name, Employee__r.Birthdate '+
                                              'FROM Expense__c ' + queryString +
                                                 ' ORDER BY Employee__r.Name LIMIT '+ QueryLimit +' OFFSET ' + OffsetSize);
        
        
        wrappedExpenses = new List<ExpenseWrapper>();
        for(Expense__c ex: results){
            
            wrappedExpenses.add(new ExpenseWrapper(ex, false));
            
        }
        
        return wrappedExpenses;
        
    }
    

    public void populateExpenses(){
        
        List<Expense__c> results = Database.query('SELECT Category__c, RecordType.Name, Amount__c, Tax__c, Client_Company__c, Submitted__c, '+
                                              'Employee__r.Id, Employee__r.Name, Employee__r.Birthdate '+
                                              'FROM Expense__c' + queryString);
        
        for(Expense__c exp: results){
            
            wrappedExpenses.add(new ExpenseWrapper(exp, exp.Submitted__c));
            
        }
        
    }
    
    
    
    public void showBusinessTrips(){
        
        this.queryString = 'WHERE RecordType.Name = \'Business Trips\'';
        
    }
    
    public void showClientMeetings(){
        
        this.queryString = 'WHERE RecordType.Name = \'Client Meetings\'';
        
        
    }
    
    public void showSubmitted(){
        
        this.queryString = ' WHERE Submitted__c = true';
        
        
    }
    
     public void showNotSubmitted(){
        
        this.queryString = ' WHERE Submitted__c = false';
        
        
    }
    
    public void showAllExpenses(){
        
        this.queryString = '';
        
    }
    
    
    
    public void updateSelectedExpenses(){
        
        List<Expense__c> updateExpenses = new List<Expense__c>();
    	
        for(ExpenseWrapper ep: wrappedExpenses){
            
            if(ep.checked){
                
                ep.expense.Submitted__c=true;
                updateExpenses.add(ep.expense);
            }
            
        }
        
        update updateExpenses;
        
    }

    //Pagination options
    public Boolean getDisablePrevious(){
        if(OffsetSize>0){
            return false;
        }
        else return true;
    }

    public Boolean getDisableNext() {
        if (OffsetSize + QueryLimit < countTotalRecords){
            return false;
        }
        else return true;
    }

    public PageReference Next() {
        OffsetSize += QueryLimit;
        return null;
    }

    public PageReference Previous() {
        OffsetSize -= QueryLimit;
        return null;
    }
 

}