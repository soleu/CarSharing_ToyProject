<%@page import="Car.RentedCar"%>
<%@page import="java.util.Date"%>
<%@page import="Car.CarDAO2"%>
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
CarDAO2 dao=CarDAO2.getInstance();
int no=(int)session.getAttribute("no");
int Day=(int)session.getAttribute("Day");
long Time=(long)session.getAttribute("Time");
long price=(long)session.getAttribute("price");
Date startDate= (Date)session.getAttribute("beginDate");
Date endDate= (Date)session.getAttribute("finalDate");

String way=request.getParameter("way");
if(way.equals("one")){price+=7000;}
String rentloc=request.getParameter("rentloc");
String backloc=request.getParameter("backloc");


int log=(int)session.getAttribute("log");
String id=dao.getUserList().get(log).getId();
RentedCar rsCar=new RentedCar(id,no,startDate,endDate,Day,Time,price,way,rentloc,backloc);
dao.insertReserved(rsCar);
%>
<script>
alert("예약이 완료되었습니다!");
window.location.href="MainPage.jsp";
</script>
</body>
</html>