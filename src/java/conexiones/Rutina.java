package conexiones;

import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Rutina {
    private Conexion con;
    private String id_cliente;
    private String id_entrenador;
    private String lunes;
    private String martes;
    private String miercoles;
    private String jueves;
    private String viernes;
    private String sabado;
    private String domingo;

    public String getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(String id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getId_entrenador() {
        return id_entrenador;
    }

    public void setId_entrenador(String id_entrenador) {
        this.id_entrenador = id_entrenador;
    }

    public String getLunes() {
        return lunes;
    }

    public void setLunes(String lunes) {
        this.lunes = lunes;
    }

    public String getMartes() {
        return martes;
    }

    public void setMartes(String martes) {
        this.martes = martes;
    }

    public String getMiercoles() {
        return miercoles;
    }

    public void setMiercoles(String miercoles) {
        this.miercoles = miercoles;
    }

    public String getJueves() {
        return jueves;
    }

    public void setJueves(String jueves) {
        this.jueves = jueves;
    }

    public String getViernes() {
        return viernes;
    }

    public void setViernes(String viernes) {
        this.viernes = viernes;
    }

    public String getSabado() {
        return sabado;
    }

    public void setSabado(String sabado) {
        this.sabado = sabado;
    }

    public String getDomingo() {
        return domingo;
    }

    public void setDomingo(String domingo) {
        this.domingo = domingo;
    }
    
    public void registrarRutina()
    {
        try {
            con=new Conexion();
            final String SQL= "SELECT insertar_rutina (?,?,?,?,?,?,?,?,?);";
            PreparedStatement  sentencia= con.obtenerConexion().prepareStatement(SQL);
            //sentencia.executeUpdate(SQL);
            sentencia.setInt(1,Integer.parseInt(id_cliente));
            sentencia.setInt(2,Integer.parseInt(id_entrenador));
            sentencia.setString(3, lunes);
            sentencia.setString(4, martes);
            sentencia.setString(5, miercoles);
            sentencia.setString(6, jueves);
            sentencia.setString(7, viernes);
            sentencia.setString(8, sabado);
            sentencia.setString(9, "Dia de Descanso");
        ResultSet record = sentencia.executeQuery();
        }catch (Exception e)
        {
            System.out.println(e);
        }    
    }
    
    public void modificarRutina()
    {
        try {
            con=new Conexion();
            final String SQL= "SELECT modificar_rutina (?,?,?,?,?,?,?,?,?);";
            PreparedStatement  sentencia= con.obtenerConexion().prepareStatement(SQL);
            System.out.println(id_cliente);
            System.out.println(id_entrenador);
            sentencia.setInt(1, Integer.parseInt(id_cliente));
            sentencia.setInt(2, Integer.parseInt(id_entrenador));
            sentencia.setString(3, lunes);
            sentencia.setString(4, martes);
            sentencia.setString(5, miercoles);
            sentencia.setString(6, jueves);
            sentencia.setString(7, viernes);
            sentencia.setString(8, sabado);
            sentencia.setString(9, "Día Libre");
            int record = sentencia.executeUpdate();
            
        }catch(Exception e)
        {
            System.out.println(e);
        }
    }
    public void eliminarRutina()
    {
       try {
            con = new Conexion();

            final String SQL = "Delete From rutinas where id_cliente = ?";
            PreparedStatement sentencia = con.obtenerConexion().prepareStatement(SQL);

            sentencia.setInt(1,Integer.parseInt(id_cliente));
            sentencia.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void verRutinasSocios()
    {
        try{
            con = new Conexion();
            final String SQL="SELECT lunes,martes,miercoles,jueves,viernes,sabado,domingo,id_cliente FROM rutinas WHERE id_cliente=? ";
            PreparedStatement sentencia=con.obtenerConexion().prepareStatement(SQL);
            sentencia.setInt(1,Integer.parseInt(id_cliente));
            ResultSet record= sentencia.executeQuery();
            while (record.next())
            {
                lunes=record.getString("lunes");
                martes=record.getString("martes");
                miercoles=record.getString("miercoles");
                jueves=record.getString("jueves");
                viernes=record.getString("viernes");
                sabado=record.getString("sabado");
                id_cliente=record.getString("id_cliente");
            }
        }catch (Exception e)
        {
            System.out.println(e);
        }
    }
    

}
