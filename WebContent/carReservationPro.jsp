<%@page import="Car.RentedCar"%>
<%@page import="java.util.Date"%>
<%@page import="Car.CarDAO"%>
<%@page import="Car.CarDAO"%>
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
CarDAO dao=CarDAO.getInstance();
int no=(int)session.getAttribute("no");
int Day=(int)session.getAttribute("Day");
long Time=(long)session.getAttribute("Time");
long price=(long)session.getAttribute("price");
Date startDate=(Date)session.getAttribute("beginDate");
Date endDate= (Date)session.getAttribute("finalDate");

System.out.println("no:"+no);

String way=request.getParameter("way");
if(way.equals("one")){price+=7000;}
String rentloc=request.getParameter("rentloc");
String backloc=request.getParameter("backloc");



String id=dao.getUser((int)session.getAttribute("log")).getId();
dao.getRentedCarList().add(new RentedCar(no,startDate,endDate,Day,Time,price,way,rentloc,backloc));
System.out.println("pro.id : "+id);
dao.beReserved(id, dao.getRentedCarList().size()-1);
%>
<script>
alert("예약이 완료되었습니다!");
window.location.href="MainPage.jsp";
</script>
</body>
</html>