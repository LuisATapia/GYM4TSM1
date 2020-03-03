package conexiones;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

/**
 *
 * @author LuisAngel
 */
public class Inscripciones {
    
    private Conexion con;
    private String id_inscripcion;
    private String fecha_inicio;
    private String fecha_fin;
    private String id_pago;
    private String id_cliente;
    private int dias;

    public int getDias() {
        return dias;
    }

    public void setDias(int dias) {
        this.dias = dias;
    }
    
    

    public String getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(String id_cliente) {
        this.id_cliente = id_cliente;
    }
    
    

    public String getId_inscripcion() {
        return id_inscripcion;
    }

    public void setId_inscripcion(String id_inscripcion) {
        this.id_inscripcion = id_inscripcion;
    }

    public String getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(String fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public String getFecha_fin() {
        return fecha_fin;
    }

    public void setFecha_fin(String fecha_fin) {
        this.fecha_fin = fecha_fin;
    }

    public String getId_pago() {
        return id_pago;
    }

    public void setId_pago(String id_pago) {
        this.id_pago = id_pago;
    }
    
    public void extraerFechas ()
    {
        try {
            con= new Conexion();
            /*final String SQL="SELECT fecha_inicio - fecha_termino FROM inscripciones ins\n" +
                              "INNER JOIN pagos pa ON pa.id_pago=ins.id_pago WHERE id_cliente=?";*/
            final String SQL="SELECT fecha_termino - (SELECT current_date) FROM inscripciones ins\n" +
            "INNER JOIN pagos pa ON pa.id_pago=ins.id_pago WHERE id_cliente=? ORDER BY pa.id_pago DESC LIMIT 1";
            PreparedStatement sentencia = con.obtenerConexion().prepareStatement(SQL);
            sentencia.setInt(1,Integer.parseInt(id_cliente));
            ResultSet record = sentencia.executeQuery();
            while (record.next())
            {
                //fecha_inicio=record.getString("fecha_inicio");
                //fecha_fin=record.getString("fecha_termino");
                dias=record.getInt(1);
            }
        }catch(Exception e)
        {
            System.out.println(e);
        }
    }
    
}
