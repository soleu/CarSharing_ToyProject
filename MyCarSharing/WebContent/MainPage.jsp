<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Car.CarDAO2"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카 셰어링</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@800&family=Lobster&family=Nanum+Gothic&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap');

#title{
font-family: 'Cinzel', serif;
font-size:60px;
color: #00A3D2;
text-align:center;
float:left;
margin: 30px 0 0 0;
}
header a{
margin:90px 50px 0px 0;
padding : 0;
float:right;
font-size:25px;
text-align:center;
color: #00A3D2;
font-family: 'Cinzel', serif;
text-decoration:none;
}
header a:hover{
color:#5050FF
}
header{

}
body{
text-align:center;
background-color:#e7ffff;
}

nav{background-color: white;}
</style>
</head>
<body>
<header >
<a id="title" href="MainPage.jsp?center=main_image.jsp">Car Sharing</a>

<% 
if(session.getAttribute("log")==null){
	session.setAttribute("log",-1);
}
int log=(int)session.getAttribute("log");
if(log==-1){ %>
<a href="SignUp.jsp" >/ Sign Up</a>
<a href="SignIn.jsp"> Sign In</a>
<%}else{
CarDAO2 dao=CarDAO2.getInstance();
String id=dao.getUserList().get(log).getId();
%>
	<a href="Logout.jsp" >Log Out</a>
	<a href="SignUp.jsp" ><%=id %>님, 로그인 중</a>
	<% 
} %>
</header>
<%String center;
if(request.getParameter("center")!=null){
	center=request.getParameter("center");
}
else{
	center="main_image.jsp";
}

%>
<nav>
<jsp:include page="top.jsp"></jsp:include>
</nav>
<section>
<jsp:include page="<%=center %>"></jsp:include>
</section>
</body>
</html>