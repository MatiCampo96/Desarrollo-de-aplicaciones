package ar.org.centro8.curso.java.server.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@ServletComponentScan()
@WebServlet(name="holaservlet", urlPatterns = "/servlet")
public class HolaMundoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        //response.setContentType("text/plain");
        try (PrintWriter out=response.getWriter()){
            /*
            out.println("<h1>Hola Mundo Servlet!</h1>");
            out.println("<h2>Hola Mundo Servlet!</h2>");
            out.println("<h3>Hola Mundo Servlet!</h3>");
            out.println("<h4>Hola Mundo Servlet!</h4>");
            out.println("<h5>Hola Mundo Servlet!</h5>");
            out.println("<h6>Hola Mundo Servlet!</h6>");
            
            try{
                //Parámetros de entrada
                //http://localhost:8082/servlet?nombre=Carlos
                String nombre=request.getParameter("nombre");
                if(nombre!=null && !nombre.isEmpty()){
                    out.println("Hola "+nombre);
                }
                Map<String, String[]>mapa=request.getParameterMap();
                for(String st:mapa.keySet()) out.println(st);
            }catch(Exception e){
                System.out.println(e);
            }
            */
            out.println("<h1>no se puede ingresar parámetros por GET!!</h1>");
        } catch (Exception e) {
            System.out.println(e);
        }
        

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out=response.getWriter()){
            try {
                String user=request.getParameter("user");
                String pass=request.getParameter("pass");
                if(user.equals("root") && pass.equals("123")){
                    out.println("<h1>Bienvenido Usuario</h1>");
                }else{
                    out.println("<h1>Error de datos</h1>");
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    

}
