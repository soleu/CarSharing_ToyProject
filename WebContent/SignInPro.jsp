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
request.setCharacterEncoding("utf-8");
CarDAO dao=CarDAO.getInstance();
String id=request.getParameter("id");
String pw=request.getParameter("pw");
int check=0;
if(dao.idpwCheck(id, pw)!=-1){
	check=dao.idpwCheck(id, pw);
	session.setAttribute("log",check );
	%>
	<script>
	alert("<%=id%>님 환영합니다!");
	window.location.href="MainPage.jsp";
	</script>
	<% 
}else{
%>
<script>
	alert("로그인 정보가 일치하지 않습니다.");
	window.location.href="SignIn.jsp";
	</script>
<%} %>
</body>
</html>