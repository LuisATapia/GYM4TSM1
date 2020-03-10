package conexiones;


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

    public boolean validarCorreo (String correo){
        boolean rstcorreo;
        if(correo.isEmpty() || correo.length()<5 || correo.length()>40){
            rstcorreo=false;
        }else{
                rstcorreo=true;
                }
        System.out.println(rstcorreo);
        return rstcorreo; 
   }
    public boolean validarContraseña (String correo){
        boolean rstcontra;
        if(correo.isEmpty() || correo.length()<8 || correo.length()>12){
            rstcontra=false;
        }else{
                rstcontra=true;
                }
        System.out.println(rstcontra);
        return rstcontra; 
   }
    
    
    public static void main (String [] args)
    {
        Validaciones v = new Validaciones();
        v.validarNombre("Rogelio");
        v.validarApellidos("Diaz Moreno");
        v.validarCorreo("1kv.diaz.moreno.rogelio@gmail.com");
        v.validarContraseña("Rogelio3011");
    }
}
