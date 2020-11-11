<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ایمیل</title>
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
                <a href="<%=request.getContextPath()%>/logout" class="nav-link">
                    خروج
                </a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/home" class="nav-link">
                    خانه
                </a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/Email" class="nav-link">
                    ایمیل
                </a>
            </li>
        </ul>
    </nav>
</header>
<br>
<div class="container text-right">
    <div class="card">
        <div class="card-body">
            <form action="/email/send" enctype="multipart/form-data" method="post" autocomplete="off">
                <h2 class="text-center">
                    ایمیل
                </h2>
                <br>
                <%--<div class="form-row">
                    <div class="form-group col-md-6">
                        <label class="col-md-6">Sender</label>
                        <select required class="form-control col-md-6" name="sender">
                            <option value="" selected disabled hidden>Choose Sender</option>
                            <c:forEach items="${listEmployee}" var="employee">
                                <option value="${employee.getName()}">${employee.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>--%>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label class="col-md-6">دریافت کنندگان</label>
                        <select required multiple class="form-control col-md-6" name="receivers">
                            <c:forEach items="${listEmployee}" var="employee">
                                <option value="${employee.getName()}">${employee.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label class="col-md-6">عنوان</label>
                        <input required name="title" class="form-control col-md-6" type="text">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label class="col-md-6">ایمیل</label>
                        <textarea required name="body" class="form-control col-md-12" rows="5"></textarea>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label class="col-md-6">پیوست</label>
                        <input class="col-md-6" type="file" name="file" size="50"/>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">ارسال ایمیل</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>