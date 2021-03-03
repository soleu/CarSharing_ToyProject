<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*font-family: 'Nanum Gothic', sans-serif;*/
@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@800&family=Lobster&family=Nanum+Gothic&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap');
nav{
margin:0;
font-family: 'Nanum Gothic', sans-serif;
font-size:20px;
color:white;
}

.nav-container{
display:flex;/*가로로 */
flex-direction:row;
width:100%;
height:30px;
margin:0;
padding:0;
list-style-type:none;/* 목록기호 제거*/
background-color:#00A3D2;
color:white;
}

#nav-content{
cursor:pointer;
float: left;
line-height: 30px;
vertical-align: middle;
text-align: center;
width:300px;

}

#nav-content a{
text-align:center;
text-decoration:none;
color:white;
}
</style>
</head>
<body>
<nav> 
<ul class="nav-container">
<li id="nav-content"><a href="MainPage.jsp?center=manual.jsp" ><b>이용 안내</b></a></li>
<li id="nav-content" ><a href="MainPage.jsp?center=carReservation.jsp" ><b>차량 예약</b></a></li>
<li id="nav-content"><a href="MainPage.jsp?center=reservationConfirm.jsp" ><b>예약 확인</b></a></li>
<li id="nav-content"><a href="MainPage.jsp?center=noticeBoard.jsp" ><b>자유 게시판</b></a></li>
<li id="nav-content"><a href="MainPage.jsp?center=CScenter.jsp" ><b>고객 센터</b> </a></li>
</ul>
</nav>
</body>
</html>