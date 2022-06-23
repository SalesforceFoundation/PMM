Set<Id> userIds = new Map<Id, User>([SELECT Id FROM User WHERE Alias = 'rosa']).keySet();
Set<Id> permSetIds = new Map<Id, PermissionSet>([SELECT Id FROM PermissionSet WHERE Name LIKE 'PMDM_%']).keySet();
delete [SELECT Id from PermissionSetAssignment WHERE PermissionSetId IN :permSetIds AND AssigneeId IN :userIds];