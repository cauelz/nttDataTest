public class Utils {
    
    public static Boolean ValidaCPF(String cpf) {
        if(cpf.length() == 11) {
            return true;
        } else {
            return false;
        }
    }

    public static Boolean ValidaCNPJ(String cnpj) {

        if(cnpj.length() == 14) {
            return true;
        } else {
            return false;
        }
    }
}
