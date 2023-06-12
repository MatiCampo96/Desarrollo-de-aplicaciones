<% 
    try{
            if (request.getParameter("eliminar") != null) {
    String idEliminar = request.getParameter("eliminar");
    String query = "DELETE FROM alumnos WHERE id = '" + idEliminar + "'";
    Connection connection = Connector.getConnection();
    Statement statement = connection.createStatement();
    statement.executeUpdate(query);
       }else{
            out.println("Debe ingresar parámetros correctos!");
       }
    }catch(Exception e){
        System.out.println("************************************");
        System.out.println("AlumnosDelete " + e);
        System.out.println("************************************");

    }
    %>