<%@page import="Car.CarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Car.CarDAO dao=Car.CarDAO.getInstance();
dao.initCarList();
session.setAttribute("log",-1);
%>
<script>
window.location.href="MainPage.jsp";
</script>
</body>
</html>