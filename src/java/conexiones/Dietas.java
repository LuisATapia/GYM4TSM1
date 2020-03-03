package conexiones;

import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Dietas {
    private Conexion con;
    private String dieta;
    private int id_cliente;
    private int id_entrenador;

    public String getDieta() {
        return dieta;
    }

    public void setDieta(String dieta) {
        this.dieta = dieta;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public int getId_entrenador() {
        return id_entrenador;
    }

    public void setId_entrenador(int id_entrenador) {
        this.id_entrenador = id_entrenador;
    }
    
    public void registrarDieta()
    {
         try {
            con = new Conexion ();
            final String SQL= "SELECT insertar_dieta (?,?,?);";
            PreparedStatement  sentencia= con.obtenerConexion().prepareStatement(SQL);          
            sentencia.setInt(1,id_cliente);
            sentencia.setInt(2,id_entrenador);
            sentencia.setString(3,dieta);
            ResultSet record = sentencia.executeQuery();
        }catch (Exception e)
        {
            System.out.println(e);
        }
    }
}
