public with sharing class PeriodicidadeVacinacaoBO {
    
    public static Map<String, Integer> getIntervaloVacinacaoPorEspecie(){
        
        Map<String, Integer> mapEspecieIntervaloEmDias = new Map<String, Integer>();

        List<PeriodicidadeVacinacao__mdt> lstPeriodicidadeVacinacao = PeriodicidadeVacinacaoDAO.getPeriodicidadeVacinacao();
        for(PeriodicidadeVacinacao__mdt periodicidadeVacinacao : lstPeriodicidadeVacinacao){
            Integer intervaloDias = Integer.valueOf(periodicidadeVacinacao.IntervaloDias__c);
            mapEspecieIntervaloEmDias.put(periodicidadeVacinacao.Especie__c, intervaloDias);
        }
        return mapEspecieIntervaloEmDias;
    }
}