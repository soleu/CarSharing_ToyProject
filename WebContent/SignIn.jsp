<%@page import="Car.CarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<h2>log in</h2>
<form method="post" action="SignInPro.jsp">
아이디 <input type="text" name="id">
비밀번호 <input type="password" name="pw">
<input type="submit" value="로그인">
<button type="button" onclick="window.location.href='MainPage.jsp'">뒤로가기</button>
</form>
</body>
</html>