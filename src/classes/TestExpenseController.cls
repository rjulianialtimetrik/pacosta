@isTest
public class TestExpenseController {
    
    
    @isTest static void testGetList(){
        
        Contact c = new Contact(FirstName='JOHN', LastName='Doe');
        
        insert c;
        
        Expense__c exp = new Expense__c(Name='Test999', Submitted__c=true, Employee__r=c, Amount__c=287);
        
        exp.Employee__c = c.Id;

        insert exp;
        
        ExpenseController ec = new ExpenseController();
        
        Test.startTest();
        List<ExpenseWrapper> wel = new List<ExpenseWrapper>();
        wel = ec.getExpenses();
        Test.stopTest();
        
        System.assert(wel != null);
 
    }
    
    
    @isTest static void testPopulateExpenses(){
        
        ExpenseController ec = new ExpenseController();
        ec.wrappedExpenses = new List<ExpenseWrapper>();

        
        
        Test.startTest();
        
        ec.populateExpenses();
        List<ExpenseWrapper> listToCheck = ec.wrappedExpenses;
        Test.stopTest();
        
        System.assert(listToCheck.size()>0);
        
    }

}