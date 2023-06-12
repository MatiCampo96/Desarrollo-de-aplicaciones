package ar.org.centro8.curso.java.server.repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ar.org.centro8.curso.java.server.conectores.Connector;
import ar.org.centro8.curso.java.server.entities.Alumno;

public class AlumnoRepository {
    private Connection conn=Connector.getConnection();

    public void save(Alumno alumno){
        if(alumno==null) return;
        try (PreparedStatement ps=conn.prepareStatement(
            "insert into alumnos (nombre, apellido, edad, idCurso) values (?,?,?,?)",
            PreparedStatement.RETURN_GENERATED_KEYS)){
            ps.setString(1, alumno.getNombre());
            ps.setString(2, alumno.getApellido());
            ps.setInt(3, alumno.getEdad());
            ps.setInt(4, alumno.getidCurso());
            ps.execute();
            ResultSet rs=ps.getGeneratedKeys();
            if(rs.next()) alumno.setId(rs.getInt(1));
        } catch (Exception e) {
            System.out.println("AlumnosSave: "+ e);
        }
    }

    public List<Alumno>getAll(){
        List<Alumno>list=new ArrayList();
        try (ResultSet rs=conn.createStatement().executeQuery("select * from alumnos")){
            while(rs.next()){
                list.add(new Alumno(
                    rs.getInt("id"), 
                    rs.getString("nombre"), 
                    rs.getString("apellido"), 
                    rs.getInt("edad"), 
                    rs.getInt("idCurso")
                ));
            }
        } catch (Exception e) {
            System.out.println("Alumnos GetAll: " +e);
        }
        return list;
    }

    public List<Alumno>getLikeApellido(String apellido){
        if(apellido==null) return new ArrayList();
        return getAll()
                        .stream()
                        .filter(c->c.getApellido().toLowerCase().contains(apellido.toLowerCase()))
                        .toList();
    }

}
