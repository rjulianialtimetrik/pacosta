global class DailyExpenseChecker implements Schedulable{
    
    global void execute (SchedulableContext sc){
        
        
        BatchSubmitExpenses bs = new BatchSubmitExpenses();
        
        database.executeBatch(bs, 50000);
        
    }

}