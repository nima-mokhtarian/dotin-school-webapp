<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>کارمند</title>
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
<body style="direction: rtl">

<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: #fbbc05;height: 60px;">
        <ul class="navbar-nav">
            <li>
                <a href="<%=request.getContextPath()%>/home" class="nav-link">
                    خانه
                </a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/employee" class="nav-link">
                    کارمند
                </a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/logout" class="nav-link">
                    خروج
                </a>
            </li>
        </ul>
    </nav>
</header>
<br>
<div class="container text-right">
    <div class="card">
        <div class="card-body">
            <form action="/employee/save" method="post" autocomplete="off">
                <h2 class="text-center">
                    کارمند
                </h2>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label class="col-md-6">نام</label>
                        <input required class="form-control col-md-6" type="text" name="employeeName">
                    </div>
                    <div class="form-gropu col-md-6">
                        <label class="col-md-6">مدیر</label>
                        <select required class="form-control col-md-6" name="employeeManager">
                            <option value="" selected disabled hidden>مدیر</option>
                            <c:forEach items="${listEmployee}" var="manager">
                                <option value="${manager.getName()}">${manager.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label class="col-md-6">نقش</label>
                        <select required class="form-control col-md-6" name="employeeRole">
                            <option value="" selected disabled hidden>نقش</option>
                            <c:forEach items="${listRole}" var="role">
                                <option value="${role.getEnglishName()}">${role.getPersianName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="col-md-6">جنسیت</label>
                        <select required class="form-control col-md-6" name="employeeGender">
                            <option value="" selected disabled hidden>جنسیت</option>
                            <c:forEach items="${listGender}" var="gender">
                                <option value="${gender.getEnglishName()}">${gender.getPersianName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label class="col-md-6">نام کاربری</label>
                        <input required class="form-control col-md-6" type="text" name="username">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="col-md-6">گذرواژه</label>
                        <input required class="form-control col-md-6" type="text" name="password">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">افزودن کارمند</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>