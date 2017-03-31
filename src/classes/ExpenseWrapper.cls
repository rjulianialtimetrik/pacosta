public class ExpenseWrapper{
        
        public Expense__c expense {get;set;}
        public Boolean checked {get;set;}
        
        public ExpenseWrapper(Expense__c ex, Boolean check){
            
            this.expense = ex;
            this.checked = check;
            
        }
        
        
    }