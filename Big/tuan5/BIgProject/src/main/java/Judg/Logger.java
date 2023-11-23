package Judg;

import Model.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Logger implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession();
        User user= (User) session.getAttribute("user");
        if (user != null){
            chain.doFilter(request,response);
        }
        else {
            request.setAttribute("messageLoginF","Pls Login before you use this web");
            request.getRequestDispatcher("Login.jsp").forward(request,response);
        }
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
