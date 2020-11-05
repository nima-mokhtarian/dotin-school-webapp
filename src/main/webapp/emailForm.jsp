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
            <form action="/email/save" method="post" autocomplete="off">
                <h2 class="text-center">
                    Employee
                </h2>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-6">
                    <label class="col-md-6">Sender</label>
                        <select class="form-control col-md-6" name="sender">
                            <c:forEach items="${listEmployee}" var="employee">
                                <option value="${employee.getName()}">${employee.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label class="col-md-6">Receivers</label>
                        <select multiple class="form-control col-md-6" name="receivers">
                            <c:forEach items="${listEmployee}" var="employee">
                                <option value="${employee.getName()}">${employee.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label class="col-md-6">Email</label>
                        <textarea name="body" class="form-control col-md-12" rows="5"></textarea>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">apply vacation</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>