public class CallableApi implements Callable {
    @TestVisible
    private ProgramService programService = new ProgramService();

    Map<Id, String> getProgramsForContact(Id contactId) {
        return programService.getProgramNamesByIdForContact(contactId);
    }

    public Object call(String action, Map<String, Object> args) {
        this.programService = (ProgramService) args.get('programService');

        switch on action {
            when 'getProgramsForContact' {
                return this.getProgramsForContact((Id) args.get('contactId'));
            }
            when else {
                throw new ExtensionMalformedCallException('Method not implemented');
            }
        }
    }

    public class ExtensionMalformedCallException extends Exception {
    }
}
