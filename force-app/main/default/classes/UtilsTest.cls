@isTest
public class UtilsTest {
    
    @isTest
    public static void ValidaCPFTest() {

        String cpfValue = '45323433051';
        String cpfValue2 = '102105900';

        
        Test.startTest();
        Boolean isCPFValid = Utils.ValidaCPF(cpfValue);
        Boolean isCPFValid2 = Utils.ValidaCPF(cpfValue2);
        Test.stopTest();

        System.assertEquals(true, isCPFValid, 'Não é um CPF válido');
        System.assertEquals(false, isCPFValid2, 'Não é um CPF válido');
        
    }
    @isTest
    public static void ValidaCNPJTest() {

        String cnpjValue = '73337757000149';
        String cnpjValue2 = '86355373000';

        
        Test.startTest();
        Boolean isCNPJValid = Utils.ValidaCNPJ(cnpjValue);
        Boolean isCNPJValid2 = Utils.ValidaCNPJ(cnpjValue2);
        Test.stopTest();

        System.assertEquals(true, isCNPJValid, 'Não é um CNPJ válido');
        System.assertEquals(false, isCNPJValid2, 'Não é um CNPJ válido');
    }
}
