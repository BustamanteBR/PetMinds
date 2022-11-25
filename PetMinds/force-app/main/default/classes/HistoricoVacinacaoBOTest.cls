@isTest
public class HistoricoVacinacaoBOTest {

    public static Date hoje { 
        get { return Date.today(); } 
        set { hoje = value; }
    }
    
    @TestSetup
    static void makeData(){
        Pet__c pet = new Pet__c();
        pet.Name = 'Bilu';
        pet.Especie__c = 'Cachorro';
        pet.Raca__c = 'Vira-lata';
        insert pet;

        HistoricoVacinacao__c historico = new HistoricoVacinacao__c();
        historico.Pet__c = pet.Id;
        historico.Data__c = hoje;
        insert historico;
    }


    @isTest

    static void InsereUltimaDataVacinacaoValido(){
        List<HistoricoVacinacao__c> selHistorico = [SELECT Id, Pet__c, Data__c FROM HistoricoVacinacao__c ORDER BY Id];
        List<HistoricoVacinacao__c> lstHistorico = new List<HistoricoVacinacao__c>();
        lstHistorico.add(selHistorico.get(0));
        String messageError = ''; 

        Test.startTest();
                HistoricoVacinacaoBO.InsereUltimaDataVacinacao(lstHistorico);
                Pet__c pet = [SELECT Id, DataUltimaVacinacao__c FROM Pet__c];
            System.assertEquals(hoje, pet.DataUltimaVacinacao__c);
        Test.stopTest();
    }

    @isTest

    static void InsereUltimaDataVacinacaoInvalido(){
        List<HistoricoVacinacao__c> lstHistorico = new List<HistoricoVacinacao__c>();
        
        String messageError = ''; 

        Test.startTest();
            try {
                HistoricoVacinacaoBO.InsereUltimaDataVacinacao(lstHistorico);    
            } catch (Exception e) {
                messageError = e.getMessage();
            }
        Test.stopTest();
    }
}