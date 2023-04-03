public with sharing class PetDAO {

    public static List<Pet__c> getLstPets(Set<Id> setIdPets){
        return [SELECT Id, Name, Especie__c, DataUltimaVacinacao__c FROM Pet__c WHERE Id IN:setIdPets];
    }
}