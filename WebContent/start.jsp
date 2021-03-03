<%@page import="Car.CarDAO2"%>
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
	Car.CarDAO2 dao=Car.CarDAO2.getInstance();
	dao.getConnection();
	session.setAttribute("log",-1);
%>
<script>
window.location.href="MainPage.jsp";
</script>
</body>
</html>