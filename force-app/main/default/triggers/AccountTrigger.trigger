trigger AccountTrigger on Account (before insert, before update, after insert, after update) {

    Id AccRecordTypeIdParceiros = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Parceiro').getRecordTypeId();
    Id AccRecordTypeIdConsumidorFinal = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Parceiro').getRecordTypeId();
    List<Opportunity> newOppList = new List<Opportunity>();
    List<Task> newTaskList = new List<Task>();

    for(Account accountRecord : Trigger.new) {
        
        if(accountRecord.Type == 'CPF' && !Utils.ValidaCPF(accountRecord.AccountNumber)) {
            accountRecord.addError('O número do Cliente é inválido');
        }

        if(accountRecord.Type == 'CNPJ' && !Utils.ValidaCNPJ(accountRecord.AccountNumber)) {
            accountRecord.addError('O número do Cliente é inválido');
        }

        if(Trigger.isInsert) {
            if(accountRecord.RecordTypeId == AccRecordTypeIdParceiros) {
                Opportunity newOpp = new Opportunity();
                newOpp.Name = accountRecord.Name + ' - opp Parceiro';
                newOpp.CloseDate = Date.today().addDays(30);
                newOpp.StageName = 'Qualification';
                newOppList.add(newOpp);
            }
    
            if(accountRecord.RecordTypeId == AccRecordTypeIdConsumidorFinal) {
                Task newTask = new Task();
                newTask.Subject = 'Consumidor Final';
                newTask.WhatId = accountRecord.Id;
                newTask.Status = 'Not Started';
                newTask.Priority = 'Normal';
                newTaskList.add(newTask);
            }
        }
    }
    insert newTaskList;
    insert newOppList;

}