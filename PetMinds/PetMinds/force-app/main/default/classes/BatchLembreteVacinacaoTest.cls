@isTest
public class BatchLembreteVacinacaoTest {
    @testSetup
    static void makeData() {

        List<Pet__c> pets = new List<Pet__c>();
        
        Pet__c pet0 = new Pet__c();
        pet0.Name ='pet';
        pet0.OwnerId ='0058c000007LN56AAG';
        pet0.Especie__c = 'Cachorro';
        pet0.Raca__C = 'Vira-lata';
        pets.add(pet0);

        Pet__c pet1 = new Pet__c();
        pet1.Name ='pet1';
        pet1.OwnerId ='0058c000007LN56AAG';
        pet1.Especie__c = 'Cachorro';
        pet1.Raca__C = 'Vira-lata';
        pets.add(pet1);
        
        Pet__c pet2 = new Pet__c();
        pet2.Name ='pet2';
        pet2.OwnerId ='0058c000007LN56AAG';
        pet2.Especie__c = 'Cachorro';
        pet2.Raca__C = 'Vira-lata';
        pets.add(pet2); 
        
        Pet__c pet3= new Pet__c();
        pet3.Name ='pet3';
        pet3.OwnerId ='0058c000007LN56AAG';
        pet3.Especie__c = 'Cachorro';
        pet3.Raca__C = 'Vira-lata';
        pets.add(pet3); 

        insert pets;

        pet0.DataProximaVacinacao__c = Date.newInstance(2022, 05, 12);
        pet1.DataProximaVacinacao__c = Date.newInstance(2022, 05, 28);
        pet2.DataProximaVacinacao__c = null;
        pet3.DataProximaVacinacao__c = Date.newInstance(2022, 05, 14);
        
    
        update pets;
    }

    @isTest 
    static void test() {
        String messageError= '';
        
        
        List<Pet__c> pets = [SELECT Id, Name, OwnerId, DataUltimaVacinacao__c, DataProximaVacinacao__c FROM Pet__c];
        System.debug(pets);
         
        Test.startTest();
        BatchLembreteVacinacao batch = new BatchLembreteVacinacao();
        Database.executeBatch(batch);
        Test.stopTest();
    }
}