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
        Dotin Portal
    </title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <script src="js/functions.js"></script>
</head>
<body style="direction: ltr">

<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: darkgray; height: 60px;"></nav>
</header>

<br>
<div class="container text-left">
        <div style="padding: 10px; margin: 20px;">
            <h1>
                Welcome to Dotin Portal
            </h1>
            <h2>
                Please Choose Your Operation
            </h2>
        </div>
        <br>
        <div class="row">
            <div class="col">
                <a href="<%=request.getContextPath()%>/employee"
                   class="btn btn-outline-primary btn-lg btn-block">
                    Add Employee
                </a>
            </div>
            <div class="col">
                <a href="<%=request.getContextPath()%>/vacation" class="btn btn-outline-danger btn-lg btn-block">
                    Request Vacation
                </a>
            </div>
            <div class="col">
                <a href="<%=request.getContextPath()%>/add-customer" class="btn btn-outline-warning btn-lg btn-block">
                    Send Email
                </a>
            </div>
            <div class="col">
                <a href="<%=request.getContextPath()%>/add-customer" class="btn btn-outline-success btn-lg btn-block">
                    Browse Emails
                </a>
            </div>
            <div class="col">
                <a href="<%=request.getContextPath()%>/add-customer"  class="btn btn-outline-success btn-lg btn-block">
                    Browse Vacation
                </a>
            </div>
        </div>
    </div>
</body>
</html>