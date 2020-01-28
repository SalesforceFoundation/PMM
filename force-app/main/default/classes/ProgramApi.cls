public class ProgramApi implements Callable {
    @TestVisible
    private ProgramService programService = new ProgramService();

    public Object call(String action, Map<String, Object> args) {
        if (args.get('programService') != null) {
            this.programService = (ProgramService) args.get('programService');
        }

        switch on action {
            when 'getProgramsForContact' {
                if (args.get('contactId') instanceof Id) {
                    return this.programService.getProgramNamesByIdForContact(
                        (Id) args.get('contactId')
                    );
                } else {
                    throw new InvalidArgumentTypeException('Invalid argument');
                }
            }
            when else {
                throw new ExtensionMalformedCallException('Method not implemented');
            }
        }
    }

    public class ExtensionMalformedCallException extends Exception {
    }
    public class InvalidArgumentTypeException extends Exception {
    }
}
