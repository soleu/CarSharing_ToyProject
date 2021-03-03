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
session.invalidate();//전체 정보 초기화

%>
<script>
alert("로그아웃 되었습니다.");
window.location.href="MainPage.jsp";
</script>

</body>
</html>