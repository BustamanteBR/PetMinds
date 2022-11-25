@isTest
public class PetBOTest {

    @TestSetup
    private static void makeData(){
        Pet__c pet = new Pet__c();
        pet.Name = 'Bilu';
        pet.Especie__c = 'Cachorro';
        pet.Raca__c = 'Vira-lata';
        insert pet;
    }

    @isTest

    static void preenchePeriodicidadeVacinacaoValido(){
        List<Pet__c> selPets = [SELECT Id, Name, Especie__c, Raca__c FROM Pet__c ORDER BY Id];
        List<Pet__C> lstPets = new List<Pet__c>();
        lstPets.add(selPets.get(0));
        String messageError = ''; 

        Test.startTest();
            try {
                PetBO.preenchePeriodicidadeVacinacao(lstPets);    
            } catch (Exception e) {
                messageError = e.getMessage();
            }
        Test.stopTest();
    }

    @isTest

    static void preenchePeriodicidadeVacinacaoInvalido(){
        List<Pet__c> lstPets = new List<Pet__c>();
        
        String messageError = ''; 

        Test.startTest();
            try {
                PetBO.preenchePeriodicidadeVacinacao(lstPets);    
            } catch (Exception e) {
                messageError = e.getMessage();
            }
        Test.stopTest();
    }
}