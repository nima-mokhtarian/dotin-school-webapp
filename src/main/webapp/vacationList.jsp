<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vacation List</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <link rel="stylesheet" href="css/vertical-responsive-menu.min.css"/>
    <link rel="stylesheet" href="css/persianDatepicker-default.css"/>
    <script src="js/jquery-1.10.1.min.js"></script>
    <script src="js/persianDatepicker.js"></script>
    <script src="js/functions.js"></script>
</head>
<body style="direction: ltr">

<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: #fbbc05;height: 60px;">
        <ul class="navbar-nav">
            <li>
                <a href="<%=request.getContextPath()%>/home" class="nav-link">
                    home
                </a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/employee" class="nav-link">
                    Employee
                </a>
            </li>
        </ul>
    </nav>
</header>
<br>
<div class="container text-left">
    <div class="card">
        <div class="card-body">
            <form name="vacationForm" action="/vacationList" method="post" autocomplete="off">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label class="col-md-6">Applicant</label>
                        <select class="form-control col-md-6" name="applicantId"
                                onchange="document.vacationForm.submit();">
                            <c:forEach items="${listEmployee}" var="applicant">
                                <option
                                        <c:if test="${applicantId == applicant.getId()}">selected</c:if>
                                        value="${applicant.getId()}">${applicant.getName()}</option>
                            </c:forEach>

                            );">
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-10">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Applicant</th>
                                <th scope="col">Start Date</th>
                                <th scope="col">End Date</th>
                                <th scope="col">Status</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listVacation}" var="vacation" varStatus="loop">
                                <tr>
                                    <td scope="col">${loop.index}</td>
                                    <td scope="col">${vacation.employee.name}</td>
                                    <td scope="col">${vacation.startDate}</td>
                                    <td scope="col">${vacation.endDate}</td>
                                    <td scope="col">${vacation.status}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>