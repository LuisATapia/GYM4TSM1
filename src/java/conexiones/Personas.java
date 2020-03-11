package conexiones;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;


public class Personas {    
    private Conexion con;
    private String id_persona;
    private String nombre;
    private String apellidos;
    private String curp;
    private String experiencia;
    private String observaciones;
    private String passwd;
    private int tipo_usuario;
    private String palabra_clave;

    public Personas ()
    {
        
    }

    public Personas(String id_persona, String nombre, String apellidos, String experiencia, String observaciones) {
        this.id_persona = id_persona;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.curp = curp;
        this.experiencia = experiencia;
        this.observaciones = observaciones;
    }
    
    public String getPalabra_clave() {
        return palabra_clave;
    }

    public void setPalabra_clave(String palabra_clave) {
        this.palabra_clave = palabra_clave;
    }
    
    public String getId_persona() {
        return id_persona;
    }

    public void setId_persona(String id_persona) {
        this.id_persona = id_persona;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public String getExperiencia() {
        return experiencia;
    }

    public void setExperiencia(String experiencia) {
        this.experiencia = experiencia;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public int getTipo_usuario() {
        return tipo_usuario;
    }

    public void setTipo_usuario(int tipo_usuario) {
        this.tipo_usuario = tipo_usuario;
    }
    public String getObservaciones(){
        return observaciones;
    }
    public void setObservaciones (String observaciones)
    {
        this.observaciones=observaciones;
    }
    
     public ArrayList<Personas> obtenerPersonas() {
        ArrayList<Personas> lstPersonas = new ArrayList<>();
        try {
            con = new Conexion();
            final String SQL="SELECT id_persona,nombre,apellidos,experiencia,observaciones FROM personas WHERE tipo_usuario=0";
            PreparedStatement sentencia=con.obtenerConexion().prepareStatement(SQL);
            ResultSet record=sentencia.executeQuery();
            while (record.next())
            {
            lstPersonas.add(new Personas(record.getString("id_persona"), record.getString("nombre"), record.getString("apellidos"), record.getString("experiencia"), record.getString("observaciones")));
            }
            return lstPersonas;
        }catch (Exception e)
        {
            System.out.println(e);
        }
        return lstPersonas;
     }
    
     public void mostrarInformacion()
     {
         try{
            con=new Conexion();
            final String SQL="SELECT nombre,apellidos,observaciones,passwd FROM personas WHERE id_persona=?";
            PreparedStatement  sentencia= con.obtenerConexion().prepareStatement(SQL);
            sentencia.setInt(1,Integer.parseInt(id_persona));
            ResultSet record=sentencia.executeQuery();
            while (record.next())
            {
                nombre=record.getString("nombre");
                apellidos=record.getString("apellidos");
                observaciones=record.getString("observaciones");
                passwd=record.getString("passwd");
                setNombre(nombre);
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
     }
     
    public void registrarPersona()
    {
        try{
            con = new Conexion();
            final String SQL="SELECT * FROM personas where curp=?";
            PreparedStatement  sentencia= con.obtenerConexion().prepareStatement(SQL);
            sentencia.setString(1,curp);
            ResultSet record=sentencia.executeQuery();
            if (record.next()==true)
            {
                //JOptionPane.showMessageDialog(null,"El registro ya existe");
                System.out.println("<script> alert('¡Alerta!')</script>");
            }else
            {
                try {
            if (getPalabra_clave().equals("F6E8805E02"))
                    {
                    final String INYECCION= "SELECT insertar_persona (?,?,?,?,?,?,?);";
            sentencia= con.obtenerConexion().prepareStatement(INYECCION);
            sentencia.setString(1,nombre);
            sentencia.setString(2,apellidos);
            sentencia.setString(3,curp);
            sentencia.setString(4,experiencia);
            sentencia.setString(5,observaciones);
            sentencia.setString(6,passwd);
            sentencia.setInt(7,1);
             record = sentencia.executeQuery();
                    }
                    else{
                    final String INYECCION= "SELECT insertar_persona (?,?,?,?,?,?,?);";
            sentencia= con.obtenerConexion().prepareStatement(INYECCION);
            sentencia.setString(1,nombre);
            sentencia.setString(2,apellidos);
            sentencia.setString(3,curp);
            sentencia.setString(4,experiencia);
            sentencia.setString(5,observaciones);
            sentencia.setString(6,passwd);
            sentencia.setInt(7,0);
             record = sentencia.executeQuery();
                    }
        }catch (Exception e){
            System.out.println(e);
        }
            }
        }catch(Exception e){
            
        }
    }
    public void extraerId()
    {
        try{
            con = new Conexion();
            final String SQL="SELECT id_persona FROM personas where curp=? AND passwd=?";
            PreparedStatement  sentencia= con.obtenerConexion().prepareStatement(SQL);
            sentencia.setString(1,curp);
            sentencia.setString(2,passwd);
            ResultSet record=sentencia.executeQuery();
            while (record.next())
            {
                id_persona=record.getString("id_persona");
                //apellidos=record.getString("apellidos");
                setId_persona(id_persona);
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public void validarUsuario()
    {
       try{
            con = new Conexion();
            final String SQL="SELECT tipo_usuario FROM personas where curp=? AND passwd=?";
            PreparedStatement  sentencia= con.obtenerConexion().prepareStatement(SQL);
            sentencia.setString(1,curp);
            sentencia.setString(2,passwd);
            ResultSet record=sentencia.executeQuery();
            while (record.next())
            {
                tipo_usuario=record.getInt("tipo_usuario");
                //apellidos=record.getString("apellidos");
                setTipo_usuario(tipo_usuario);
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public void modificarPersona()
         {
            try {
            con = new Conexion ();
            final String SQL= "UPDATE personas  SET nombre=?,apellidos=?, observaciones=?, passwd=? WHERE id_persona=?;";
            PreparedStatement  sentencia= con.obtenerConexion().prepareStatement(SQL);
            sentencia.setString(1,nombre);
            sentencia.setString(2,apellidos);
            sentencia.setString(3,observaciones);
            sentencia.setString(4,passwd);
            sentencia.setInt(5,Integer.parseInt(id_persona));
            //ResultSet record = sentencia.executeUpdate();
            int record = sentencia.executeUpdate();
        }catch (Exception e)
        {
            System.out.println(e);
        } 
         }
    public void eliminarPersona()
    {
        try{
            con = new Conexion();
            final String SQL="SELECT * FROM personas where curp=?";
            PreparedStatement  sentencia= con.obtenerConexion().prepareStatement(SQL);
            sentencia.setString(1,curp);
            ResultSet record=sentencia.executeQuery();
            if (record.next()==true)
            {
                try {
            final String INYECCION= "DELETE * FROM personas WHERE curp=?;";
            sentencia= con.obtenerConexion().prepareStatement(INYECCION);
            sentencia.setString(1,nombre);
            record = sentencia.executeQuery();
        }catch (Exception e){
            System.out.println(e);
        }
            }else
            {
                System.out.println("No existe");
            }
        }catch(Exception e){  
        }
    }
}
