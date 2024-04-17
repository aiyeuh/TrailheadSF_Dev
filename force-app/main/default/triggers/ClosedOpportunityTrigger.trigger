trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    //List Task
    List<Task> taskList = new List<Task>();
    //Oppty Update triger
    for(Opportunity oppty:trigger.new){
        //Check if stage == closed won and changed cause update
        if(oppty.StageName == 'Closed Won' && (Trigger.isInsert || oppty.StageName != Trigger.oldMap.get(oppty.Id).StageName)){
            taskList.add(new Task(Subject='Follow Up Test Task',WhatId =oppty.Id));
        }
    }

    if(!taskList.isEmpty()){
        insert taskList;
    }
}