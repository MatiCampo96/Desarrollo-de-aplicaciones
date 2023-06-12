<% 
try {
    String idEliminar = request.getParameter("eliminar");
    if (idEliminar != null && !idEliminar.isEmpty()) {
        String query = "DELETE FROM cursos WHERE id = '" + idEliminar + "'";
        AlumnoRepository alumnoRepository = new AlumnoRepository();

        long cantidadAlumnos = ((List<Alumno>)alumnoRepository.getAll())
                                .stream()
                                .filter(alumno -> alumno.getidCurso() == Integer.parseInt(idEliminar))
                                .count();

        if (cantidadAlumnos == 0) {
            Connection connection = Connector.getConnection();
            Statement statement = connection.createStatement();
            statement.executeUpdate(query);
            out.println("El curso se eliminó correctamente.");
        } else {
            out.println("No puede eliminar un curso con alumnos.");
        }
    } else {
        out.println("El parámetro 'eliminar' es nulo o vacío.");
    }
} catch (Exception e) {
    System.out.println("************************************");
    System.out.println("CursosDelete" +e);
    System.out.println("************************************");
}
%>