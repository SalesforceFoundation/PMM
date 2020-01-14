public class CallableApi implements Callable {
    Map<Id, String> getProgramsForContact(Id contactId) {
        Map<Id, String> programsForContact = new Map<Id, String>();

        for (
            ProgramEngagement__c pe : ProgramEngagementSelector.getProgramEngagementsByContactId(
                contactId
            )
        ) {
            programsForContact.put(pe.Program__c, pe.Program__r.Name);
        }
        return programsForContact;
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
