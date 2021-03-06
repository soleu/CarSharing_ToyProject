<%@page import="Car.CarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
<form method="post" action="SignUpPro.jsp">
이름 :<input type="text" name="name"><br>
아이디 : <input type="text" name="id"><br>
비밀번호 :<input type="password" name="pw"><br>
전화번호 : <input type="tel" name="phone"><br>
<label><input type="checkbox" name="19" value="true" required>본인이 19세 이상임을 확인합니다.</label>
<input type="submit" value="회원가입하기">
<button type="button" onclick="window.location.href='MainPage.jsp'">뒤로가기</button>
</form>
</body>
</html>