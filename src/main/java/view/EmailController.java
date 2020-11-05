package view;

import DAL.EmailService;
import DAL.EmployeeService;
import DAL.VacationService;
import model.Email;
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
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@WebServlet(urlPatterns = {"/email", "/email/save"})
public class EmailController extends HttpServlet {
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
                sendEmail(request, response);
                break;
            case "/new":
            default:
                showNewForm(request, response);
                break;
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List listEmployee = EmployeeService.getAllEmployee();
        request.setAttribute("listEmployee", listEmployee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("emailForm.jsp");
        dispatcher.forward(request, response);
    }

    private void sendEmail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Employee sender = EmployeeService.getEmployeeByName(request.getParameter("sender"));
        Set<Employee> receiver = Arrays.stream(request.getParameterValues("receivers")).map(r -> EmployeeService.getEmployeeByName(r)).collect(Collectors.toSet());
        String body = request.getParameter("body");
        EmailService.saveEmail(new Email(sender, receiver, " ", body));
        RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
        dispatcher.forward(request, response);
    }
}
