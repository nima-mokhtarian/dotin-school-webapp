package view;

import DAL.CategoryElementService;
import DAL.EmployeeService;
import DAL.VacationService;
import model.CategoryElement;
import model.Employee;
import model.Vacation;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(urlPatterns = {"/vacation", "/vacation/save"})
public class VacationController extends HttpServlet {
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
            case "/save":
                saveVacation(request, response);
                break;
            case "/new":
            default:
                showNewForm(request, response);
                break;
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        List listEmployee = EmployeeService.getAllEmployee();
        request.setAttribute("listEmployee", listEmployee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("vacationForm.jsp");
        dispatcher.forward(request, response);
    }

    private void saveVacation(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Employee applicant = EmployeeService.getEmployeeByName(request.getParameter("applicant"));
        LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));
        LocalDate endDate = LocalDate.parse(request.getParameter("endDate"));
        CategoryElement waitingForAcceptance = CategoryElementService.getCategoryElementByName("waiting for acceptance");
        VacationService.saveVacation(new Vacation(startDate, endDate, applicant, waitingForAcceptance));
        RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
        dispatcher.forward(request, response);
    }
}
