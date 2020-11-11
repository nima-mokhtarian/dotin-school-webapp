package view;

import DAL.CategoryElementService;
import DAL.EmployeeService;
import model.CategoryElement;
import model.Employee;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/employee", "/employee/save"})
public class EmployeeController extends DotinController {
    public void init() {}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
        int startIndex = request.getServletPath().lastIndexOf("/");
        String action = request.getServletPath().substring(startIndex);
        switch (action) {
            case "/save":
                saveEmployee(request, response);
                break;
            case "/new":
            default:
                showNewForm(request, response);
                break;
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        List listEmployee = EmployeeService.getEmployeeByRoll("manager");
        request.setAttribute("listEmployee", listEmployee);
        List listGender = CategoryElementService.getAllGender();
        request.setAttribute("listGender", listGender);
        List listRole = CategoryElementService.getAllRole();
        request.setAttribute("listRole", listRole);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employeeForm.jsp");
        dispatcher.forward(request, response);
    }

    private void saveEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        String name = String.valueOf(request.getParameter("employeeName"));
        Employee manager = EmployeeService.getEmployeeByName(request.getParameter("employeeManager"));
        CategoryElement role = CategoryElementService.getCategoryElementByName(request.getParameter("employeeRole"));
        CategoryElement gender = CategoryElementService.getCategoryElementByName(request.getParameter("employeeGender"));
        String username = String.valueOf(request.getParameter("username"));
        String password = String.valueOf(request.getParameter("password"));

        EmployeeService.saveEmployee(new Employee(name, manager, gender, role, username, password));
        RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
        dispatcher.forward(request, response);
    }
}
