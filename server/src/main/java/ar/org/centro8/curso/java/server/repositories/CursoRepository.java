package ar.org.centro8.curso.java.server.repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ar.org.centro8.curso.java.server.conectores.Connector;
import ar.org.centro8.curso.java.server.entities.Alumno;
import ar.org.centro8.curso.java.server.entities.Curso;
import ar.org.centro8.curso.java.server.enums.Dia;
import ar.org.centro8.curso.java.server.enums.Turno;

public class CursoRepository {
    private Connection conn=Connector.getConnection();

    public void save(Curso curso){
        if(curso==null) return;
        try (PreparedStatement ps=conn.prepareStatement(
            "insert into cursos (titulo, profesor, dia, turno) values (?,?,?,?)",
            PreparedStatement.RETURN_GENERATED_KEYS)){
            ps.setString(1, curso.getTitulo());
            ps.setString(2, curso.getProfesor());
            ps.setString(3, curso.getDia().toString());
            ps.setString(4, curso.getTurno().toString());
            ps.execute();
            ResultSet rs=ps.getGeneratedKeys();
            if(rs.next()) curso.setId(rs.getInt(1));
        } catch (Exception e) {
            System.out.println("CursosSave: " +e);
        }
    }

    public List<Curso>getAll(){
        List<Curso>list=new ArrayList();
        try (ResultSet rs=conn.createStatement().executeQuery("select * from cursos")){
            while(rs.next()){
                list.add(new Curso(
                    rs.getInt("id"), 
                    rs.getString("titulo"), 
                    rs.getString("profesor"), 
                    Dia.valueOf(rs.getString("dia")), 
                    Turno.valueOf(rs.getString("turno"))
                ));
            }
        } catch (Exception e) {
            System.out.println("CursosGetAll: " + e);
        }
        return list;
    }

    public List<Curso>getLikeTitulo(String titulo){
        if(titulo==null) return new ArrayList();
        return getAll()
                        .stream()
                        .filter(c->c.getTitulo().toLowerCase().contains(titulo.toLowerCase()))
                        .toList();
    }
    public int getCantidadAlumnosPorCurso(int cursoId) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int cantidadAlumnos = 0;

        try {
            connection = Connector.getConnection();
            String query = "SELECT COUNT(*) FROM alumnos WHERE idCurso = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, cursoId);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                cantidadAlumnos = resultSet.getInt(1);
            }
        // }  finally {
        //     // Cerrar los recursos de base de datos en el orden inverso a su apertura
        //     if (resultSet != null) {
        //         resultSet.close();
        //     }
        //     if (statement != null) {
        //         statement.close();
        //     }
        //     if (connection != null) {
        //         connection.close();
        //     }
        // }
        } catch (Exception e) {
            System.out.println("El problema para obtener alumnos por cursos es: "+e);
        }

        return cantidadAlumnos;
    }


}
