public with sharing class PetBO {
    
    public static void preenchePeriodicidadeVacinacao(List<Pet__c> lstPetsTrigger) {
        
        List<Pet__c> lstPets = new List<Pet__c>();
        for(Pet__c pet : lstPetsTrigger){
            lstPets.add(pet);
        }
        Map<String, Integer> mapPeriodicidadeVacinacao = PeriodicidadeVacinacaoBO.getIntervaloVacinacaoPorEspecie();

        for(Pet__c pet : lstPets){
            Integer intervaloVacinacao = mapPeriodicidadeVacinacao.get(pet.Especie__c);
            pet.DataProximaVacinacao__c = Date.today().addDays(intervaloVacinacao);
        }

    }
}