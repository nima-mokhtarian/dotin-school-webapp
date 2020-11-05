package view;

import DAL.EmployeeService;
import DAL.VacationService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/emailList"})
public class EmailListController extends HttpServlet {
    public void init() {}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int startIndex = request.getServletPath().lastIndexOf("/");
        String action = request.getServletPath().substring(startIndex);
        switch (action) {
            case "/view":
            default:
                showList(request, response);
                break;
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        long userId = (request.getParameter("applicantId") != null ? Long.parseLong(request.getParameter("applicantId")) : -1);
        List listEmail = VacationService.getVacationByApplicantId(userId);
        request.setAttribute("listEmail", listEmail);
        List listEmployee = EmployeeService.getAllEmployee();
        request.setAttribute("listEmployee", listEmployee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("EmailList.jsp");
        dispatcher.forward(request, response);
    }
}
