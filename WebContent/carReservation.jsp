<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>차량 예약 페이지</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap');
body{
font-family: 'Nanum Gothic', sans-serif;}
</style>
</head>
<body>
<%
Date d=new Date();
SimpleDateFormat sf=new SimpleDateFormat("yyyy-mm-dd");

if((int)session.getAttribute("log")==-1){
	%>
	<script>
	alert("로그인을 먼저 해주세요!");
	window.location.href="MainPage.jsp";
	</script>
	<% 
}
%>
<form method="post" action="carReservation2.jsp">
 대여 시간 입력 : 
<input type="date" name="startDate" min="<%=d %>" required>
<input type="time" name="startTime" min="<%=d %>" step="1800" required>
<small>대여시간은 30분 단위로 설정 가능합니다.</small>
<br>
반납 시간 입력 : 
<input type="date" name="endDate" required>
<input type="time" name="endTime"  step="1800" required><br>
<input type="submit" value="입력">
</form>

</body>
</html>