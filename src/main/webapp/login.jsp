<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ورود</title>
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

</header>
<br>
<div class="container text-right">
    <div class="card">
        <div class="card-body">
            <form action="/login" method="post" autocomplete="off">
                <h2 class="text-center">
                    ورود
                </h2>
                <br>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label class="col-md-6">نام کاربری</label>
                        <input required class="form-control col-md-6" type="text" name="username">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="col-md-6">گذرواژه</label>
                        <input required class="form-control col-md-6" type="password" name="password">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">ورود</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>