trigger MatchSpouse on Contact (after insert, after update) {
    // Avoid recurive trigger
    If(TriggerMonitor.ExecutedTriggers.contains('MatchSpouse'))
        return;
    TriggerMonitor.ExecutedTriggers.add('MatchSpouse');

    // Gather spouse ids
    List<String> spouseIds = new List<String>();
    for (Contact c : Trigger.new){
        if (c.Spouse__c != null){
            spouseIds.add (c.Spouse__c);
        }
    }

    // Query spouses
    Map<id, Contact> spouses = new Map<id, Contact>([SELECT id FROM Contact WHERE id =: spouseIds]);

    // Set contacts to spouses
    for (Contact c : Trigger.new){
        if (c.Spouse__c != null && spouses.get(c.Spouse__c) != null){
            spouses.get(c.Spouse__c).Spouse__c = c.id;
        }
    }

    update spouses.values();
}