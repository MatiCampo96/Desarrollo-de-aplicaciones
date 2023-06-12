package ar.org.centro8.curso.java.server.test;

import ar.org.centro8.curso.java.server.entities.Alumno;
import ar.org.centro8.curso.java.server.entities.Curso;
import ar.org.centro8.curso.java.server.enums.Dia;
import ar.org.centro8.curso.java.server.enums.Turno;
import ar.org.centro8.curso.java.server.repositories.AlumnoRepository;
import ar.org.centro8.curso.java.server.repositories.CursoRepository;

public class TestRepository {
    public static void main(String[] args) {
        CursoRepository cr=new CursoRepository();
        Curso curso=new Curso("Jarrones Barro","Moreira",Dia.MARTES,Turno.NOCHE);
        cr.save(curso);
        System.out.println(curso);

        System.out.println("*******************************************");
        cr.getAll().forEach(System.out::println);
        System.out.println("*******************************************");
        cr.getLikeTitulo("herr").forEach(System.out::println);
        

        AlumnoRepository ar=new AlumnoRepository();
        Alumno alumno=new Alumno("Mauricio","Pashares",23,3);
        ar.save(alumno);
        System.out.println(alumno);

        System.out.println("*******************************************");
        ar.getAll().forEach(System.out::println);
        System.out.println("*******************************************");
        ar.getLikeApellido("pas").forEach(System.out::println);
        
    }
}
