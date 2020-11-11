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

@WebServlet(urlPatterns = {"/vacationList", "/vacationList/accept", "/vacationList/reject"})
public class VacationListController extends DotinController {
    long userId;

    public void init() {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
        int startIndex = request.getServletPath().lastIndexOf("/");
        String action = request.getServletPath().substring(startIndex);

//        userId = (request.getParameter("applicantId") != null ? Long.parseLong(request.getParameter("applicantId")) : -1);
        userId = user.getId();
        request.setAttribute("applicantId", userId);


        switch (action) {
            case "/accept":
                acceptVacation(request, response);
                break;
            case "/reject":
                rejectVacation(request, response);
                break;
            case "/view":
            default:
                showList(request, response);
                break;
        }
    }

    private void rejectVacation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long vacationId = Long.parseLong(request.getParameter("vacationId"));
        VacationService.rejectVacation(vacationId);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/vacationList?applicationId=" + userId);
        dispatcher.forward(request, response);
    }

    private void acceptVacation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long vacationId = Long.parseLong(request.getParameter("vacationId"));
        VacationService.acceptVacation(vacationId);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/vacationList?applicationId=" + userId);
        dispatcher.forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List listVacation = VacationService.getVacationByManagerId(userId);
        request.setAttribute("listVacation", listVacation);
        List listEmployee = EmployeeService.getAllEmployee();
        request.setAttribute("listEmployee", listEmployee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("vacationList.jsp");
        dispatcher.forward(request, response);
    }
}