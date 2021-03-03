<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>

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
  float: left; /* 플롯 중요 - 플롯 요소는 문서상 부유(흐르지만)하지만 다음 요소에 영향을 미치게 된다. */
  width: 100%; /* 부모 400px 영역 안의 100% 사용 */
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
  /* 버튼에 마우스 오버한 경우에 ::after 요소의 컬러를 애니메이션하기 위해 투명도로 변경 */
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
<h1>로그인</h1>
<small>아직 회원이 아니시라면, <a href="SignUp.jsp">회원가입하기</a>를 눌러주세요</small>
<br><br><br>
<form method="post" action="SignInPro.jsp">
<table>
<tr><td>
아이디 </td><td><input type="text" name="id"></td></tr>
<tr><td>비밀번호 </td><td><input type="password" name="pw"></td></tr>
<tr ></tr>
<tr><td colspan="2"><input class="btn" type="submit" value="로그인"></td></tr>
</table>
<br>
<button type="button" onclick="window.location.href='MainPage.jsp'">뒤로가기</button>
</form>
</div>
</body>
</html>