<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap');
body{
font-family: 'Nanum Gothic', sans-serif;
text-align:center;
background-color: #cdfeff;
}

div{
margin:auto;
background-color:white;
width:800px;
height:1000px;
}

table{
margin:auto;
}
table tr{
width: 300px;
height: 50px;
}

.submit {
  width: 200px;
  height:30px;
}
.btn {
  float: left; /* �÷� �߿� - �÷� ��Ҵ� ������ ����(�帣����)������ ���� ��ҿ� ������ ��ġ�� �ȴ�. */
  width: 100%; /* �θ� 400px ���� ���� 100% ��� */
  text-align: center;
  margin-top: -4px;
  border: 4px solid #2ea7fe;
  background-color: #32b9fe;
  color:white;
  font-size:24px;
  padding-top:22px;
  padding-bottom:22px;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  transition: all 0.3s;
  box-sizing: border-box;
  text-decoration: none;
  font-family: 'Nanum Gothic', sans-serif;
}
.btn:hover {
  /* ��ư�� ���콺 ������ ��쿡 ::after ����� �÷��� �ִϸ��̼��ϱ� ���� ������ ���� */
  background-color: transparent;
  /* or background-color: rgba(0,0,0,0); */
  color: #0B93BD;
}
.submit::after {
  display: block;
  width: 0;
  height: 74px;
  background-color: #fbfbfb;
  -webkit-transition: .3s ease;
  -moz-transition: .3s ease;
  -o-transition: .3s ease;
  -ms-transition: .3s ease;
  transition: .3s ease;
  content: "";
}
</style>
</head>
<body>
<div>
<br><br>
<h1>�α���</h1>
<small>���� ȸ���� �ƴϽö��, <a href="SignUp.jsp">ȸ�������ϱ�</a>�� �����ּ���</small>
<br><br><br>
<form method="post" action="SignInPro.jsp">
<table>
<tr><td>
���̵� </td><td><input type="text" name="id"></td></tr>
<tr><td>��й�ȣ </td><td><input type="password" name="pw"></td></tr>
<tr ></tr>
<tr><td colspan="2"><input class="btn" type="submit" value="�α���"></td></tr>
</table>
<br>
<button type="button" onclick="window.location.href='MainPage.jsp'">�ڷΰ���</button>
</form>
</div>
</body>
</html>