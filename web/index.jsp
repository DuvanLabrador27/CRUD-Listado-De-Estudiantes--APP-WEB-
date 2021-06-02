<%-- 
    Document   : index
    Created on : 22-nov-2020, 15:13:39
    Author     : Duvan
--%>

<%@page import="Modelo.EstudianteDTO"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>Lista Estudiantes</title>
    </head>
    <body>
        <div class="container">
            <h1 style="text-align: center;">Lista de Estudiantes</h1>
            <a class="btn btn-success" href="Vistas/CrearEstudiante.jsp">Crear Estudiante</a>
            <table class="table table-striped table-inverse table-responsive mt-3">
                <thead class="thead-responsive">
                    <tr>
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Fecha De Nacimiento</th>
                        <th>Telefono</th>
                        <th>Ciudad</th>
                        <th>Universidad</th> 
                        <th>Acciones</th>
                    </tr>
                </thead>
                <%
                    List<EstudianteDTO> Lista = (List<EstudianteDTO>) request.getSession().getAttribute("Lista");
                    if (Lista == null) {               
                    } else {
                        for (int i = 0; i < Lista.size(); i++) {
                %>
                <tbody>
                    <tr>
                        <td><%= Lista.get(i).getCodigo()%></td>
                        <td><%= Lista.get(i).getNombre()%></td>
                        <td><%= Lista.get(i).getFechaNacimiento()%></td>
                        <td><%= Lista.get(i).getTelefono()%></td>
                        <td><%= Lista.get(i).getCiudad()%></td>
                        <td><%= Lista.get(i).getUniversidad()%></td>
                        <td>
                            <a class="btn btn-warning" href="ControladorEstudiante?accion=formeditar&codigo=<%= Lista.get(i).getCodigo()%>">Editar</a>
                            <a class="btn btn-danger"  href="ControladorEstudiante?accion=eliminar&codigo=<%= Lista.get(i).getCodigo()%>">Eliminar</a>
                        </td>
                    </tr>
                    <%}
                        }%>
                </tbody>
            </table>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </body>
</html>
