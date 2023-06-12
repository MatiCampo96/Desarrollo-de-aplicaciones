<%
    String buscarApellido = "";
    if (request.getParameter("buscarApellido") != null) {
        buscarApellido = request.getParameter("buscarApellido");
    }

    try (ResultSet rs2 = Connector.getConnection().createStatement().executeQuery(
            "SELECT * FROM alumnos WHERE apellido LIKE '%" + buscarApellido + "%'")) {

        out.println("<table border='1'>");
        out.println("<tr><th>Id</th><th>Nombre</th><th>Apellido</th><th>Edad</th><th>idCurso</th><th>Eliminar</th></tr>");

        while (rs2.next()) {
            int alumnoId = rs2.getInt("id");
            String nombre = rs2.getString("nombre");
            String apellido = rs2.getString("apellido");
            int edad = rs2.getInt("edad");
            int idCurso = rs2.getInt("idCurso");

            out.println("<tr>");
            out.println("<td>" + alumnoId + "</td>");
            out.println("<td>" + nombre + "</td>");
            out.println("<td>" + apellido + "</td>");
            out.println("<td>" + edad + "</td>");
            out.println("<td>" + idCurso + "</td>");
            out.println("<td>");
            out.println("<form method='post' >");
            out.println("<input type='hidden' name='eliminar' value='" + alumnoId + "'>");
            out.println("<input type='submit' value='Eliminar'>");
            out.println("</form>");
            out.println("</td>");
            out.println("</tr>");
        }

        out.println("</table>");

    } catch (Exception e) {
    System.out.println("alumnosTable" + e);
        }
%>