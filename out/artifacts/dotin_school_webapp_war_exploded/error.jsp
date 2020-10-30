<%@ page import="java.util.Locale" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%
    request.setCharacterEncoding("UTF-8");
    Locale persianLocale = new Locale("fa", "IR");
    Locale englishLocale = new Locale("en", "US");
    ResourceBundle bundle = null;
    String selectedLanguage = (String) request.getSession().getAttribute("selectedLanguage");
    if (selectedLanguage.equals("Persian")) {
        bundle = ResourceBundle.getBundle("/MessageBundles/fa/MessageBundle", persianLocale);
    } else if (selectedLanguage.equals("English")) {
        bundle = ResourceBundle.getBundle("/MessageBundles/en/MessageBundle", englishLocale);
    }
    assert bundle != null;%>
<html>
<head>
    <meta charset="UTF-8">
    <title><%=bundle.getString("errorTitle")%>
    </title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<%
    if (selectedLanguage.equals("Persian")) {
%>
<body style="direction: rtl">
    <%
} else {
%>
<body style="direction: ltr">
<%
    }
%>
<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: red;height: 60px;">
        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/home" class="nav-link"><%=bundle.getString("homeTitle")%>
            </a></li>
        </ul>
    </nav>
</header>
<br>
<%
    if (selectedLanguage.equals("Persian")) {
%>
<div class="container text-right">
        <%
        } else {
    %>
    <div class="container text-left">
        <%
            }
        %>
        <div style="padding: 10px; margin: 20px;">
            <h1><%=bundle.getString("errorTitle")%>
            </h1>
            <br><br>
            <h2><%=request.getAttribute("errorMessage")%>
            </h2>
        </div>
    </div>
</body>
</html>
