@isTest
public class TestDataFactory {
    public static void criarPet(String Name, String Especie__c, String Raca__c) {
        Pet__c objPet = new Pet__c();
        objPet.Name = Name;
        objPet.Especie__c = Especie__c;
        objPet.Raca__c = Raça__c;
        insert objPet;
    }

    public static void criarContato(String name) {
        Contact objContato = new Contact();
        objContato.Name = name;

        insert objContato;
      }

    public static User gerarUsuario(Boolean opcaoDml, String strPerfil) {
        Profile objPerfil =[SELECT Id, Name FROM Profile WHERE Name =: strPerfil LIMIT 1 ];
        Long currentTimeMillis = System.currentTimeMillis();
        String emailUsuario = 'email+' + currentTimeMillis + '@petminds.com';
        User usuarioComPapel = new User(
          FirstName = 'Nome',
          LastName = 'Sobrenome',
          Email = emailUsuario,
          Username = emailUsuario + '.' + currentTimeMillis,
          CompanyName = 'Everymind',
          Title = 'Desenvolvedor',
          Alias = 'nomsob',
          TimeZoneSidKey = 'America/Sao_Paulo',
          EmailEncodingKey = 'UTF-8',
          LanguageLocaleKey = 'pt_BR',
          LocaleSidKey = 'pt_BR',
          ProfileId = objPerfil.Id
        );
        if (opcaoDml)
          insert usuarioComPapel;
        return usuarioComPapel;
      }
      public static void atribuirPermissionSetToUser(User user, String permissionSetName) {
          PermissionSet ps = [SELECT Id FROM PermissionSet WHERE Name = :permissionSetName];
          PermissionSetAssignment psa = new PermissionSetAssignment();
          psa.AssigneeId = user.Id;
          psa.PermissionSetId = ps.Id;
          insert psa;
      }
}
