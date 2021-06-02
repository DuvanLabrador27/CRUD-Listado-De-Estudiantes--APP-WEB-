/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.EstudianteDTO;
import Modelo.EstudianteDAO;
import Modelo.Universidad;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Duvan
 */
public class ControladorEstudiante extends HttpServlet {

    EstudianteDTO dto = new EstudianteDTO();
    EstudianteDAO dao = new EstudianteDAO();
    List<EstudianteDTO> Lista = new ArrayList<>();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorEstudiante</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorEstudiante at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("create")) {
            String codigo = request.getParameter("txt_codigo");
            String nombre = request.getParameter("txt_nombre");
            String fechaNacimiento = request.getParameter("txt_Fecha");
            String telefono = request.getParameter("txt_telefono");
            String ciudad = request.getParameter("txt_ciudad");
            Universidad universidad = Universidad.valueOf(request.getParameter("Universidad"));
            dto = new EstudianteDTO(codigo, nombre, fechaNacimiento, telefono, ciudad, universidad);
            Lista = (List<EstudianteDTO>) request.getSession().getAttribute("Lista");
            if (Lista == null) {
                Lista = new ArrayList<>();
                Lista.add(dto);
                request.getSession().setAttribute("Lista", Lista);
            } else {
                if (!Lista.contains(dto)) {
                    Lista.add(dto);
                    request.getSession().setAttribute("Lista", Lista);
                }
            }
            response.sendRedirect("index.jsp");
        } else if (action.equalsIgnoreCase("formeditar")) {
            String codigo = request.getParameter("codigo");
            request.getSession().setAttribute("Lista", Lista);
            response.sendRedirect("Vistas/EditarEstudiante.jsp?codigo=" + codigo);
        } else if (action.equalsIgnoreCase("Editar")) {
            String codigo = request.getParameter("txt_codigo");
            String nombre = request.getParameter("txt_nombre");
            String fechaNacimiento = request.getParameter("txt_Fecha");
            String telefono = request.getParameter("txt_telefono");
            String ciudad = request.getParameter("txt_ciudad");
            Universidad universidad = Universidad.valueOf(request.getParameter("Universidad"));
            dto = new EstudianteDTO(codigo, nombre, fechaNacimiento, telefono, ciudad, universidad);
            dao.update(Lista, dto);
            response.sendRedirect("index.jsp");
        } else if (action.equalsIgnoreCase("eliminar")) {
            String codigo = request.getParameter("codigo");
            dao.delete(Lista, codigo);
            response.sendRedirect("index.jsp");
        } else if (action.equalsIgnoreCase("Volver")) {
            response.sendRedirect("index.jsp");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
