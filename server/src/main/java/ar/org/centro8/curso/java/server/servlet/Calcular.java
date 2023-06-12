package ar.org.centro8.curso.java.server.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import ch.qos.logback.core.joran.conditional.ElseAction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name="calcular", urlPatterns = "/calcular")
public class Calcular extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out=response.getWriter()){
            response.setContentType("text/plain");
            try {
                double numero1=Double
                                    .parseDouble(
                                        request
                                            .getParameter("numero1")
                                    );
                double numero2=Double
                                    .parseDouble(
                                        request
                                            .getParameter("numero2")
                                    );
                String operacion=request.getParameter("operacion");
                switch(operacion){
                    case "sumar":       out.println(numero1+numero2);break;
                    case "restar":      out.println(numero1-numero2);break;
                    case "dividir": 
                        if(numero2!=0)  out.println(numero1/numero2);
                        else            out.println("error");
                    break;
                    case "multiplicar": out.println(numero1*numero2);break;
                    default: out.println("0");
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
}
