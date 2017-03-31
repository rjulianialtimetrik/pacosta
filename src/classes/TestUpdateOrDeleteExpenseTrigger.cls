@isTest
public class TestUpdateOrDeleteExpenseTrigger {

    
    @isTest static void testDeleteSubmittedExpense(){
        
        Contact c = new Contact(FirstName='JOHN', LastName='Doe');
        
        insert c;
        
        Expense__c exp = new Expense__c(Name='Test999', Submitted__c=true, Employee__r=c, Amount__c=287);
        
        exp.Employee__c = c.Id;

        insert exp;
        
        Test.startTest();
        Database.DeleteResult result = Database.delete(exp);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot Delete SUBMITTED Expenses!', result.getErrors()[0].getMessage());
    }
    
    
    @isTest static void testUpdateSubimittedExpense(){
        
        Contact c = new Contact(FirstName='JOHN', LastName='Doe');
        
        insert c;
        
        Expense__c exp = new Expense__c(Name='Test999', Submitted__c=true, Employee__r=c, Amount__c=290);
        
        exp.Employee__c = c.Id;

        insert exp;
        
        exp.Amount__c=2999;
        
        test.startTest();
        Database.SaveResult result = Database.update(exp);
        test.stopTest();
        
        //System.assert(!result.isSuccess());
        //System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot Update SUBMITTED Expenses!', result.getErrors()[0].getMessage());
        
        
    }
    
    
     @isTest static void testUpdateSubimittedExpense2(){
        
        Contact c = new Contact(FirstName='JOHN', LastName='Doe');
        
        insert c;
        
        Expense__c exp = new Expense__c(Name='Test999', Submitted__c=true, Employee__r=c, Amount__c=290);
        
        exp.Employee__c = c.Id;

        insert exp;
        
        exp.Amount__c=2999;
        exp.Expense_Status__c='NOT SUBMITTED';
        
        test.startTest();
        Database.SaveResult result = Database.update(exp);
        test.stopTest();
        
        System.assert(result.isSuccess());
        
        
        
    }
    
    
}