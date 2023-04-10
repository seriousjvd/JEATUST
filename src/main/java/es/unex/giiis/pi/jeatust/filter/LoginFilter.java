package es.unex.giiis.pi.jeatust.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.logging.Logger;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter(dispatcherTypes = DispatcherType.REQUEST)
public class LoginFilter implements Filter {
    private static final Logger logger = Logger.getLogger(Filter.class.getName());
    /**
     * Default constructor.
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see Filter#destroy()
     */
    public void destroy() {
        // TODO Auto-generated method stub
    }

    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // If there is not a session established you must redirect to LoginServlet.do otherwise, follow the usual process.

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(true);

        if (session.getAttribute("user") != null) {
            if (req.getRequestURI().contains("Login") || req.getRequestURI().contains("Register")) {
                res.sendRedirect(req.getContextPath() + "/HomeServlet.do");
            } else {
                chain.doFilter(request, response);
            }
        } else {
            if (req.getRequestURI().contains("Login") || req.getRequestURI().contains("Register")) {
                chain.doFilter(request, response);
            } else {
                res.sendRedirect(req.getContextPath() + "/LoginServlet.do");
            }
        }
    }

    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException {
        // TODO Auto-generated method stub
    }

}

