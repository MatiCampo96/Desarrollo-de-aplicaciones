package ar.org.centro8.curso.java.server.test;


import java.sql.Connection;

import ar.org.centro8.curso.java.server.conectores.Connector;

public class TestConnector {
    public static void main(String[] args) {
        try(Connection conn=Connector.getConnection()) {
            conn.createStatement().executeQuery("select version()");
        } catch (Exception e) {
            System.out.println("TestConection" + e);
        }
    }
}
