<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� ������</title>

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
	alert("�α����� ���� ���ּ���!");
	window.location.href="MainPage.jsp";
	</script>
	<% 
}
%>
<form method="post" action="carReservation2.jsp">
 �뿩 �ð� �Է� : 
<input type="date" name="startDate" min="<%=d %>" required>
<input type="time" name="startTime" min="<%=d %>" step="1800" required>
<small>�뿩�ð��� 30�� ������ ���� �����մϴ�.</small>
<br>
�ݳ� �ð� �Է� : 
<input type="date" name="endDate" required>
<input type="time" name="endTime"  step="1800" required><br>
<input type="submit" value="�Է�">
</form>

</body>
</html>