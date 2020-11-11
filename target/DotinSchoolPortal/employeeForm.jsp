<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee</title>
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
            <li>
                <a href="<%=request.getContextPath()%>/logout" class="nav-link">
                    logout
                </a>
            </li>
        </ul>
    </nav>
</header>
<br>
<div class="container text-left">
    <div class="card">
        <div class="card-body">
            <form action="/employee/save" method="post" autocomplete="off">
                <h2 class="text-center">
                    Employee
                </h2>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label class="col-md-6">Employee Name</label>
                        <input required class="form-control col-md-6" type="text" name="employeeName">
                    </div>
                    <div class="form-gropu col-md-6">
                        <label class="col-md-6">Manger Name</label>
                        <select required class="form-control col-md-6" name="employeeManager">
                            <option value="" selected disabled hidden>Choose Your Manager</option>
                            <c:forEach items="${listEmployee}" var="manager">
                                <option value="${manager.getName()}">${manager.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label class="col-md-6">Role</label>
                        <select required class="form-control col-md-6" name="employeeRole">
                            <option value="" selected disabled hidden>Choose Your Role</option>
                            <c:forEach items="${listRole}" var="role">
                                <option value="${role.getEnglishName()}">${role.getEnglishName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="col-md-6">Gender</label>
                        <select required class="form-control col-md-6" name="employeeGender">
                            <option value="" selected disabled hidden>Choose Your Gender</option>
                            <c:forEach items="${listGender}" var="gender">
                                <option value="${gender.getEnglishName()}">${gender.getEnglishName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label class="col-md-6">Username</label>
                        <input required class="form-control col-md-6" type="text" name="username">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="col-md-6">Password</label>
                        <input required class="form-control col-md-6" type="text" name="password">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">save employee</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>