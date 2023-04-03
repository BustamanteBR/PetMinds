public with sharing class PeriodicidadeVacinacaoDAO {
    
    public static List<PeriodicidadeVacinacao__mdt> getPeriodicidadeVacinacao() {
        return [SELECT Especie__c, IntervaloDias__c FROM PeriodicidadeVacinacao__mdt];
    }
}