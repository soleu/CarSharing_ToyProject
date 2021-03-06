<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Car.CarDAO"%>
<%@page import="Car.CarDTO"%>
<%@page import="Car.CarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
</head>
<body>
	<h2>예약 신청</h2>
	<%	
	request.setCharacterEncoding("utf-8");
		int no = Integer.parseInt(request.getParameter("no"));
		session.setAttribute("no", no);
		CarDAO dao = CarDAO.getInstance();
		CarDTO car = dao.getCar(no);
		int Day = (int) session.getAttribute("Day");
		long Time = (long) session.getAttribute("Time");
		long price = (long) session.getAttribute("price");

		SimpleDateFormat dfhm = new SimpleDateFormat("MM - dd (ddd)요일  HH : mm");
		String startDate = dfhm.format((Date) session.getAttribute("beginDate"));
		String endDate = dfhm.format((Date) session.getAttribute("finalDate"));
	%>
	<form method="post" action="carReservationPro.jsp">
		<img src="img/<%=car.getImg()%>">
		<%=car.getName()%>
		/
		<%=dao.getOilName(no)%>

		<%=startDate%>
		>
		<%=endDate%>

		총 이용 시간 :
		<%=Day%>일,<%=Time%>시간 사용 <br>
		
		대여 유형 : <label><input type="radio" name="way" value="round">왕복</label>
		 <label><input type="radio" name="way" value="one"> 편도(+7000원) <small>편도는 추가 요금이
				발생됩니다.</small></label>
				<br>
	 대여 위치 : <label><input type="radio" name="rentloc" value="A">A</label> 
	 <label><input type="radio" name="rentloc" value="B"> B</label> 
			<label><input type="radio"name="rentloc" value="C"> C</label> <br>
			
			반납 위치 : <label><input type="radio" name="backloc" value="Z">해당사항 없음</label> 
			<label><input type="radio" name="backloc" value="A">A</label> 
			<label><input type="radio" name="backloc" value="B"> B</label> 
			<label><input type="radio" name="backloc" value="C"> C</label> <small>왕복일시,
			'해당사항 없음'에 체크해주세요.</small><br>
			
			 대여 요금 :<%=price%>원 (편도 요금 별도) <br>
			 <br>
			 <input type="submit" value="예약하기">
	</form>
</body>
</html>