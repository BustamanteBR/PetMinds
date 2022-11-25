public class BatchLembreteVacinacao implements Database.Batchable<SObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, OwnerId, DataProximaVacinacao__c FROM Pet__c');
    }

    public void execute(Database.BatchableContext bc, List<Pet__c> lstPet) {
        List<Task> novaTarefa = new List<Task>();
        for(Pet__c pet : lstPet) {
            if(pet.DataProximaVacinacao__c == null || pet.DataProximaVacinacao__c < Date.today()) {
                novaTarefa.add(new Task(OwnerId = pet.OwnerId,
                                        ActivityDate = Date.today(),
                                        Subject = 'Vacinação do Pet não está em dia.',
                                        Priority = 'High'));
            }
        }
        insert novaTarefa;
    }
    public void finish(Database.BatchableContext bc){
    }
}