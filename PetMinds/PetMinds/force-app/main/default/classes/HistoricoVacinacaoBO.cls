public with sharing class HistoricoVacinacaoBO {

    public static void InsereUltimaDataVacinacao(List<HistoricoVacinacao__c> lstHistoricoTrigger){
        
        Map <Id, Date> mapDataUltimaVacinacaoPet = new Map<Id, Date>();

        for(HistoricoVacinacao__c historicoVacinacao : lstHistoricoTrigger){
            mapDataUltimaVacinacaoPet.put(historicoVacinacao.Pet__c, historicoVacinacao.Data__c);
        }

        Set<Id> setIdPets = mapDataUltimaVacinacaoPet.keySet();
        List<Pet__c> lstPets = PetDAO.getLstPets(setIdPets);
        Map<String, Integer> mapPeriodicidadeVacinacao = PeriodicidadeVacinacaoBO.getIntervaloVacinacaoPorEspecie();

        for(Pet__c pet : lstPets){
            Date dtUltimaVacina = mapDataUltimaVacinacaoPet.get(pet.Id);
            pet.DataUltimaVacinacao__c = dtUltimaVacina;
            Integer intervaloVacinacao = mapPeriodicidadeVacinacao.get(pet.Especie__c);
            pet.DataProximaVacinacao__c = dtUltimaVacina.addDays(intervaloVacinacao);
        }
        update lstPets;
    }
}