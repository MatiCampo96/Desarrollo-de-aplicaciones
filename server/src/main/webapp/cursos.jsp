<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="ar.org.centro8.curso.java.server.conectores.Connector"%>
<%@page import="ar.org.centro8.curso.java.server.enums.*"%>

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
    <h1 class="titulo">Formulario de cursos</h1>
    <form>
        <table>
            <tr>
                <td><label class="label">Titulo: </label></td>
                <td><input class="input" type="text" value="" name="titulo" minlength="2" maxlength="20" /></td>
            </tr>
            <tr>
                <td><label class="label">Profesor: </label></td>
                <td><input class="input" type="text" value="" name="profesor"  minlength="2" maxlength="20" /></td>
            </tr>
            <tr>
                <td><label class="label">día: </label></td>
                <td>
                    <select class="select"  name="dia">
                        <option value="LUNES">lunes</option>
                        <option value="MARTES">martes</option>
                        <option value="MIERCOLES">miércoles</option>
                        <option value="JUEVES">jueves</option>
                        <option value="VIERNES">viernes</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label class="label">Turno: </label></td>
                <td>
                    <select class="select"  name="turno">
                        <option value="MAÑANA">mañana</option>
                        <option value="TARDE">tarde</option>
                        <option value="NOCHE">noche</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><input class="button" type="submit" value="Guardar"    /></td>
                <td><input class="button" type="reset"  value="Borrar"      /></td>
            </tr>
        </table>
    </form>

    <%@include file="jsp/CursosInsert.jsp" %>

    <form>
        Buscar Título: 
        <input type="text" name="buscarTitulo">
        <input type="submit" value="Buscar">
    </form>

    <%@include file="jsp/CursosTable.jsp" %>   
    <%@include file="jsp/CursosDelete.jsp" %>   


</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>