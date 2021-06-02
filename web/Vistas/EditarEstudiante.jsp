<%-- 
    Document   : EditarEstudiante
    Created on : 22-nov-2020, 19:16:26
    Author     : Duvan
--%>

<%@page import="Modelo.EstudianteDTO"%>
<%@page import="java.util.*"%>
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
            <%
                EstudianteDTO dto = new EstudianteDTO();
                String codigo = (String) request.getParameter("codigo");
                List<EstudianteDTO> Lista = (List<EstudianteDTO>) request.getSession().getAttribute("Lista");
                for (int i = 0; i < Lista.size(); i++) {
                    if (Lista.get(i).getCodigo().equals(codigo)) {
                        dto = Lista.get(i);
                    }
                }
            %>
            <h1 style="text-align: center;">Editar Estudiante</h1>
            <form class="form-group" action="../ControladorEstudiante" method="GET">
                <label><b>Código</b></label>
                <input class="form-control" type="text" name="txt_codigo" value="<%= dto.getCodigo()%>" disabled><br>

                <label><b>Nombre</b></label>
                <input class="form-control" type="text" name="txt_nombre" value="<%= dto.getNombre()%>" required><br>

                <label><b>Fecha De Nacimiento</b></label>
                <input class="form-control" type="text" name="txt_Fecha" value="<%= dto.getFechaNacimiento()%>" required><br>

                <label><b>Telefono</b></label>
                <input class="form-control" type="text" name="txt_telefono" value="<%= dto.getTelefono()%>" required><br>

                <label><b>Ciudad</b></label>
                <input class="form-control" type="text" name="txt_ciudad" value="<%= dto.getCiudad()%>" required><br>

                <label><b>Universidad</b></label>
                <select class="form-control" name="Universidad" >
                    <%
                        Universidad listU[] = Universidad.values();
                        for (Universidad u : listU) {
                    %>
                    <option value="<%= u.name()%>"><%= u.toString()%></option>
                    <%}%>
                </select><br/>
                <input  type="hidden" name="txt_codigo" value="<%= dto.getCodigo()%>">
                <input class="btn btn-primary"  type="submit" name="accion" value="Editar">
                <input class="btn btn-primary" type="submit"  name="accion" value="Volver">
            </form>
        </div> 
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </body>
</html>

