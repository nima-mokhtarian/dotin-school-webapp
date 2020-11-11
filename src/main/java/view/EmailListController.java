package view;

import DAL.EmailService;
import DAL.EmployeeService;
import DAL.VacationService;
import model.Attachment;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = {"/emailList", "/emailList/download"})
public class EmailListController extends DotinController {
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
        switch (action) {
            case "/download":
                download(request, response);
                break;
            case "/view":
            default:
                showList(request, response);
                break;
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        long userId = (request.getParameter("receiverId") != null ? Long.parseLong(request.getParameter("receiverId")) : -1);
//        request.setAttribute("receiverId", user.getId());
        List listEmail = EmailService.getEmailByReceiverId(user.getId());
        request.setAttribute("listEmail", listEmail);
        List listEmployee = EmployeeService.getAllEmployee();
        request.setAttribute("listEmployee", listEmployee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("emailList.jsp");
        dispatcher.forward(request, response);
    }

    private void download(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        long emailId = Long.parseLong(request.getParameter("emailId"));
        List attachments = EmailService.getAttachmentsByEmailId(emailId);
        Attachment attachment = (Attachment) attachments.get(0);

        try {
            String fileName = attachment.getName();
            InputStream inputStream = attachment.getData().getBinaryStream();
            int fileLength = inputStream.available();

            System.out.println("fileLength = " + fileLength);

            ServletContext context = getServletContext();

            // sets MIME type for the file download
            String mimeType = context.getMimeType(fileName);
            if (mimeType == null) {
                mimeType = "application/octet-stream";
            }

            // set content properties and header attributes for the response
            response.setContentType(mimeType);
            response.setContentLength(fileLength);
            String headerKey = "Content-Disposition";
            String headerValue = String.format("attachment; filename=\"%s\"", fileName);
            response.setHeader(headerKey, headerValue);

            // writes the file to the client
            OutputStream outStream = response.getOutputStream();

            byte[] buffer = new byte[4096];
            int bytesRead = -1;

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outStream.write(buffer, 0, bytesRead);
            }

            inputStream.close();
            outStream.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
