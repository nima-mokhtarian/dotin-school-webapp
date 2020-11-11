<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>لیست مرخصی</title>
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
                <a href="<%=request.getContextPath()%>/vacationList" class="nav-link">
                    لیست مرخصی
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
            <form name="vacationForm" action="/vacationList" method="post" autocomplete="off">
                <%--<div class="form-row">
                    <div class="form-group col-md-6">
                        <label class="col-md-6">Applicant</label>
                        <select class="form-control col-md-6" name="applicantId"
                                onchange="document.vacationForm.submit();">
                            <c:forEach items="${listEmployee}" var="applicant">
                                <option value="" selected disabled hidden>Choose Applicant</option>
                                <option
                                        <c:if test="${applicantId == applicant.getId()}">selected</c:if>
                                        value="${applicant.getId()}">${applicant.getName()}</option>
                            </c:forEach>
                            );">
                        </select>
                    </div>
                </div>--%>
                <div class="form-row">
                    <div class="form-group col-md-10">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">درخواست دهنده</th>
                                <th scope="col">تاریخ شروع</th>
                                <th scope="col">تاریخ پپایان</th>
                                <th scope="col">وضعیت</th>
                                <th scope="col">عملیان</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listVacation}" var="vacation" varStatus="loop">
                                <tr>
                                    <td scope="col">${loop.index}</td>
                                    <td scope="col">${vacation.employee.name}</td>
                                    <td scope="col">${vacation.startDate}</td>
                                    <td scope="col">${vacation.endDate}</td>
                                    <td scope="col">${vacation.status.persianName}</td>
                                    <td scope="col">
                                        <c:if test="${vacation.status.englishName.equals('waiting for acceptance')}">
                                            <a href="<%=request.getContextPath()%>/vacationList/accept?vacationId=${vacation.getId()}" class="btn btn-outline-success btn-sm">Accept</a>
                                            <a href="<%=request.getContextPath()%>/vacationList/reject?vacationId=${vacation.getId()}" class="btn btn-outline-danger btn-sm">Reject</a>
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