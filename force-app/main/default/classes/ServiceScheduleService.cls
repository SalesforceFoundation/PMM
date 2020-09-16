public with sharing class ServiceScheduleService {
    private ServiceScheduleModel serviceScheduleModel = new ServiceScheduleModel();

    public ServiceScheduleModel getServiceScheduleModel() {
        return serviceScheduleModel;
    }

    public void persist(ServiceScheduleModel model) {
        Savepoint savepoint = Database.setSavepoint();

        try {
            insert model.serviceSchedule;
            populateServiceScheduleId(model);
            insert model.serviceSessions;
            insert model.serviceParticipants;
        } catch (Exception ex) {
            Database.rollback(savepoint);
            throw new ServiceScheduleServiceException(ex);
        }
    }

    private void populateServiceScheduleId(ServiceScheduleModel model) {
        for (ServiceSession__c session : model.serviceSessions) {
            session.ServiceSchedule__c = model.serviceSchedule.Id;
        }
        for (ServiceParticipant__c participant : model.serviceParticipants) {
            participant.ServiceSchedule__c = model.serviceSchedule.Id;
        }
    }

    public class ServiceScheduleServiceException extends Exception {
    }
}
