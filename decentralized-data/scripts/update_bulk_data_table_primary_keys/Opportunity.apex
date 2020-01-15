// Make Names unique
final List<Opportunity> allOpportunities = [
    SELECT Id, Name
    FROM Opportunity
    ORDER BY Id
];

Map<String, List<Opportunity>> opportunitiesByName = new Map<String, List<Opportunity>>();

for (Opportunity opportunity : allOpportunities) {

    List<Opportunity> opportunities = opportunitiesByName.get(opportunity.Name);
    if (opportunities == null) {
        opportunities = new List<Opportunity>();
        opportunitiesByName.put(opportunity.Name, opportunities);
    }

    opportunities.add(opportunity);
}

final List<Opportunity> opportunitiesToUpdate = new List<Opportunity>();
for (String name : opportunitiesByName.keyset()) {
    final List<Opportunity> opportunities = opportunitiesByName.get(name);
    final Integer size = opportunities.size();
    
    if (1 < size) {
        for (Integer i = 0; i < size; i ++) {
            opportunities[i].Name = String.format(
                '{0}-{1}',
                new List<String> {
                    name,
                    String.valueOf(i)
                }
            );

            opportunitiesToUpdate.add(opportunities[i]);
        }
    }
}

update opportunitiesToUpdate;