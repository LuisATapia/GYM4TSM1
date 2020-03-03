package conexiones;

import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Pagos {
    private Conexion con;
    private int id_pago;
    private String id_cliente;
    private String fecha_pago;
    private String monto;
    private String paquete;

    public int getId_pago() {
        return id_pago;
    }

    public void setId_pago(int id_pago) {
        this.id_pago = id_pago;
    }

    public String getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(String id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getFecha_pago() {
        return fecha_pago;
    }

    public void setFecha_pago(String fecha_pago) {
        this.fecha_pago = fecha_pago;
    }

    public String getMonto() {
        return monto;
    }

    public void setMonto(String monto) {
        this.monto = monto;
    }

    public String getPaquete() {
        return paquete;
    }

    public void setPaquete(String paquete) {
        this.paquete = paquete;
    }
    
    public void registrarPago()
    {
        try {
            con = new Conexion ();
            final String SQL= "SELECT insertar_pagos (?,?,?);";
            PreparedStatement  sentencia= con.obtenerConexion().prepareStatement(SQL);          
            sentencia.setInt(1,Integer.parseInt(id_cliente));
            sentencia.setDouble(2,Double.parseDouble(monto));
            sentencia.setString(3,paquete);
            ResultSet record = sentencia.executeQuery();
        }catch (Exception e)
        {
            System.out.println(e);
        }
    }
    
    public void eliminarPago()
    {
        try {
            con = new Conexion ();
            final String SQL= "DELETE * FROM pago WHERE id_pago=?;";
            PreparedStatement  sentencia= con.obtenerConexion().prepareStatement(SQL);
            sentencia.setInt(1,id_pago);
            ResultSet record = sentencia.executeQuery();
        }catch (Exception e)
        {
            System.out.println(e);
        }
    }
}
