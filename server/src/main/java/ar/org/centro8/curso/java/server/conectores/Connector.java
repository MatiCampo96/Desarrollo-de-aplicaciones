package ar.org.centro8.curso.java.server.conectores;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connector {
    private static String driver="org.mariadb.jdbc.Driver";
    private static String url="jdbc:mariadb://db4free.net:3306/basegeneral";
    private static String user="basegeneral";
    private static String pass="basegeneral";
    private static Connection conn=null;
    private Connector(){}
    public static Connection getConnection(){
        try {
            if(conn==null || conn.isClosed()){
                Class.forName(driver);
                conn=DriverManager.getConnection(url, user, pass);
            }
        } catch (Exception e) {
            System.out.println("El problema de conexion es: "+ e);
        }  

        return conn;
    }

}
