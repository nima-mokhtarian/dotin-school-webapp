<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vacation</title>
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
            <form action="/vacation/save" method="post" autocomplete="off">
                <h2 class="text-center">
                    Employee
                </h2>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label class="col-md-6">Applicant</label>
                        <select class="form-control col-md-6" name="applicant">
                            <c:forEach items="${listEmployee}" var="applicant">
                                <option value="${applicant.getName()}">${applicant.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label class="col-md-6">Start Day</label>
                        <input type="date" class="form-control col-md-6" name="startDate" title="startDate" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="col-md-6">End Day</label>
                        <input type="date" class="form-control col-md-6" name="endDate" title="endDate" required>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">apply vacation</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>