package com.example.baitap2jsp;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Double number1= Double.valueOf(request.getParameter("number1"));
        Double number2=Double.valueOf(request.getParameter("number2"));
        Calculator calculator=new Calculator();
        Double nhan=calculator.nhan(number1,number2);
        nhan=Double.valueOf(request.getParameter("nhan"));
        Double chia=calculator.chia(number1,number2);
        chia= Double.valueOf(request.getParameter("chia"));
        Double cong=calculator.cong(number1,number2);
        cong=Double.valueOf(request.getParameter("cong"));
        Double tru=calculator.tru(number1,number2);
        tru=Double.valueOf(request.getParameter("tru"));
        Double pheP= Double.valueOf(request.getParameter("Calculator"));
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Result</h1>");
        writer.println("<h1>"+pheP+"</h1>");
        writer.println("<input >");
        writer.println("</html>");
    }
    public void destroy() {
        super.destroy();
    }
}