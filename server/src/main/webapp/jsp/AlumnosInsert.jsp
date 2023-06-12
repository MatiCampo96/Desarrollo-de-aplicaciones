<% 
try {
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String edadStr = request.getParameter("edad");
    String idCursoStr = request.getParameter("idCurso");

    if (nombre != null && apellido != null && edadStr != null && idCursoStr != null &&
        !nombre.isEmpty() && !apellido.isEmpty() && !edadStr.isEmpty() && !idCursoStr.isEmpty()) {

        int edad = Integer.parseInt(edadStr);
        int idCurso = Integer.parseInt(idCursoStr);

        Connection connection = Connector.getConnection();
        Statement statement = connection.createStatement();

        statement.execute("INSERT INTO alumnos (nombre, apellido, edad, idCurso) VALUES " +
                "('" + nombre + "', '" + apellido + "', " + edad + ", " + idCurso + ")");

        out.println("Se dio de alta un alumno!");
    } else {
        out.println("Debe ingresar parámetros correctos!");
    }
} catch (Exception e) {
    System.out.println("************************************");
    System.out.println("AlumnosInsert: " + e);
    System.out.println("************************************");
}
%>