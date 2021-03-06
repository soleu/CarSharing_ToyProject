<%@page import="Car.UserDTO"%>
<%@page import="Car.RentedCar"%>
<%@page import="Car.CarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인 페이지</title>
</head>
<body>
<% 
if((int)session.getAttribute("log")==-1){
	%>
	<script>
	alert("로그인을 먼저 해주세요!");
	window.location.href="MainPage.jsp";
	</script>
	<% 
}
CarDAO dao=CarDAO.getInstance();
RentedCar rc=new RentedCar();
UserDTO user;

int log=(int)session.getAttribute("log");
user=dao.getUser(log);
String id=user.getId();
System.out.println("id : "+id);
if(dao.reservedId(id)==true){
	rc=dao.reservedList.get(id);
	
}else{
	%>
	<script>
	alert("예약 내역이 존재하지 않습니다.");
	window.location.href="MainPage.jsp";
	</script>
	<% 
}

%>
<h2> 예약 확인</h2>
<table>
<tr><td>이름 </td><td><%=user.getName() %></td></tr>
<tr><td>번호 </td><td><%=user.getPhone() %></td></tr>
<tr><td>차랑 번호 </td><td><%=rc.getCarNo() %></td></tr>
<tr><td>대여 날짜 </td><td><%=rc.getBeginDate() %></td></tr>
<tr><td>종료 날짜 </td><td><%=rc.getEndDate() %></td></tr>
<tr><td>대여 기간 </td><td><%=rc.getDay() %>일, <%=rc.getTime() %>시간</td></tr>
<tr><td>대여 방법</td><td><%=rc.getWay() %></td></tr>
<tr><td>대여 위치 </td><td><%=rc.getRentloc() %></td></tr>
<tr><td>반납 위치 </td><td><%=rc.getBackloc() %></td></tr>
</table>
<button type="button" onclick="window.location.href=MainPage.jsp">목록으로</button>
</body>
</html>