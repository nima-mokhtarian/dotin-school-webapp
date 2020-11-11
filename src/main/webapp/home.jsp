<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>
        داتین
    </title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
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
        </ul>
    </nav>
</header>

<br>
<div class="container text-right">
        <div style="padding: 10px; margin: 20px;">
            <h1>
<%--                Welcome to Dotin Portal--%>
                به سامانه داتین خوش آمدید.
            </h1>
            <h2>
<%--                Please Choose Your Operation--%>
                لطفا عملیات مورد نظر خود را انتخاب کنید.
            </h2>
        </div>
        <br>
        <div class="row">
            <div class="col">
                <a href="<%=request.getContextPath()%>/employee"
                   class="btn btn-outline-primary btn-lg btn-block">
<%--                    Add Employee--%>
                    افزودن کاربر
                </a>
            </div>
            <div class="col">
                <a href="<%=request.getContextPath()%>/vacation" class="btn btn-outline-danger btn-lg btn-block">
<%--                    Request Vacation--%>
                    درخواست مرخصی
                </a>
            </div>
            <div class="col">
                <a href="<%=request.getContextPath()%>/email" class="btn btn-outline-warning btn-lg btn-block">
<%--                    Send Email--%>
                    ارسال ایمیل
                </a>
            </div>
            <div class="col">
                <a href="<%=request.getContextPath()%>/emailList" class="btn btn-outline-success btn-lg btn-block">
<%--                    Browse Emails--%>
                    مشاهده ایمیل ها
                </a>
            </div>
            <div class="col">
                <a href="<%=request.getContextPath()%>/vacationList"  class="btn btn-outline-success btn-lg btn-block">
<%--                    Browse Vacation--%>
                    مشاهده مرخصی
                </a>
            </div>
        </div>
    </div>
</body>
</html>