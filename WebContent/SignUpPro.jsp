<%@page import="Car.UserDTO"%>
<%@page import="Car.CarDAO"%>
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
CarDAO dao=CarDAO.getInstance();
request.setCharacterEncoding("utf-8");
String name=request.getParameter("name");
String id=request.getParameter("id");
String pw=request.getParameter("pw");
String phone=request.getParameter("phone");

if(dao.idCheck(id)==false){
	%>
	<script>
	alert("중복된 아이디입니다.");
	window.location.href="SignUp.jsp";
	</script>
	<% 
}
else{
	dao.getUserList().add(new UserDTO(name,id,pw,phone));
	%>
	<script>
	alert("<%=id%>님 환영합니다!");
	window.location.href="MainPage.jsp";
	</script>
	<% 
}
%>
</body>
</html>