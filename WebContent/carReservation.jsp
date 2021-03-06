<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Car.CarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 예약 페이지</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
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