package ar.org.centro8.curso.java.server.test;

import java.sql.ResultSet;

import ar.org.centro8.curso.java.server.conectores.Connector;

public class TestCodigo {
    public static void main(String[] args) {
        try(ResultSet rs=Connector.getConnection().createStatement().executeQuery("select * from cursos")){
                //out.println("<table>");
                //out.println("<tr><th>Id</th><th>Titulo</th><th>Día</th><th>Turno</th></tr>")
                //out.println("</table>");
    }catch(Exception e){
        System.out.println("TestCodigo " + e);
    }
    }
}
