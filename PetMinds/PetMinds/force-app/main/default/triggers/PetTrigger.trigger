trigger PetTrigger on Pet__c (before insert) {

    if(Trigger.isBefore){
        PetBO.preenchePeriodicidadeVacinacao(Trigger.new);
    }
}