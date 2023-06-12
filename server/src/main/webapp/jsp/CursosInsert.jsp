<%@page import="ar.org.centro8.curso.java.server.repositories.CursoRepository"%>
<%@page import="ar.org.centro8.curso.java.server.enums.Turno"%>
<%@page import="ar.org.centro8.curso.java.server.enums.Dia"%>
<%@page import="ar.org.centro8.curso.java.server.entities.Curso"%>
<%@page import="ar.org.centro8.curso.java.server.conectores.Connector"%>
<% 
        //Insert de cursos
        try{
           String titulo=request.getParameter("titulo");
           String profesor=request.getParameter("profesor");
           String dia=request.getParameter("dia");
           String turno=request.getParameter("turno");
           if(
                titulo!=null && profesor!=null && dia!=null && turno!=null &&
                titulo.length()!=0 && profesor.length()!=0 && 
                dia.length()!=0 && turno.length()!=0 
           ){
                Curso curso=new Curso(titulo,profesor,Dia.valueOf(dia),Turno.valueOf(turno));
                new CursoRepository().save(curso);
                out.println("Se dio de alta un curso!");
           }else{
                out.println("Debe ingresar parámetros correctos!");
           }
        }catch(Exception e){
            System.out.println("************************************");
            System.out.println(e);
            System.out.println("************************************");
            out.println("Debe ingresar parámetros correctos!(cursosInsert)");
        }
    %>