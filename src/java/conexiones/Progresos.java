package conexiones;

import java.awt.SystemColor;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;


public class Progresos {
    private Conexion con;
    private String id_persona;
    private String id_progreso;
    private String id_cliente;
    private String fecha_captura;
    private double peso;
    private double altura;
    
    public Progresos(){}

    public Progresos( String fecha_captura, double peso, double altura) {
        this.fecha_captura = fecha_captura;
        this.peso = peso;
        this.altura = altura;
    }

    public String getId_persona() {
        return id_persona;
    }

    public void setId_persona(String id_persona) {
        this.id_persona = id_persona;
    }

    public String getId_progreso() {
        return id_progreso;
    }

    public void setId_progreso(String id_progreso) {
        this.id_progreso = id_progreso;
    }

    public String getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(String id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getFecha_captura() {
        return fecha_captura;
    }

    public void setFecha_captura(String fecha_captura) {
        this.fecha_captura = fecha_captura;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }
    
    public ArrayList<Progresos> obtenerProgresos() {
        ArrayList<Progresos> lstProgresos = new ArrayList<>();
        try {
            con = new Conexion(); 
            final String SQL="SELECT fecha_captura,peso,estatura FROM progresos WHERE id_persona=?";
            PreparedStatement sentencia=con.obtenerConexion().prepareStatement(SQL);  
            System.out.println(id_cliente);
            if(id_cliente==null || id_cliente.equals("") ){id_cliente="0";}
            sentencia.setInt(1,Integer.parseInt(id_cliente));
            ResultSet record=sentencia.executeQuery();
            while (record.next())
            {
            lstProgresos.add(new Progresos(record.getString("fecha_captura"), record.getDouble("peso"), record.getDouble("estatura")));
            }
            return lstProgresos;
        }catch (Exception e)
        {
            System.out.println(e);
        }
        return lstProgresos;
     }
    
    public void registrarProgreso()
    {
        try {
            con = new Conexion ();
            final String SQL= "SELECT insertar_progreso (?,?,?);";
            PreparedStatement  sentencia= con.obtenerConexion().prepareStatement(SQL);
            System.out.println(id_cliente);
            sentencia.setInt(1,Integer.parseInt(id_cliente));
            sentencia.setDouble(2,peso);
            sentencia.setDouble(3,altura);
            sentencia.execute();
        }catch (Exception e)
        {
            System.out.println(e);
        }
    }
    
    public void eliminarProgreso()
    {
        try {
            con = new Conexion ();
            final String SQL= "DELETE * FROM  progresos WHERE id_cliente=? AND id_progreso=?;";
            PreparedStatement  sentencia= con.obtenerConexion().prepareStatement(SQL);
           /* sentencia.setInt(1,id_cliente);
            sentencia.setInt(2,id_progreso);*/
            ResultSet record = sentencia.executeQuery();
        }catch (Exception e)
        {
            System.out.println(e);
        }
    }
}
