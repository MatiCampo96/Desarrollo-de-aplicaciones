
<%@page import="ar.org.centro8.curso.java.server.repositories.CursoRepository"%>
<%@page import="ar.org.centro8.curso.java.server.entities.Curso"%>
<%@page import="ar.org.centro8.curso.java.server.entities.Alumno"%>
<%@page import="ar.org.centro8.curso.java.server.repositories.AlumnoRepository"%>


<%@page import="java.util.List"%>
<%
    try {
        String buscarTitulo = "";
        if (request.getParameter("buscarTitulo") != null) {
            buscarTitulo = request.getParameter("buscarTitulo");
        }

        String query = "SELECT * FROM cursos WHERE titulo LIKE '%" + buscarTitulo + "%'";
        ResultSet rs2 = Connector.getConnection().createStatement().executeQuery(query);

        out.println("<table border='1'>");
        out.println("<tr><th>Id</th><th>Título</th><th>Profesor</th><th>Día</th><th>Turno</th><th>Cant Alumnos</th><th>Eliminar</th></tr>");

        while (rs2.next()) {
            int cursoId = rs2.getInt("id");
            String titulo = rs2.getString("titulo");
            String profesor = rs2.getString("profesor");
            String dia = rs2.getString("dia");
            String turno = rs2.getString("turno");

            CursoRepository cursoRepository = new CursoRepository();
            int cantAlumnos = cursoRepository.getCantidadAlumnosPorCurso(cursoId);


            out.println("<tr>");
            out.println("<td>" + cursoId + "</td>");
            out.println("<td>" + titulo + "</td>");
            out.println("<td>" + profesor + "</td>");
            out.println("<td>" + dia + "</td>");
            out.println("<td>" + turno + "</td>");
            out.println("<td>" + cantAlumnos + "</td>");
            out.println("<td>");
            out.println("<form method='post'>");
            out.println("<input type='hidden' name='eliminar' value='" + cursoId + "'>");
            out.println("<input type='submit' value='Eliminar'>");
            out.println("</form>");
            out.println("</td>");
            out.println("</tr>");
        }

        out.println("</table>");

        rs2.close();
    } catch (Exception e) {
        System.out.println("El problema con cursos table es: "+ e);
    }
%>