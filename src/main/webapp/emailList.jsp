<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>لیست ایمیل ها</title>
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
                <a href="<%=request.getContextPath()%>/emailList" class="nav-link">
                    لیست ایمیل ها
                </a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/logout" class="nav-link">
                    خذوج
                </a>
            </li>
        </ul>
    </nav>
</header>
<br>
<div class="container text-right">
    <div class="card">
        <div class="card-body">
            <form name="emailForm" action="/emailList" method="post" autocomplete="off">
                <div class="form-row">
                    <%--<div class="form-group col-md-6">
                        <label class="col-md-6">Receiver</label>
                        <select class="form-control col-md-6" name="receiverId"
                                onchange="document.emailForm.submit();">
                            <option value="" selected disabled hidden>Choose Receiver</option>
                            <c:forEach items="${listEmployee}" var="receiver">
                                <option
                                        <c:if test="${receiverId == receiver.getId()}">selected</c:if>
                                        value="${receiver.getId()}">${receiver.getName()}</option>
                            </c:forEach>
                            );">
                        </select>
                    </div>--%>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-10">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">ارسال کننده</th>
                                <th scope="col">عنوان</th>
                                <th scope="col">متن</th>
                                <th scope="col">پیوست</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listEmail}" var="email" varStatus="loop">
                                <tr>
                                    <td scope="col">${loop.index}</td>
                                    <td scope="col">${email.sender.name}</td>
                                    <td scope="col">${email.title}</td>
                                    <td scope="col">${email.body}</td>
                                    <td scope="col">
                                        <c:if test="${email.attachments != null}">
                                            <a href="<%=request.getContextPath()%>/emailList/download?emailId=${email.getId()}"class="btn btn-outline-success btn-sm">download</a>
                                        </c:if>
                                    </td>
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