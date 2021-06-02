<%-- 
    Document   : CrearEstudiante
    Created on : 22-nov-2020, 15:06:07
    Author     : Duvan
--%>
<%@page import="Modelo.Universidad"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>Crear Estudiante</title>
    </head>
    <body>
        <div class="container">
            <h1 style="text-align: center;">Crear Estudiante</h1>
            <form class="form-group" action="../ControladorEstudiante" method="GET">
                <label><b>Código</b></label>
                <input class="form-control" type="text" name="txt_codigo"  placeholder="Ejemplo:1151808" required><br>

                <label><b>Nombre</b></label>
                <input class="form-control" type="text" name="txt_nombre"  placeholder="Ejemplo:Duvan Labrador" required><br>

                <label><b>Fecha De Nacimiento</b></label>
                <input class="form-control" type="text" name="txt_Fecha"  required><br>

                <label><b>Telefono</b></label>
                <input class="form-control" type="text" name="txt_telefono"  placeholder="Ejemplo:3228313345" required><br>

                <label><b>Ciudad</b></label>
                <input class="form-control" type="text" name="txt_ciudad"  placeholder="Ejemplo:Cúcuta" required><br>

                <label><b>Universidad</b></label>
                <select class="form-control" name="Universidad" >
                    <%
                        Universidad listU[] = Universidad.values();
                        for (Universidad dto : listU) {
                    %>
                    <option value="<%= dto.name()%>"><%= dto.toString()%></option>
                    <%}%>
                </select><br/>
                <input class="btn btn-primary"  type="submit" name="accion" value="create">
                <input class="btn btn-primary" type="submit"  value="Volver" onClick="window.location.href = '../index.jsp'">
            </form>
        </div> 
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </body>
</html>
