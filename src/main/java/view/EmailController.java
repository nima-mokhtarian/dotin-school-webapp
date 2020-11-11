package view;

import DAL.AttachmentService;
import DAL.EmailService;
import DAL.EmployeeService;
import DAL.VacationService;
import model.Attachment;
import model.Email;
import model.Employee;
import model.Vacation;
import org.hibernate.engine.jdbc.BlobProxy;
import sun.misc.IOUtils;
import sun.nio.ch.IOUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.Blob;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@WebServlet(urlPatterns = {"/email", "/email/send"})
@MultipartConfig
public class EmailController extends DotinController {
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
            case "/send":
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
        request.setCharacterEncoding("UTF-8");
//        Employee sender = EmployeeService.getEmployeeByName(request.getParameter("sender"));
        Employee sender = user;
        Set<Employee> receiver = Arrays.stream(request.getParameterValues("receivers")).map(r -> EmployeeService.getEmployeeByName(r)).collect(Collectors.toSet());
        String title = request.getParameter("title");
        String body = request.getParameter("body");
        Part filePart = request.getPart("file");
        String attachmentName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        Blob attachmentContent = BlobProxy.generateProxy(filePart.getInputStream(), filePart.getSize());
        Attachment attachment = new Attachment(attachmentName, attachmentContent);
        AttachmentService.saveAttachment(attachment);
        Email email = new Email(sender, receiver, title, body);
        email.addAttachments(attachment);
        EmailService.saveEmail(email);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
        dispatcher.forward(request, response);
    }
}
