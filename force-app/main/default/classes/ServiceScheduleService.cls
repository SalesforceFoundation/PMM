public with sharing class ServiceScheduleService {
    @TestVisible
    private ServiceScheduleDomain domain = new ServiceScheduleDomain();
    @TestVisible
    private ProgramEngagementSelector programEngagementSelector = new ProgramEngagementSelector();

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

    public SelectParticipantModel getSelectParticipantModel(Id serviceId) {
        SelectParticipantModel model = new SelectParticipantModel();
        populateRecords(serviceId, model);
        return model;
    }

    private void populateRecords(Id serviceId, SelectParticipantModel model) {
        model.program = programEngagementSelector.getProgramByServiceId(serviceId);
        if (model.program == null) {
            return;
        }

        model.programEngagements = programEngagementSelector.getProgramEngagementsByProgramId(
            model.program.Id
        );
        model.programCohorts = programEngagementSelector.getProgramCohortsByProgramId(
            model.program.Id
        );
    }

    public class ServiceScheduleServiceException extends Exception {
    }
}
