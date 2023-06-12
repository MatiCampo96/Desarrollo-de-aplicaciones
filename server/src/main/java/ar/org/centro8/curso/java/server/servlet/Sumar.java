package ar.org.centro8.curso.java.server.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name="sumar", urlPatterns = "/sumar")
public class Sumar extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        try (PrintWriter out=response.getWriter()){
            try {
                double nro1=Double.parseDouble(request.getParameter("nro1"));
                double nro2=Double.parseDouble(request.getParameter("nro2"));
                double resultado=nro1+nro2;
                out.println(resultado);
            } catch (Exception e) {
                out.println("Error de parámetros");
                System.out.println("*************************");
                System.out.println(e);
                System.out.println("*************************");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
}
