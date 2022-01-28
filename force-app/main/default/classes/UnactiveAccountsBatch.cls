public class UnactiveAccountsBatch implements Database.Batchable<SObject> {

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id, (SELECT Id, WhatId FROM Tasks WHERE CreatedDate = LAST_N_DAYS:90), (SELECT Id, Name FROM Opportunities WHERE CreatedDate = LAST_N_DAYS:120 AND StageName != 'Negotiation/Review') FROM Account]);    
    }

    public void execute(Database.BatchableContext BC, List<Account> scope) {

        for(Account acc : scope) {
            acc.Inactive__c = true;
        }

        update scope;
    }

    public void finish(Database.BatchableContext BC) {

    }
}
