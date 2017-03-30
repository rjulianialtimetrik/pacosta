@isTest
public class TestShowExpensesListForContactController {
    
    
    @isTest static void testGetListOfExpensesForContact(){
        
       
        
        Contact c = new Contact(FirstName='JOHN', LastName='Doe');
        
        insert c;
        
        Expense__c exp = new Expense__c(Name='Test999', Submitted__c=true, Employee__r=c, Amount__c=287);
        
        exp.Employee__c = c.Id;

        insert exp;
        
        
        PageReference pageRef = Page.showExpensesListForContact;
    	Test.setCurrentPage(pageRef);
    	ApexPages.currentPage().getParameters().put('id', c.Id);
        
        showExpensesListForContactController testClass = new showExpensesListForContactController();
        
        
        Test.startTest();
        List<Expense__c> listToCheck = testClass.getExpenses();
        Test.stopTest();
        
        System.assert(listToCheck != null);
    }
    
    
    @isTest static void testQueryBusiness(){
        
        showExpensesListForContactController testClass = new showExpensesListForContactController();
        
        testClass.showBusinessTrips();
        
        System.assertEquals(' AND RecordType.Name = \'Business Trips\'', testClass.returnQueryString());
        
    }
    
    @isTest static void testQueryMeetings(){
        
        showExpensesListForContactController testClass = new showExpensesListForContactController();
        
        testClass.showClientMeetings();
        
        System.assertEquals(' AND RecordType.Name = \'Client Meetings\'', testClass.returnQueryString());
        
    }
    
    @isTest static void testQueryAllExpenses(){
        
        showExpensesListForContactController testClass = new showExpensesListForContactController();
        
        testClass.showAllExpenses();
        
        System.assertEquals('', testClass.returnQueryString());
        
    }

}