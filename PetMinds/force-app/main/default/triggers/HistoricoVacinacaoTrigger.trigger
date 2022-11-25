trigger HistoricoVacinacaoTrigger on HistoricoVacinacao__c (after insert) {

    if(Trigger.isAfter){
       HistoricoVacinacaoBO.InsereUltimaDataVacinacao(Trigger.new);
    }
    
}