
package conexiones;

import java.sql.Connection;
import java.sql.DriverManager;


public class Conexion {
    private Connection con;
    private String user,passwd,url;
    public Conexion ()
    {
        user="postgres";
        //Compu Tapia
        //passwd="s1ul1992";
        //url="jdbc:postgresql://localhost:5432/GYM";
        //cOMPU roger
        passwd="123456";
        url="jdbc:postgresql://localhost:5432/GYM";
        //LABORATORIO
        //passwd="BD";
        //url="jdbc:postgresql://localhost:5432/GYM";
    }
    public Connection obtenerConexion ()
    {
        try {
            Class.forName("org.postgresql.Driver");
                    return con=DriverManager.getConnection(url,user,passwd);
        }catch(Exception e)
                {
                e.printStackTrace();
                }
        return con=null;
    }
}
