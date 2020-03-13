package conexiones;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
public class Validaciones {
    
    public boolean validarNombre (String nombre)
    {
        boolean rstnombre;
        if (nombre.isEmpty()||nombre.length()<3||nombre.length()>25||nombre.equals("")||nombre.equals("0"))
        {
            rstnombre=false;
        }else 
        {
            rstnombre=true;
        }
        System.out.println(rstnombre);
        return rstnombre;
    }
    
    public void letrasM(String algo){
     
        System.out.println(algo.toUpperCase());
        
    }
    
    
    public boolean validarApellidos (String apellidos){
        boolean rstApellidos;
        if(apellidos.isEmpty() || apellidos.length()<3 || apellidos.length()>25){
            rstApellidos=false;
        }else{
                rstApellidos=true;
                }
        System.out.println(rstApellidos);
        return rstApellidos; 
   }

    
    public boolean validarContraseña (String correo){
        boolean rstcontra;
        if(correo.isEmpty() || correo.length()<8 || correo.length()>20){
            rstcontra=false;
            System.out.println("la contraseña es invalida");
        }else{
                rstcontra=true;
                System.out.println("la contraseña es valido");
                }
        //System.out.println(rstcontra);
        return rstcontra; 
   }
    
    public boolean validarEmail(String email) {
        boolean co;
        Pattern pattern = Pattern
                .compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                        + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");

        // El email a validar

        Matcher mather = pattern.matcher(email);

        if (mather.find() == true) {
            System.out.println("El email ingresado es válido.");
            co=true;
        } else {
            System.out.println("El email ingresado es inválido.");
            co=false;
        }
    
        return co;
   
    }
    
<<<<<<< HEAD

    public boolean soloL(String letras){
        boolean co;
    Pattern pat = Pattern.compile("[a-zA-Z]{5,10}");
     Matcher mat = pat.matcher(letras);
=======
    public boolean soloN(String letras){
        boolean co;
        Pattern pat = Pattern.compile("[a-zA-Z]{3,25}");

        Matcher mat = pat.matcher(letras);
        if (mat.matches()) {
             System.out.println("SI n");
            co = true;
     } else {
         System.out.println("NO n");
         co = false;
     }
        //System.out.println(co);
     return co; 
    }
    public boolean soloP(String apellido){
        boolean co;
Pattern pat = Pattern.compile("[a-zA-Z]{3,25}");

     Matcher mat = pat.matcher(apellido);
>>>>>>> 0b59be19ef6440401fbccf40a939b227da9f76db
     if (mat.matches()) {
         System.out.println("SI ap");
         co = true;
     } else {
         System.out.println("NO ap");
         co = false;
     }
        System.out.println(co);
     return co; 
    }
    
    public static void main (String [] args)
    {
        Validaciones v = new Validaciones();
        /*v.validarNombre("Rogelio");
        v.validarApellidos("Diaz Moreno");
        v.validarEmail("1kv.diaz.moreno.rogelio@hotmail.com");
        v.validarContraseña("Rogelio3011");
        v.letrasM("rogelio");
        v.soloN("rogelio");*/
        System.out.println("----------------------------------");
            String nombre="LuisAs";
            String apellidos="Tapia";
            String curp="angeltapia2a@gmail.com";
            String exp="1 año";
            String ob="...";
            String clave="123";
            String pass="Tapia123";
        if (v.soloN(nombre)==true && v.soloP(apellidos) && v.validarEmail(curp)==true && v.validarContraseña(pass)==true)
        {
            System.out.println("Si funciona D:");
        }else
        {
            
        }
    }
}
