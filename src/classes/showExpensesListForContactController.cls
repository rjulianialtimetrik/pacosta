public class showExpensesListForContactController {
    
    private String queryString = '';
    
    public Integer CountTotalRecords{get;set;}
    
    String idContact = ApexPages.currentPage().getParameters().get('id');
    
    public Integer OffsetSize = 0; //number of rows to skip, dinamically loaded depending on 
    private Integer QueryLimit = 3; //limit number for test purposes, we can see how the list pagination works
    
    public showExpensesListForContactController(){
        
        CountTotalRecords = [SELECT count() FROM Expense__c WHERE Employee__r.id=:idContact];
        
    }
    
    
    public String returnQueryString(){
        
        return this.queryString;
    }
    
    
    
    public List<Expense__c> getExpenses(){
        
        List<Expense__c> results = Database.query('SELECT id, Name, Category__c, RecordType.Name, Amount__c, Tax__c, Client_Company__c, Submitted__c '+
                                              	  'FROM Expense__c '+
                                                 'WHERE Employee__r.Id=' + '\'' + idContact + '\'' + 
                                                 queryString + ' LIMIT '+ QueryLimit +' OFFSET ' + OffsetSize);
        
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
    
    
    //Pagination options
    public Boolean getDisablePrevious(){
        if(OffsetSize>0){
            return false;
        }
        else return true;
    }

    public Boolean getDisableNext() {
        if (OffsetSize + QueryLimit < CountTotalRecords){
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