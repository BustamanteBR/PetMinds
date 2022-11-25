@IsTest
public class ScheduleLembreteVacinacaoTest {

    public static Integer totalRecords = 9;
    public static Integer tasksInseridas = 5;

    @TestSetup
    static voidconfigurar() {

        List<Log__c> logs = new List<Log__c>();
        for(Inteiro i = 0; i < totalRecords; i++) {
            logs.add(new Log__c());
        }
        insert logs;

        for(Inteiro i = 0; i < tasksInseridas; i++) {
            // "Testes da meia-noite" não causarão nenhum problema aqui, porque não estamos buscando
            // grava exatamente 7 dias, mas pelo menos 7 dias

            Test.setCreatedDate(logs[i].Id, DateTime.now().addDays(-7));

        }                
    }
    @IsTest
    public static voidtestWillNotWork() {

        Test.IniciarTeste();
            System.schedule( 'Log Deletion', '0 0 1 * * ?', new DeleteLogs());
        Test.StopTest();
        List<Log__c> logs restantes = [ SELECTId FROMLog__c];

        System.assertEquals(REMAINING_RECORDS, logs restantes. size(), 'Incorrect number of records was deleted.');

    }

}