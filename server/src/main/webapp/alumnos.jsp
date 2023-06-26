<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="ar.org.centro8.curso.java.server.conectores.Connector"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Colegio</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link href="/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="container-lg">
        <%@include file="jsp/menu.jsp" %>
    </div> 
    <h1 class="titulo">Formulario de alumnos</h1>
    <form method="post">
        <table>
            <tr>
                <td><label class="label">Nombre: </label></td>
                <td><input class="input" type="text" value="" name="nombre" minlength="2" maxlength="20" /></td>
            </tr>
            <tr>
                <td><label class="label">Apellido: </label></td>
                <td><input class="input" type="text" value="" name="apellido"  minlength="2" maxlength="20" /></td>
            </tr>
            <tr>
                <td><label class="label">Edad: </label></td>
                <td><input class="input" type="number" value="" name="edad" min="0" max="120" /></td>
            </tr>
            <tr>
                <td><label class="label">Curso: </label></td>
                <td><select class="input" aria-label="Cursos" name="idCurso" th:field="*{idCurso}">
                    <% 
                            Connection conn = Connector.getConnection();
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("SELECT * FROM cursos");
                            while(rs.next()){
                                out.println("<option value=\"" + rs.getInt("id") + "\">" + rs.getString("titulo") +
                                 " ," + rs.getString("profesor") + " ," + rs.getString("turno") + "</option>");
                            }
                        %>
                    </select> 
                </td>
            </tr>
            <tr>
                <td><input class="button" type="submit" value="Guardar"/></td>
                <td><input class="button" type="reset"  value="Borrar"/></td>
            </tr>
        </table>
    </form>

        <%@include file="jsp/AlumnosInsert.jsp" %>

    <form>
        Buscar Apellido: 
        <input type="text" name="buscarApellido">
        <input type="submit" value="Buscar">
    </form>
    <div class="Tabla1">
        <%@include file="jsp/AlumnosTable.jsp" %>
        <%@include file="jsp/AlumnosDelete.jsp" %>
    </div>
    
    </body>
    </html>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>