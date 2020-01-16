public class CallableApi implements Callable {

    ProgramService programService = new ProgramService();

    Map<Id, String> getProgramsForContact(Id contactId) {
        return programService.getProgramNamesByIdForContact(contactId);
    }

    public Object call(String action, Map<String, Object> args) {
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
