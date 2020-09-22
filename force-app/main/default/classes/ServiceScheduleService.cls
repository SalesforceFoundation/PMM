public with sharing class ServiceScheduleService {
    @TestVisible
    private ServiceScheduleDomain domain = new ServiceScheduleDomain();

    public ServiceScheduleModel getServiceScheduleModel() {
        return new ServiceScheduleModel();
    }

    public void persist(ServiceScheduleModel model) {
        Savepoint savepoint = Database.setSavepoint();

        try {
            domain.insertModel(model);
        } catch (Exception ex) {
            Database.rollback(savepoint);
            throw new ServiceScheduleServiceException(ex);
        }
    }

    public class ServiceScheduleServiceException extends Exception {
    }
}
