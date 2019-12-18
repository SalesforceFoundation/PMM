public with sharing class ServiceSelector {
    public ServiceSelector() {
    }

    public List<Service__c> getServicesByProgramIds(Set<Id> programIds) {
        System.debug('Program Ids');
        System.debug(programIds);
        return [
            SELECT Id, Name, Program__c
            FROM Service__c
            WHERE Program__c IN :programIds
        ];
    }
}
