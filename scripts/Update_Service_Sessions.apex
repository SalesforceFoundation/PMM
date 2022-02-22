List<%%%NAMESPACE%%%ServiceSession__c> sessionsToUpdate = new List<%%%NAMESPACE%%%ServiceSession__c>();

for (%%%NAMESPACE%%%ServiceSession__c session: [SELECT Name, %%%NAMESPACE%%%SessionStart__c, %%%NAMESPACE%%%ServiceSchedule__r.Name FROM %%%NAMESPACE%%%ServiceSession__c]){
    session.name = (session.%%%NAMESPACE%%%SessionStart__c.date().format() + ': ' + session.%%%NAMESPACE%%%ServiceSchedule__r.Name).abbreviate(80);
    sessionsToUpdate.add(session);
}

update sessionsToUpdate;