package view;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/home")
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String selectedLanguageParameter = request.getParameter("selectedLanguage");
        String selectedLanguageSession = (String) request.getSession().getAttribute("selectedLanguage");
        if (selectedLanguageParameter == null) {
            if (selectedLanguageSession == null)
                request.getSession().setAttribute("selectedLanguage", "Persian");
            else
                request.getSession().setAttribute("selectedLanguage", selectedLanguageSession);
        } else
            request.getSession().setAttribute("selectedLanguage", selectedLanguageParameter);
        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
    }
}

